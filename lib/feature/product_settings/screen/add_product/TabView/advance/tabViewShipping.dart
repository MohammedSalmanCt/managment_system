import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:managment_system/core/global_variables/global_variables.dart';
import '../../../../../../core/commons/addProductWidgets/dimensionWidth.dart';
import '../../../../../../core/commons/addProductWidgets/dimensionsLength.dart';
import '../../../../../../core/commons/addProductWidgets/dimnsionHeight.dart';
import '../../../../../../core/commons/addProductWidgets/shippingCity.dart';
import '../../../../../../core/commons/addProductWidgets/shippingClass.dart';
import '../../../../../../core/commons/addProductWidgets/shippingWieght.dart';
import '../../../../../../core/commons/addProductWidgets/shippingZipCode.dart';
import '../../../../../../core/commons/addProductWidgets/stateDropDown.dart';
import '../../../../../../core/theme/pallete.dart';

class TabViewShipping extends StatefulWidget {
  const TabViewShipping({super.key});

  @override
  State<TabViewShipping> createState() => _TabViewShippingState();
}

class _TabViewShippingState extends State<TabViewShipping> {
  @override
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Where can I pick up my order?",style: GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ZipCodeTextField(totalWidth: width*(0.22),),
            ShippingCityTextField(totalWidth: width*(0.22),),
          ],
        ),
        SizedBox(height: 5,),
        ShippingStateDropDown(totalWidth: width*(0.22),),
        SizedBox(height: 10,),
    ShippingWeightTextField(totalWidth: width*(0.5),textSize: width*(0.015),subTextSize: width*(0.01),),
        SizedBox(height: 10,),
    Row(
    children: [
    Text("Dimentions",style: GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
    Icon(CupertinoIcons.question_circle,color: Pallete.blackColor,)
    ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DimensionLengthTextField(totalWidth: width*(0.22),),
        DimensionWidthTextField(totalWidth: width*(0.22),),
      ],
    ),
    SizedBox(height: 5,),
    DimensionHeightTextField(totalWidth: width*(0.22),),
    SizedBox(height: 10,),
    ShippingClassDropDown(totalWidth: width*(0.5),)
      ],
    );
  }
}
