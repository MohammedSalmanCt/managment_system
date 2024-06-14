import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:managment_system/core/global_variables/global_variables.dart';
import '../../../../../core/commons/addProductWidgets/addCategoryDropDown.dart';
import '../../../../../core/commons/addProductWidgets/addTagContainer.dart';
import '../../../../../core/commons/addProductWidgets/createCategoryButton.dart';
import '../../../../../core/commons/addProductWidgets/publishDateAndTime.dart';
import '../../../../../core/commons/addProductWidgets/publishStatusDropDown.dart';

class AddProductCategory extends StatefulWidget {
  const AddProductCategory({super.key});

  @override
  State<AddProductCategory> createState() => _AddProductCategoryState();
}

class _AddProductCategoryState extends State<AddProductCategory> {

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20,),
       Row(
         children: [
           AddCategoryDropDwn(totalWidth: width*(0.2),),
           Spacer(),
           AddTagContainer(totalWidth: width*(0.2),)
         ],
       ),
        SizedBox(height: 20,),
        CreateCategoryButton(onTap: (){},),
        SizedBox(height: 20,),
        Row(
          children: [
            PublishStatusDropDown(totalWidth: width*(0.2),),
            Spacer(),
            PublishDateAndTime(totalWidth: width*(0.2),),
          ],
        ),
        SizedBox(height: 30,),
      ],);
  }
}
