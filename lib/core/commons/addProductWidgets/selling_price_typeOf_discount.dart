import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/pallete.dart';

class SellingPriceTypeOfDiscount extends StatefulWidget {
  const SellingPriceTypeOfDiscount({super.key,required this.textSize,required this.gridContainerSize,
  required this.gridSize,required this.gridSpacing,required this.gridTextPadding,
  required this.crossAxisCount});
  final double textSize;
  final double gridSize;
  final double gridSpacing;
  final double gridContainerSize;
  final double gridTextPadding;
  final int crossAxisCount;
  @override
  State<SellingPriceTypeOfDiscount> createState() => _SellingPriceTypeOfDiscountState();
}

class _SellingPriceTypeOfDiscountState extends State<SellingPriceTypeOfDiscount> {
  /// list type of product discount
  List<String> typeOfDiscounts=[
    "Fixed Price",
    "Buy 1 Get 1",
    // "Seasonal or Holiday Discount",
    // "Percentage-based Discount",
    // "Volume or Bulk Discount"
  ];
  ///  type of product discount  provider
  final typeDiscountProvider = StateProvider<String?>((ref) {
    return null;
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
     Row(
       children: [
         Text("Types of product discount",style: GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
         Icon(CupertinoIcons.question_circle,color: Pallete.blackColor,),
       ],
     ),
        SizedBox(height: 6,),
        SizedBox(
          width: widget.gridSize,
          child: GridView.builder(
            itemCount: typeOfDiscounts.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 2/1,
              crossAxisCount:widget.crossAxisCount ,
              crossAxisSpacing: widget.gridSpacing,
              mainAxisSpacing: 5,
            ) ,
            itemBuilder: (context, index) {
              return Consumer(
                builder: (context,ref,child) {
                 final discountType=ref.watch(typeDiscountProvider);
                  return InkWell(
                    onTap: () {
                      ref.read(typeDiscountProvider.notifier).update((state) => typeOfDiscounts[index]);
                    },
                    child: Container(
                      decoration: BoxDecoration(border: Border.all(color: discountType==typeOfDiscounts[index]?
                      Pallete.selectedBlueColor:Pallete.homeBackgroundColor),
                      borderRadius: BorderRadius.circular(5),
                      color:  discountType==typeOfDiscounts[index]?
                      Pallete.selectedBlueColor:Pallete.backgroundColor),
                      width: widget.gridContainerSize,
                      child: Center(
                        child: Padding(
                          padding:  EdgeInsets.only(left: widget.gridTextPadding,right:widget.gridTextPadding),
                          child: Text(typeOfDiscounts[index],style: GoogleFonts.poppins(fontSize:widget.textSize,color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
                        ),
                      ),
                    ),
                  );
                }
              );
            },),
        ),
      ],
    );
  }
}
