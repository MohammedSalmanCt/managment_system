import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:managment_system/model/category_model.dart';
import 'package:managment_system/model/subCategory_model.dart';
import '../../../../core/global_variables/global_variables.dart';
import '../../../../core/theme/pallete.dart';
import '../../../../model/product_model.dart';
import '../../controller/product_controller.dart';
/// delete product
deleteProduct({required ProductModel productModel,required WidgetRef ref,required BuildContext context}){
  ref.read(productControllerProvider.notifier).deleteProduct(productModel: productModel, context: context);
  Navigator.pop(context);
}
/// delete product
restoreProduct({required ProductModel productModel,required WidgetRef ref,required BuildContext context}){
  ref.read(productControllerProvider.notifier).restoreProduct(productModel: productModel, context: context);
  Navigator.pop(context);
}
/// edit page Navigate
 editPageNavigate({required WidgetRef ref,required TabController tabController,required ProductModel product,
 required BuildContext context}) async {
  CategoryModel categoryModel=await ref.read(productControllerProvider.notifier).getCategory(categoryId: product.categoryId, adminId: product.adminId);
  SubCategoryModel subCategoryModel=await ref.read(productControllerProvider.notifier).getSubCategory(subCategoryId: product.subCategoryId, adminId: product.adminId);
   tabController.animateTo(7);
   ref.read(selectedSideMenuIndexProvider.notifier).update((state) => 5);
   ref.read(selectedSideMenuSubIndexProvider.notifier).update((state) => 1);
   ref.read(headingProvider.notifier).update((state) => "Edit Product");
   stockQuantityController.text=product.stockQuantity.toString();
   skuController.text=product.sku;
   initialCost.text=product.initialCost.toString();
   productTitle.text=product.productTitle;
   productDescription.text=product.message;
   sellingPrice.text=product.sellingPrice.toString();
   additionalTagTitle.text=product.additionalTagTitle;
   additionalDescription.text=product.additionalDescription;
   ref.read(selectCategoryIdProvider.notifier).update((state) => product.categoryId);
   ref.read(selectCategoryNameProvider.notifier).update((state) => categoryModel.categoryName);
   ref.read(selectSubCategoryNameProvider.notifier).update((state) => subCategoryModel.name);
   ref.read(selectSubCategoryIdProvider.notifier).update((state) => product.subCategoryId);
   ref.read(restockDateProvider.notifier).update((state) => product.restockDate);
   ref.read(stockAvailabilityProvider.notifier).update((state) => product.stockAvailability);
   ref.read(typeDiscountProvider.notifier).update((state) => product.discountType);
   ref.read(currencyProvider.notifier).update((state) => product.currencyType);
   ref.read(datePickProvider.notifier).update((state) => product.publishDate);
   ref.read(publishStatusProvider.notifier).update((state) => product.status);
   ref.read(publishStatusProvider.notifier).update((state) => product.status);
   ref.read(productEditImageListProvider.notifier).update((state) => product.images);
   ref.read(productModelProvider.notifier).update((state) => product);
   Navigator.pop(context);
 }
/// Product action alertBox
void actionProductAlert(
    { required ProductModel productModel,required BuildContext context,required WidgetRef ref,
    required String actionText, TabController? tabController}) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context1) => AlertDialog(
        actionsAlignment: MainAxisAlignment.center,
        backgroundColor: Pallete.whiteColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),
        // actionsPadding: EdgeInsets.only(bottom: height * 0.05),
        content: Container(
          height: height * 0.15,
          width: width * 0.25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Pallete.whiteColor,
          ),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Are you sure $actionText this \n Product ?',style: GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400),),
            ],
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(width * 0.11, height * 0.06),
              backgroundColor: Pallete.whiteColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: Pallete.textFieldBorderColor)),
            ),
            child:const Text(
              'Cancel',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Pallete.blackColor),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if(actionText=="Delete"){
                    deleteProduct(
                        productModel: productModel, ref: ref, context: context);
                  }
              else if(actionText=="Restore")
                {
                  restoreProduct(productModel: productModel, ref: ref, context: context);
                }
              else{
                editPageNavigate(ref: ref,product: productModel,tabController: tabController!,
                context: context);
              }
                },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(width * 0.11, height * 0.06),
              backgroundColor: Pallete.whiteColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: Pallete.textFieldBorderColor)),
            ),
            child:  Text(
              actionText,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Pallete.blackColor),
            ),
          ),
        ],
      )
  );
}