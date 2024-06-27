import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:managment_system/core/commons/search.dart';
import 'package:managment_system/core/utils.dart';
import 'package:managment_system/feature/authentication/controller/auth_controller.dart';
import 'package:managment_system/feature/product_settings/controller/product_controller.dart';
import 'package:managment_system/feature/product_settings/screen/add_product/deskTop/DeskTop_selling_price.dart';
import 'package:managment_system/feature/product_settings/screen/add_product/deskTop/product_category.dart';
import 'package:managment_system/feature/product_settings/screen/add_product/product_gallery.dart';
import 'package:managment_system/model/product_model.dart';
import '../../../../core/commons/addProductWidgets/nextButton.dart';
import '../../../../core/commons/addProductWidgets/prevButton.dart';
import '../../../../core/global_variables/global_variables.dart';
import '../../../../core/theme/pallete.dart';
import 'TabView/TabView_product_category.dart';
import 'TabView/TabView_selling_price.dart';
import 'deskTop/DeskTop_advance.dart';
import 'add_product_details.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key,required this.device,required this.gap,required this.textSubSize,required this.circleWidth,
  required this.textSize,required this.totalHeight,required this.totalWidth,required this.tabController});
  final double totalWidth;
  final double totalHeight;
  final double circleWidth;
  final double textSize;
  final double textSubSize;
  final double gap;
  final bool device;
  final TabController tabController;


  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> with SingleTickerProviderStateMixin{
  /// add product page names
  List addProductList=[
    {
      "Add Product Details":"Add product name & details"
    },
    {
      "Product Category":"Add product category, status & tags"
    },
    {
      "Selling Prices":"Add product basic price & discount"
    }, {
      "Advance":"Add meta details & inventory detail"
    }, {
      "Product Gallery":"Thumbnail & add product gallery"
    },
  ];
  /// advance section tabController
  TabController? tabController;
  clear({required WidgetRef ref}){
    stockQuantityController.clear();
    skuController.clear();
    initialCost.clear();
    productTitle.clear();
    productDescription.clear();
    sellingPrice.clear();
    additionalTagTitle.clear();
    additionalDescription.clear();
    ref.read(selectCategoryIdProvider.notifier).update((state) =>null);
    ref.read(selectCategoryNameProvider.notifier).update((state) => null);
    ref.read(selectSubCategoryNameProvider.notifier).update((state)=> null);
    ref.read(selectSubCategoryIdProvider.notifier).update((state) => null);
    ref.read(restockDateProvider.notifier).update((state) => null);
    ref.read(stockAvailabilityProvider.notifier).update((state) => null);
    ref.read(typeDiscountProvider.notifier).update((state) => null);
    ref.read(currencyProvider.notifier).update((state) => null);
    ref.read(datePickProvider.notifier).update((state) => null);
    ref.read(publishStatusProvider.notifier).update((state)=>null);
    ref.read(publishStatusProvider.notifier).update((state) => null);
    ref.read(imagePickProvider.notifier).update((state) => []);
  }

  /// add product
  addProduct({required BuildContext context,required ProductModel productModel,required WidgetRef ref,})
{
  final images=ref.read(imagePickProvider);
 ref.watch(productControllerProvider.notifier).addProduct(productModel: productModel, context: context,images: images);
 clear(ref: ref);
}
/// edit product
  editProduct({required BuildContext context,required ProductModel productModel,required WidgetRef ref,})
{
 ref.watch(productControllerProvider.notifier).editProduct(productModel: productModel, context: context);
 clear(ref: ref);
  ref.read(productModelProvider.notifier).update((state) => null);
}
  /// add product page provider
  final addProductPageProvider = StateProvider((ref) {
    return 0;
  });
  @override
  void initState() {
    tabController=TabController(length:2, vsync: this);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context,ref,child) {
        final addProductPageIndex=ref.watch(addProductPageProvider);
       final admin= ref.watch(adminProvider);
        print(addProductPageIndex);
        return Container(
          height: 500,
          color: Pallete.whiteColor,
          width: width,
          child: Row(
            children: [
              SizedBox(
                width: widget.totalWidth,
                height:widget.totalHeight,
                child:Align(
                  alignment: Alignment.center,
                  child: ListView.builder(
                    itemCount:addProductList.length,
                    itemBuilder:(context, index) {
                      var entry = addProductList[index].entries.first;
                      String key = entry.key;
                      String value = entry.value;
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: widget.gap,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: widget.circleWidth,
                                width: widget.circleWidth,
                                decoration: BoxDecoration(
                                    color: index==addProductPageIndex?Pallete.selectedBlueColor:Pallete.whiteColor,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Pallete.textGreyColor,
                                    )
                                ),
                              ),
                              index!=4?SizedBox(
                                  height: 40,
                                  child: DottedLine(
                                    direction: Axis.vertical,
                                    alignment: WrapAlignment.center,
                                    lineThickness: 0.5,
                                    dashLength: 5,
                                    dashColor: Pallete.textGreyColor,
                                    dashRadius: 0.0,
                                    dashGapLength: 5,
                                  )
                              )
                                  :SizedBox()
                            ],
                          ),
                          SizedBox(width: 5,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: 5,),
                              Text(key,style: GoogleFonts.poppins(fontSize:widget.textSize,color: Pallete.textBlueColor,fontWeight: FontWeight.w400,),),
                              Text(value,style: GoogleFonts.poppins(fontSize:widget.textSubSize,color: Pallete.blackColor,fontWeight: FontWeight.w400,))
                            ],
                          )
                        ],
                      );
                    }, ),
                ),
              ),
              SizedBox(width: widget.gap,),
              VerticalDivider(
                endIndent: 60,
                indent: 60,
                color: Pallete.textGreyColor,
                thickness: 1,
              ),
              SizedBox(width: widget.gap,),
              SizedBox(
                width: widget.device? width*(0.435): width*(0.48),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    addProductPageIndex==0 ?SizedBox(
                      child:  widget.device?AddProductDetails(hintTextSize:width*(0.008),productDetailsTextFieldHeight: 200,
                        textFontSize: width*(0.01),device: widget.device,productDescription: productDescription,productTitle: productTitle,)
                          :AddProductDetails(hintTextSize: width*(0.015),device: widget.device,
                        textFontSize: width*(0.02),productDetailsTextFieldHeight: 300,productTitle: productTitle,
                      productDescription: productDescription,),
                    )
                        : addProductPageIndex==1? SizedBox(
                        child: widget.device?AddProductCategory()
                            :TabViewProductCategory()):
                    addProductPageIndex==2?SizedBox(
                      child: widget.device?DeskTopSellingPrice(
                      sellingPrice: sellingPrice,
                      initialCost: initialCost,)
                      :TabViewSellingPrice(
                        sellingPrice: sellingPrice,
                        initialCost: initialCost,),
                    )
                    :addProductPageIndex==3?SizedBox(
                      child: DeskTopAdvance(device: widget.device,tabController: tabController!,
                      additionalDescription: additionalDescription,
                      additionalTagTitle: additionalTagTitle,
                      skuController: skuController,
                      stockQuantityController: stockQuantityController,)
                    )
                    :ProductGallery(device: widget.device,),
                    SizedBox(height: 20,),
                    Divider(color: Pallete.textFieldBorderColor,
                      thickness: 1,
                    ),
                    // SizedBox(height: 15,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Improve product visibility by adding a compelling description.",style: GoogleFonts.poppins(fontSize:width*(0.008),color: Pallete.textGreyColor,
                          fontWeight: FontWeight.w400,),),
                        Spacer(),
                        InkWell(
                            onTap: () {
                              if(addProductPageIndex > 0){
                              if (addProductPageIndex == 3 &&
                                  tabController!.index > 0) {
                                tabController
                                    ?.animateTo(tabController!.index - 1);
                              } else {
                                ref
                                    .read(addProductPageProvider.notifier)
                                    .update((state) => addProductPageIndex - 1);
                              }
                            }
                          },
                            child: PrevButton(device: widget.device,)),
                        SizedBox(width: widget.gap,),
                        InkWell(
                            onTap: () {
                              if(addProductPageIndex<4){
                              if (addProductPageIndex == 3 &&
                                  tabController!.index < 1) {
                                if(ref.watch(stockAvailabilityProvider)==null)
                                {
                                  showSnackBar(context, "Please Choose Stock Availability");
                                }
                                else if(skuController.text.isEmpty){
                                  showSnackBar(context, "Please Add SKU code");
                                }
                                else if(stockQuantityController.text.isEmpty){
                                  showSnackBar(context, "Please Add Stock Quantity");
                                }
                                else if(stockQuantityController.text=="0"){
                                  showSnackBar(context, "Please Enter Valid Stock Quantity");
                                }
                                else if(ref.watch(restockDateProvider)==null){
                                  showSnackBar(context, "Please Choose Restock Date");
                                }
                                else{
                                  tabController
                                      ?.animateTo(tabController!.index + 1);
                                }
                              } else {
                                if(addProductPageIndex==0)
                                  {
                                    if(productTitle.text.isEmpty)
                                      {
                                        showSnackBar(context, "Please Add Product Title");
                                      }
                                    else if(productDescription.text.isEmpty){
                                      showSnackBar(context, "Please Add Message");
                                    }
                                    else{
                                      ref
                                          .read(addProductPageProvider.notifier)
                                          .update((state) => addProductPageIndex + 1);
                                    }
                                  }
                                else if(addProductPageIndex==1){
                                  if(ref.watch(selectCategoryIdProvider)==null)
                                  {
                                    showSnackBar(context, "Please Add Category");
                                  }
                                  else if(ref.watch(selectSubCategoryIdProvider)==null){
                                    showSnackBar(context, "Please Add SubCategory");
                                  }else if(ref.watch(publishStatusProvider)==null){
                                    showSnackBar(context, "Please Choose Status");
                                  }else if(ref.watch(datePickProvider)==null){
                                    showSnackBar(context, "Please Choose Date");
                                  }
                                  else{
                                    ref
                                        .read(addProductPageProvider.notifier)
                                        .update((state) => addProductPageIndex + 1);
                                  }
                                }
                                else if(addProductPageIndex==2){
                                  if(initialCost.text.isEmpty)
                                  {
                                    showSnackBar(context, "Please Add Initial Cost");
                                  }
                                 else if(initialCost.text=="0")
                                  {
                                    showSnackBar(context, "Please Enter Valid Initial Cost");
                                  }
                                  else if(sellingPrice.text.isEmpty){
                                    showSnackBar(context, "Please Add Selling Price");
                                  }
                                  else if(sellingPrice.text=="0"){
                                    showSnackBar(context, "Please Enter Valid SellingPrice");
                                  }
                                  else if(ref.watch(currencyProvider)==null){
                                    showSnackBar(context, "Please Choose Currency");
                                  }
                                  else{
                                    ref
                                        .read(addProductPageProvider.notifier)
                                        .update((state) => addProductPageIndex + 1);
                                  }
                                }
                                else if(addProductPageIndex==3){
                                    ref
                                        .read(addProductPageProvider.notifier)
                                        .update((state) => addProductPageIndex + 1);
                                }
                              }
                            }
                                else {
                                  if(ref.watch(headingProvider)=="Add Product")
                                    {
                                      print("add product");
                                      if(ref.watch(imagePickProvider).isEmpty)
                                      {
                                        showSnackBar(context, "Please Add Images");
                                      }
                                    else  {
                                  final discountType =
                                      ref.read(typeDiscountProvider);
                                  ProductModel productModel = ProductModel(
                                      productTitle: productTitle.text.trim(),
                                      message: productDescription.text.trim(),
                                      categoryId:
                                          ref.read(selectCategoryIdProvider)!,
                                      currencyType: ref.read(currencyProvider)!,
                                      id: "",
                                      subCategoryId: ref
                                          .read(selectSubCategoryIdProvider)!,
                                      adminId: admin!.id,
                                      delete: false,
                                      search: setSearchParam(
                                          "${productTitle.text.trim().toUpperCase()} ${ref.read(selectCategoryNameProvider)}"
                                          "${ref.read(selectSubCategoryNameProvider)}"),
                                      createdTime: DateTime.now(),
                                      publishDate: ref.read(datePickProvider)!,
                                      restockDate:
                                          ref.read(restockDateProvider)!,
                                      images: [],
                                      status: ref.read(publishStatusProvider)!,
                                      initialCost:
                                          double.parse(initialCost.text.trim()),
                                      sellingPrice: double.parse(
                                          sellingPrice.text.trim()),
                                      productStock: "",
                                      discountType: discountType ?? "",
                                      stockAvailability:
                                          ref.read(stockAvailabilityProvider)!,
                                      lowStock: "",
                                      sku: skuController.text.trim(),
                                      stockQuantity: double.parse(
                                          stockQuantityController.text.trim()),
                                      discount: 0,
                                      additionalTagTitle:
                                          additionalTagTitle.text.trim(),
                                      specificTag: "",
                                      additionalDescription:
                                          additionalDescription.text.trim());
                                  addProduct(
                                      context: context,
                                      productModel: productModel,
                                      ref: ref);
                                }
                              }
                                  else{
                                    print("edit prodocy");
                                    if(ref.watch(productEditImageListProvider).isEmpty)
                                    {
                                      showSnackBar(context, "Please Add Images");
                                    }
                                    else{
                                      final product=ref.read(productModelProvider)!;
                                  ProductModel productModel = ProductModel(
                                      productTitle: productTitle.text.trim(),
                                      message: productDescription.text.trim(),
                                      categoryId:
                                          ref.read(selectCategoryIdProvider)!,
                                      currencyType: ref.read(currencyProvider)!,
                                      id: product.id,
                                      subCategoryId: ref
                                          .read(selectSubCategoryIdProvider)!,
                                      adminId: admin!.id,
                                      delete: false,
                                      search: setSearchParam(
                                          "${productTitle.text.trim().toUpperCase()} ${ref.read(selectCategoryNameProvider)}"
                                          "${ref.read(selectSubCategoryNameProvider)}"),
                                      createdTime: DateTime.now(),
                                      publishDate: ref.read(datePickProvider)!,
                                      restockDate:
                                          ref.read(restockDateProvider)!,
                                      images: ref
                                          .read(productEditImageListProvider),
                                      status: ref.read(publishStatusProvider)!,
                                      initialCost:
                                          double.parse(initialCost.text.trim()),
                                      sellingPrice: double.parse(
                                          sellingPrice.text.trim()),
                                      productStock: "",
                                      discountType:
                                          ref.read(typeDiscountProvider)!,
                                      stockAvailability:
                                          ref.read(stockAvailabilityProvider)!,
                                      lowStock: "",
                                      sku: skuController.text.trim(),
                                      stockQuantity: double.parse(
                                          stockQuantityController.text.trim()),
                                      discount: 0,
                                      additionalTagTitle:
                                          additionalTagTitle.text.trim(),
                                      specificTag: "",
                                      additionalDescription:
                                          additionalDescription.text.trim(),
                                  reference: product.reference);
                                  editProduct(
                                      context: context,
                                      productModel: productModel,
                                      ref: ref);
                                }
                                widget.tabController.animateTo(8);
                                ref
                                    .read(
                                        selectedSideMenuIndexProvider.notifier)
                                    .update((state) => 5);
                                ref
                                    .read(selectedSideMenuSubIndexProvider
                                        .notifier)
                                    .update((state) => 2);
                                ref
                                    .read(headingProvider.notifier)
                                    .update((state) => "Product List");
                              }
                            }
                          },
                            child: NextButton(device: widget.device,text: addProductPageIndex==4?"Submit":"Next",))
                      ],
                    )
                  ],),
              ),
              SizedBox(width: widget.gap,)
            ],
          ),
        );
      }
    );
  }
}
