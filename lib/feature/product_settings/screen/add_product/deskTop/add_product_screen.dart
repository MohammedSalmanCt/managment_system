import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:managment_system/feature/product_settings/screen/add_product/deskTop/DeskTop_selling_price.dart';
import 'package:managment_system/feature/product_settings/screen/add_product/deskTop/product_category.dart';
import '../../../../../core/commons/addProductWidgets/nextButton.dart';
import '../../../../../core/global_variables/global_variables.dart';
import '../../../../../core/theme/pallete.dart';
import '../TabView/TabView_product_category.dart';
import 'add_product_details.dart';

/// add product page provider
final addProductPageProvider = StateProvider((ref) {
  return 0;
});
class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key,required this.device,required this.gap,required this.textSubSize,required this.circleWidth,
  required this.textSize,required this.totalHeight,required this.totalWidth});
  final double totalWidth;
  final double totalHeight;
  final double circleWidth;
  final double textSize;
  final double textSubSize;
  final double gap;
  final bool device;

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
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
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context,ref,child) {
        final addProductPageIndex=ref.watch(addProductPageProvider);
        print(addProductPageIndex);
        return Container(
          color: Pallete.whiteColor,
          width: width,
          child: Row(
            children: [
              Container(
                width: widget.totalWidth,
                height:widget.totalHeight,
                child:Align(
                  alignment: Alignment.center,
                  child: ListView.builder(
                    itemCount:4,
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
                              index!=3?SizedBox(
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
                        textFontSize: width*(0.01),device: widget.device,)
                          :AddProductDetails(hintTextSize: width*(0.015),device: widget.device,
                        textFontSize: width*(0.02),productDetailsTextFieldHeight: 300,),
                    )
                        : addProductPageIndex==1? SizedBox(
                        child: widget.device?AddProductCategory()
                            :TabViewProductCategory()):
                    addProductPageIndex==2?SizedBox(
                      child: widget.device?DeskTopSellingPrice()
                      :SizedBox(),
                    )
                    :SizedBox(),
                    SizedBox(height: 20,),
                    Divider(color: Pallete.textFieldBorderColor,
                      thickness: 1,
                    ),
                    SizedBox(height: 15,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Improve product visibility by adding a compelling description.",style: GoogleFonts.poppins(fontSize:width*(0.008),color: Pallete.textGreyColor,
                          fontWeight: FontWeight.w400,),),
                        Spacer(),
                        InkWell(
                            onTap: () {
                              ref.read(addProductPageProvider.notifier).update((state) => addProductPageIndex-1);
                            },
                            child: NextButton(text: "Prev", icon: Icons.arrow_back,device: widget.device,)),
                        SizedBox(width: widget.gap,),
                        InkWell(
                            onTap: () {
                              ref.read(addProductPageProvider.notifier).update((state) => addProductPageIndex+1);
                            },
                            child: NextButton(text: "Next", icon: Icons.arrow_forward,device: widget.device,))
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
