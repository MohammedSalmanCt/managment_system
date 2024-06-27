import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:managment_system/core/global_variables/global_variables.dart';
import '../../../../../core/commons/addProductWidgets/addCategoryDropDown.dart';
import '../../../../../core/commons/addProductWidgets/addSubCategoryContainer.dart';
import '../../../../../core/commons/addProductWidgets/createCategoryButton.dart';
import '../../../../../core/commons/addProductWidgets/publishDateAndTime.dart';
import '../../../../../core/commons/addProductWidgets/publishStatusDropDown.dart';
import '../addCategoryAlert.dart';

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
           AddSubCategoryContainer(totalWidth: width*(0.2),tagTextSize: width*(0.008),tagContainerSize: width*(0.044),)
         ],
       ),
        SizedBox(height: 20,),
        Row(
          children: [
            Consumer(
                builder: (context,ref,child) {
                  return CreateCategoryButton(onTap: (){
                    addCategoryAlertBox(context: context,ref: ref,text: "Category");
                  },
                  text: "New Category",);
                }
            ),
            Spacer(),
            Consumer(
                builder: (context,ref,child) {
                  return CreateCategoryButton(onTap: (){
                    addCategoryAlertBox(context: context,ref: ref,text: "SubCategory");
                  },
                  text: "SubCategory",);
                }
            ),
          ],
        ),
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
