import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:managment_system/model/product_model.dart';

double height = 0.0;
double width = 0.0;

/// date picker
Future<void> selectedToDate(
    {required BuildContext context, required WidgetRef ref,required String text}) async {
  final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2035, 8));
  if(text=="Publish Date & Time"){
    if (picked != null && picked != ref.read(datePickProvider)) {
      ref.read(datePickProvider.notifier).update((state) =>
          DateTime(picked.year, picked.month, picked.day, 23, 59, 59));
    }
  }
  else{
    if (picked != null && picked != ref.read(restockDateProvider)) {
      ref.read(restockDateProvider.notifier).update((state) =>
          DateTime(picked.year, picked.month, picked.day, 23, 59, 59));
    }
  }
}
/// side menu index
final selectedSideMenuIndexProvider = StateProvider<int>((ref) {
  return 1;
});
/// side menu sub index
final selectedSideMenuSubIndexProvider = StateProvider<int>((ref) {
  return 0;
});
/// heading
final headingProvider = StateProvider<String>((ref) {
  return "DashBoard";
});
/// function type
typedef TapCallback = void Function();
/// image pick provider
final imagePickProvider = StateProvider<List<XFile>>((ref) {
  return [];
});

/// product adding
/// Add Product TextFieldControllers
TextEditingController initialCost=TextEditingController();
TextEditingController productTitle=TextEditingController();
TextEditingController productDescription=TextEditingController();
TextEditingController sellingPrice=TextEditingController();
TextEditingController skuController=TextEditingController();
TextEditingController additionalTagTitle=TextEditingController();
TextEditingController additionalDescription=TextEditingController();
TextEditingController stockQuantityController=TextEditingController();
/// category providers
final selectCategoryIdProvider = StateProvider<String?>((ref) {
  return null;
});
final selectCategoryNameProvider = StateProvider<String?>((ref) {
  return null;
});
/// category providers
final selectSubCategoryIdProvider = StateProvider<String?>((ref) {
  return null;
});
final selectSubCategoryNameProvider = StateProvider<String?>((ref) {
  return null;
});
/// publish status provider
final publishStatusProvider = StateProvider<String?>((ref) {
  return null;
});
/// publish date pick
final datePickProvider = StateProvider<DateTime?>((ref) {
  return null;
});
/// currency provider
final currencyProvider = StateProvider<String?>((ref) {
  return null;
});
///  type of product discount  provider
final typeDiscountProvider = StateProvider<String?>((ref) {
  return null;
});
/// stock availability provider
final stockAvailabilityProvider = StateProvider<String?>((ref) {
  return null;
});
/// restock Date
final restockDateProvider = StateProvider<DateTime?>((ref) {
  return null;
});
/// product Model Provide
final productModelProvider = StateProvider<ProductModel?>((ref) {
  return null;
});
final productEditImageListProvider = StateProvider<List<String>>((ref) {
  return [];
});