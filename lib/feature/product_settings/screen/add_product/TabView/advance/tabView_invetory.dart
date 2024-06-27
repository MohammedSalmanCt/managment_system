import 'package:flutter/cupertino.dart';
import 'package:managment_system/core/commons/addProductWidgets/preOrderTextField.dart';
import 'package:managment_system/core/commons/addProductWidgets/restockDate_datePick.dart';
import 'package:managment_system/core/commons/addProductWidgets/sku_textField.dart';
import 'package:managment_system/core/commons/addProductWidgets/stockQuanityTextField.dart';
import 'package:managment_system/core/global_variables/global_variables.dart';
import '../../../../../../core/commons/addProductWidgets/inventoryCheckBox.dart';
import '../../../../../../core/commons/addProductWidgets/lowStock_dropDown.dart';
import '../../../../../../core/commons/addProductWidgets/stock_availability_DropDown.dart';

class TabViewInventory extends StatefulWidget {
  const TabViewInventory({super.key,required this.skuController,required this.stockQuantityController});
  final TextEditingController skuController;
  final TextEditingController stockQuantityController;
  @override
  State<TabViewInventory> createState() => _TabViewInventoryState();
}

class _TabViewInventoryState extends State<TabViewInventory> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StockAvailabilityDropDown(totalWidth: width*(0.5),),
        SizedBox(height: 10,),
        // LowStockDropDown(totalWidth: width*(0.5),),
        // SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SkuTextField(totalWidth: width*(0.22),textSize: width*(0.015),skuController: widget.skuController,),
            StockQuantityTextField(totalWidth: width*(0.22),textSize: width*(0.015),stockQuantityController: widget.stockQuantityController,),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
        RestockDate(totalWidth: width*(0.22),textSize: width*(0.015)),
    // PreOrderDateTextField(totalWidth: width*(0.22),textSize: width*(0.015)),
          ],
        ),
        SizedBox(height: 10,),
        InventoryCheckBox(textSize: width*(0.013),checkBoxSize: width*(0.01),subTextSize: width*(0.01),)
      ],
    );
  }
}
