import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:managment_system/core/commons/search.dart';
import 'package:managment_system/core/type_def.dart';
import 'package:managment_system/model/admin_model.dart';
import 'package:managment_system/model/subCategory_model.dart';
import '../../../core/constants/firebase_constants.dart';
import '../../../core/failure.dart';
import '../../../core/providers/firebase_providers.dart';
import '../../../model/category_model.dart';
import '../../../model/settings_model.dart';


final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
  return CategoryRepository(firestore: ref.watch(firestoreProvider));
});

class CategoryRepository{
  final FirebaseFirestore _firestore;
  CategoryRepository({required FirebaseFirestore firestore}):_firestore=firestore;

  CollectionReference get _admin => _firestore.collection(FirebaseConstants.adminCollections);
  DocumentReference get _settings => _firestore.collection(FirebaseConstants.settingsCollections).doc(FirebaseConstants.settingsCollections);
  /// Add category
FutureVoid addCategory({required String categoryName,required String image,required AdminModel adminModel}) async {
   try{
     /// Auto Increment category Id
     int count=0;
     DocumentSnapshot settings = await _settings.get();
     SettingSModel settingsModel = SettingSModel.fromMap(settings.data() as Map<String,dynamic>);
     SettingSModel set = settingsModel.copyWith(categoryId: settingsModel.categoryId+1);
     await _settings.update(set.toMap());
     count=int.tryParse(settingsModel.categoryId.toString())!;
     var i=Timestamp.now().millisecondsSinceEpoch;
     String docId = 'lmtca$count$i'.toString();
     String id=docId.substring(0,15);
     DocumentReference reference = _admin.doc(adminModel.id).collection(FirebaseConstants.categoryCollections).doc(id);
     CategoryModel categoryModel=CategoryModel(
       adminId: adminModel.id,
         categoryName: categoryName,
         id: id,
         delete: false,
         search: setSearchParam(categoryName.toUpperCase().trim()),
         createdTime: DateTime.now(),
         image: image,
         status: 0,
         reference: reference);
     return right(await reference.set(categoryModel.toMap()));
   }
   on FirebaseException catch (em) {
     throw em.message!;
   }
   catch (e) {
     return left(Failure(e.toString()));
   }
 }

 /// Add subCategory
FutureVoid addSubCategory({required String categoryName,required String image,required String categoryId,
required AdminModel adminModel}) async {
   try{
     /// Auto Increment subCategory Id
     int count=0;
     DocumentSnapshot settings = await _settings.get();
     SettingSModel settingsModel = SettingSModel.fromMap(settings.data() as Map<String,dynamic>);
     SettingSModel set = settingsModel.copyWith(subCategoryId: settingsModel.subCategoryId+1);
     await _settings.update(set.toMap());
     count=int.tryParse(settingsModel.subCategoryId.toString())!;
     var i=Timestamp.now().millisecondsSinceEpoch;
     String docId = 'lmtsubca$count$i'.toString();
     String id=docId.substring(0,15);
     DocumentReference reference = _admin.doc(adminModel.id).collection(FirebaseConstants.subCategoryCollections).doc(id);
     SubCategoryModel subCategory=SubCategoryModel(name: categoryName,
         id: id,
         adminId: adminModel.id,
         delete: false,
         search: setSearchParam(categoryName.toUpperCase().trim()),
         createdTime: DateTime.now(),
         image: image,
         categoryId: categoryId,
         status: 0,
         reference: reference);
     return right(await reference.set(subCategory.toMap()));
   }
   on FirebaseException catch (em) {
     throw em.message!;
   }
   catch (e) {
     return left(Failure(e.toString()));
   }
 }

 /// category Stream
Stream<List<CategoryModel>> getCategories({required String adminId}){
  return _admin.doc(adminId).collection(FirebaseConstants.categoryCollections).where("delete",isEqualTo: false)
      .orderBy("createdTime",descending: true).snapshots().map((event) {
    List<CategoryModel> categoryList=[];
    for(var i in event.docs)
      {
        categoryList.add(CategoryModel.fromMap(i.data()));
      }
    return categoryList;
  } );
}
/// subCategory Stream
Stream<List<SubCategoryModel>> getSubCategories({required String adminId,required String categoryId}){
  return _admin.doc(adminId).collection(FirebaseConstants.subCategoryCollections).where("delete",isEqualTo: false)
      .orderBy("createdTime",descending: true).where("categoryId",isEqualTo: categoryId).snapshots().map((event) {
    List<SubCategoryModel> subCategoryList=[];
    for(var i in event.docs)
      {
        subCategoryList.add(SubCategoryModel.fromMap(i.data()));
      }
    return subCategoryList;
  } );
}
}