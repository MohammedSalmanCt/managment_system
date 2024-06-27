import 'package:flutter/cupertino.dart';
import 'package:managment_system/core/commons/addProductWidgets/preOrderTextField.dart';
import 'package:managment_system/core/commons/addProductWidgets/restockDate_datePick.dart';
import 'package:managment_system/core/commons/addProductWidgets/sku_textField.dart';
import 'package:managment_system/core/commons/addProductWidgets/stockQuanityTextField.dart';
import 'package:managment_system/core/global_variables/global_variables.dart';
import '../../../../../../core/commons/addProductWidgets/inventoryCheckBox.dart';
import '../../../../../../core/commons/addProductWidgets/lowStock_dropDown.dart';
import '../../../../../../core/commons/addProductWidgets/stock_availability_DropDown.dart';

class DeskTopInventory extends StatefulWidget {
  const DeskTopInventory({super.key,required this.skuController,required this.stockQuantityController});
  final TextEditingController skuController;
  final TextEditingController stockQuantityController;

  @override
  State<DeskTopInventory> createState() => _DeskTopInventoryState();
}

class _DeskTopInventoryState extends State<DeskTopInventory> {
  @override
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            StockAvailabilityDropDown(totalWidth: width*(0.21),),
            // Spacer(),
            // LowStockDropDown(totalWidth: width*(0.21),)
          ],
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SkuTextField(totalWidth: width*(0.13),textSize: width*(0.01),skuController: widget.skuController,),
            StockQuantityTextField(totalWidth: width*(0.13),textSize: width*(0.01),stockQuantityController: widget.stockQuantityController,),
            RestockDate(totalWidth: width*(0.13),textSize: width*(0.01)),
            // PreOrderDateTextField(totalWidth: width*(0.095),textSize: width*(0.01)),
          ],
        ),
        SizedBox(height: 20,),
        InventoryCheckBox(textSize: width*(0.008),checkBoxSize: width*(0.01),subTextSize: width*(0.006),)
      ],
    );
  }
}
