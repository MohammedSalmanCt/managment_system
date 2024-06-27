import 'package:flutter/cupertino.dart';
import 'package:managment_system/core/commons/addProductWidgets/cooseCurrencyDropDown.dart';
import 'package:managment_system/core/commons/addProductWidgets/initial_cost.dart';
import 'package:managment_system/core/commons/addProductWidgets/product_stoct_TextField.dart';
import 'package:managment_system/core/commons/addProductWidgets/selling_price.dart';
import '../../../../../core/commons/addProductWidgets/selling_price_typeOf_discount.dart';
import '../../../../../core/global_variables/global_variables.dart';

class DeskTopSellingPrice extends StatefulWidget {
  const DeskTopSellingPrice({super.key,required this.initialCost,required this.sellingPrice});
  final TextEditingController initialCost;
  final TextEditingController sellingPrice;

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
            InitialCostTextField(totalWidth: width*(0.2),initialCost: widget.initialCost,),
            Spacer(),
            SellingPriceTextField(totalWidth: width*(0.2),sellingPrice: widget.sellingPrice,)
          ],
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ChooseCurrencyDropDown(totalWidth: width*(0.2),),
            // Spacer(),
            // ProductStockTextField(totalWidth: width*(0.2),productStock: widget.productStock,),
          ],
        ),
        SizedBox(height: 20,),
        SellingPriceTypeOfDiscount(textSize: width*(0.008),
        gridContainerSize: width*(0.08),crossAxisCount: 5,
        gridSize: width*(0.435),gridSpacing: width*(0.01),
        gridTextPadding: width*(0.008),),
        SizedBox(height: 30,),
      ],);
  }
}
