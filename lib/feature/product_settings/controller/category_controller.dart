import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:managment_system/feature/product_settings/repository/category_repository.dart';



final categoryControllerProvider = NotifierProvider<CategoryController, bool>(() => CategoryController());
class CategoryController extends Notifier<bool>{

  @override
  bool build() {
    return false;
  }

  CategoryRepository get _categoryRepository => ref.read(categoryRepositoryProvider);


}