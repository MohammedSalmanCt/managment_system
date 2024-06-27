import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:managment_system/core/commons/storageRepository.dart';
import 'package:managment_system/feature/authentication/controller/auth_controller.dart';
import 'package:managment_system/feature/product_settings/repository/category_repository.dart';
import 'package:managment_system/model/subCategory_model.dart';
import '../../../core/utils.dart';
import '../../../model/category_model.dart';



final categoryControllerProvider = NotifierProvider<CategoryController, bool>(() => CategoryController());

final getCategoriesProvider = StreamProvider.family.autoDispose((ref,String adminId) {
  return ref.watch(categoryControllerProvider.notifier).getCategories(adminId: adminId);
});
final getSubCategoriesProvider = StreamProvider.family.autoDispose((ref,String data) {
  return ref.watch(categoryControllerProvider.notifier).getSubCategories(data: data);
});
class CategoryController extends Notifier<bool>{

  @override
  bool build() {
    return false;
  }

  CategoryRepository get _categoryRepository => ref.read(categoryRepositoryProvider);
  StorageRepository get _storageRepository => ref.read(storageRepositoryProvider);
  /// add Category
  addCategory({required String categoryName,required BuildContext context,
  required XFile image,})
  async {
    final admin=ref.read(adminProvider);
    state=true;
    final storage=await _storageRepository.getImageUrl(storeFolder:"${admin?.name}/Category",image: [image]);
    storage.fold((l) => showSnackBar(context,l.message), (imgUrl) async {
      final category=await _categoryRepository.addCategory(categoryName: categoryName, image: imgUrl[0],adminModel: admin!);
      category.fold((l) => showSnackBar(context, l.message), (r) {
        state = false;
        showSnackBar(context, 'Category Added Successfully');
      });
      Navigator.pop(context);
    } );
  }
  ///  add SubCategory
  addSubCategory({required String categoryName,required BuildContext context,
  required XFile image,required String categoryId})
  async {
    final admin=ref.read(adminProvider);
    state=true;
    final storage=await _storageRepository.getImageUrl(storeFolder:"${admin?.name}/SubCategory",image: [image]);
    storage.fold((l) => showSnackBar(context,l.message), (imgUrl) async {
      final category=await _categoryRepository.addSubCategory(categoryId: categoryId,categoryName: categoryName, image: imgUrl[0],adminModel: admin!);
      category.fold((l) => showSnackBar(context, l.message), (r) {
        state = false;
        showSnackBar(context, 'Subcategory Added Successfully');
      });
      Navigator.pop(context);
    } );
  }
  /// category
Stream<List<CategoryModel>> getCategories({required String adminId}){
   return _categoryRepository.getCategories(adminId: adminId);
}
/// category
Stream<List<SubCategoryModel>> getSubCategories({required String data}){
    Map map=jsonDecode(data);
   return _categoryRepository.getSubCategories(adminId: map["adminId"],categoryId: map["categoryId"]);
}
}