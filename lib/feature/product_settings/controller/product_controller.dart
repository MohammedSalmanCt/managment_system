import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:managment_system/core/commons/storageRepository.dart';
import 'package:managment_system/feature/product_settings/repository/product_repository.dart';
import 'package:managment_system/model/subCategory_model.dart';
import '../../../core/utils.dart';
import '../../../model/category_model.dart';
import '../../../model/product_model.dart';
import '../../authentication/controller/auth_controller.dart';

final productControllerProvider = NotifierProvider<ProductController, bool>(() => ProductController());
final getProductsProvider = StreamProvider.family.autoDispose((ref,String data) {
  return ref.watch(productControllerProvider.notifier).getProducts(data: data);
});
class ProductController extends Notifier<bool>{

  @override
  bool build() {
    return false;
  }

  ProductRepository get _productRepository => ref.read(productRepositoryProvider);
  StorageRepository get _storageRepository => ref.read(storageRepositoryProvider);

  /// add Product
  addProduct({required ProductModel productModel,required BuildContext context,
  required List<XFile> images})
  async {
    final admin =ref.read(adminProvider);
    state=true;
     final storage=await _storageRepository.getImageUrl(storeFolder: "${admin?.name}/Product", image: images);
     storage.fold((l) => showSnackBar(context, l.message), (imgUrls) async {
       final product=await _productRepository.addProduct(product: productModel,images: imgUrls);
       product.fold((l) => showSnackBar(context, l.message), (r) {
         state = false;
         showSnackBar(context, 'Product Added Successfully');
       });
       Navigator.pop(context);
     });
  }
  /// edit Product
  editProduct({required ProductModel productModel,required BuildContext context})
  async {
    state=true;
       final product=await _productRepository.editProduct(product: productModel);
       product.fold((l) => showSnackBar(context, l.message), (r) {
         state = false;
         showSnackBar(context, 'Product edited Successfully');
       });
       Navigator.pop(context);
  }

  /// delete Product
  deleteProduct({required ProductModel productModel,required BuildContext context,})
   async {
    state=true;
       final product=await _productRepository.deleteProduct(productModel: productModel);
       product.fold((l) {
         showSnackBar(context, l.message);
         print(l.message);
       }, (r) {
         showSnackBar(context, 'Product Deleted Successfully');
         state = false;
       });
  }
  /// restore Product
  restoreProduct({required ProductModel productModel,required BuildContext context,})
   async {
    state=true;
       final product=await _productRepository.restoreProduct(productModel: productModel);
       product.fold((l) {
         showSnackBar(context, l.message);
         print(l.message);
       }, (r) {
         showSnackBar(context, 'Product Restored Successfully');
         state = false;
       });
  }

  /// product
  Stream<List<ProductModel>> getProducts({required String data}){
    Map map=jsonDecode(data);
    return _productRepository.getProducts(adminId: map["adminId"],search:map["search"],delete: map["delete"]);
  }
  /// get category model
  Future<CategoryModel> getCategory({required String categoryId,required String adminId}) async {
    return await _productRepository.getCategory(categoryId: categoryId, adminId: adminId);
  }
  /// get subCategory model
  Future<SubCategoryModel> getSubCategory({required String subCategoryId,required String adminId}) async {
    return await _productRepository.getSubCategory(subCategoryId: subCategoryId, adminId: adminId);
  }
}