import 'package:flutter/cupertino.dart';
import 'package:managment_system/core/commons/addProductWidgets/cooseCurrencyDropDown.dart';
import 'package:managment_system/core/commons/addProductWidgets/initial_cost.dart';
import 'package:managment_system/core/commons/addProductWidgets/product_stoct_TextField.dart';
import 'package:managment_system/core/commons/addProductWidgets/selling_price.dart';

import '../../../../../core/global_variables/global_variables.dart';

class DeskTopSellingPrice extends StatefulWidget {
  const DeskTopSellingPrice({super.key});

  @override
  State<DeskTopSellingPrice> createState() => _DeskTopSellingPriceState();
}

class _DeskTopSellingPriceState extends State<DeskTopSellingPrice> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20,),
        Row(
          children: [
            InitialCostTextField(totalWidth: width*(0.2),),
            Spacer(),
            SellingPriceTextField(totalWidth: width*(0.2),)
          ],
        ),
        SizedBox(height: 20,),
        Row(
          children: [
            ChooseCurrencyDropDown(totalWidth: width*(0.2),),
            Spacer(),
            ProductStockTextField(totalWidth: width*(0.2),),
          ],
        ),
        SizedBox(height: 30,),
      ],);
  }
}