import 'package:flutter/cupertino.dart';
import 'package:managment_system/core/commons/addProductWidgets/cooseCurrencyDropDown.dart';
import 'package:managment_system/core/commons/addProductWidgets/initial_cost.dart';
import 'package:managment_system/core/commons/addProductWidgets/product_stoct_TextField.dart';
import 'package:managment_system/core/commons/addProductWidgets/selling_price.dart';
import '../../../../../core/commons/addProductWidgets/selling_price_typeOf_discount.dart';
import '../../../../../core/global_variables/global_variables.dart';

class TabViewSellingPrice extends StatefulWidget {
  const TabViewSellingPrice({super.key});

  @override
  State<TabViewSellingPrice> createState() => _TabViewSellingPriceState();
}

class _TabViewSellingPriceState extends State<TabViewSellingPrice> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20,),
        InitialCostTextField(totalWidth: width*(0.5),),
        SizedBox(height: 20,),
        SellingPriceTextField(totalWidth: width*(0.5),),
        SizedBox(height: 20,),
        ChooseCurrencyDropDown(totalWidth: width*(0.5),),
        SizedBox(height: 20,),
        ProductStockTextField(totalWidth: width*(0.5),),
        SizedBox(height: 20,),
        SellingPriceTypeOfDiscount(textSize: width*(0.012),
          gridContainerSize: width*(0.008),
          crossAxisCount: 4,
          gridSize: width*(0.5),gridSpacing: width*(0.015),
          gridTextPadding: width*(0.01),),
        SizedBox(height: 5,),
      ],);
  }
}
