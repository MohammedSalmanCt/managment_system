import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:managment_system/core/type_def.dart';
import 'package:managment_system/model/category_model.dart';
import 'package:managment_system/model/product_model.dart';
import 'package:managment_system/model/subCategory_model.dart';
import '../../../core/constants/firebase_constants.dart';
import '../../../core/failure.dart';
import '../../../core/providers/firebase_providers.dart';
import '../../../model/settings_model.dart';


final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepository(firestore: ref.watch(firestoreProvider));
});

class ProductRepository{
  final FirebaseFirestore _firestore;
  ProductRepository({required FirebaseFirestore firestore}):_firestore=firestore;

  CollectionReference get _admin => _firestore.collection(FirebaseConstants.adminCollections);
  DocumentReference get _settings => _firestore.collection(FirebaseConstants.settingsCollections).doc(FirebaseConstants.settingsCollections);
  /// Add product
  FutureVoid addProduct({required ProductModel product,required List<String> images}) async {
    try{
      /// Auto Increment product Id
      int count=0;
      DocumentSnapshot settings = await _settings.get();
      SettingSModel settingsModel = SettingSModel.fromMap(settings.data() as Map<String,dynamic>);
      SettingSModel set = settingsModel.copyWith(productId: settingsModel.productId+1);
      await _settings.update(set.toMap());
      count=int.tryParse(settingsModel.productId.toString())!;
      var i=Timestamp.now().millisecondsSinceEpoch;
      String docId = 'lmtp$count$i'.toString();
      String id=docId.substring(0,15);
      DocumentReference reference = _admin.doc(product.adminId).collection(FirebaseConstants.productCollections).doc(id);
      ProductModel productModel=product.copyWith(id: id,reference: reference,images: images);
      return right(await reference.set(productModel.toMap()));
    }
    on FirebaseException catch (em) {
      throw em.message!;
    }
    catch (e) {
      return left(Failure(e.toString()));
    }
  }

  /// edit product
  FutureVoid editProduct({required ProductModel product}) async {
    try{
      return right(await product.reference!.update(product.toMap()));
    }
    on FirebaseException catch (em) {
      throw em.message!;
    }
    catch (e) {
      return left(Failure(e.toString()));
    }
  }

  /// delete product
  FutureVoid deleteProduct({required ProductModel productModel}) async {
    try {
      ProductModel  product =  productModel.copyWith(delete: true);
      return right(await productModel.reference!.update(product.toMap()));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (error) {
      return left(Failure(error.toString()));
    }
  }

  /// restore product
  FutureVoid restoreProduct({required ProductModel productModel}) async {
    try {
      ProductModel  product =  productModel.copyWith(delete: false);
      return right(await productModel.reference!.update(product.toMap()));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (error) {
      return left(Failure(error.toString()));
    }
  }

  /// product Stream
  Stream<List<ProductModel>> getProducts({required String adminId,required String search,required bool delete}){
    print(search);
    return _admin.doc(adminId).collection(FirebaseConstants.productCollections).where("delete",isEqualTo: delete)
        .where('search', arrayContains: search.isEmpty ? null : search.toUpperCase().trim())
    .orderBy("createdTime",descending: true).snapshots().map((event) {
      List<ProductModel> ProductList=[];
      for(var i in event.docs)
      {
        ProductList.add(ProductModel.fromMap(i.data()));
      }
      return ProductList;
    } );
  }
  /// get category model
  Future<CategoryModel> getCategory({required String categoryId,required String adminId}) async {
    DocumentSnapshot snapshot=await _admin.doc(adminId).collection(FirebaseConstants.categoryCollections).doc(categoryId).get();
    CategoryModel categoryModel=CategoryModel.fromMap(snapshot.data() as Map<String,dynamic>);
    return categoryModel;
   }
   /// get sub category model
  Future<SubCategoryModel> getSubCategory({required String subCategoryId,required String adminId}) async {
    DocumentSnapshot snapshot=await _admin.doc(adminId).collection(FirebaseConstants.subCategoryCollections).doc(subCategoryId).get();
    SubCategoryModel subCategoryModel=SubCategoryModel.fromMap(snapshot.data() as Map<String,dynamic>);
    return subCategoryModel;
   }
}