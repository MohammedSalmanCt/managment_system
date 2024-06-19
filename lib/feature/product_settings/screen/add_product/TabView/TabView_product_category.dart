import 'package:flutter/cupertino.dart';
import '../../../../../core/commons/addProductWidgets/addCategoryDropDown.dart';
import '../../../../../core/commons/addProductWidgets/addTagContainer.dart';
import '../../../../../core/commons/addProductWidgets/createCategoryButton.dart';
import '../../../../../core/commons/addProductWidgets/publishDateAndTime.dart';
import '../../../../../core/commons/addProductWidgets/publishStatusDropDown.dart';
import '../../../../../core/global_variables/global_variables.dart';

class TabViewProductCategory extends StatelessWidget {
  const TabViewProductCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20,),
        AddCategoryDropDwn(totalWidth: width*(0.5),),
        SizedBox(height: 20,),
        AddTagContainer(totalWidth: width*(0.5),tagContainerSize: width*(0.1),tagTextSize: width*(0.015),),
        SizedBox(height: 20,),
        CreateCategoryButton(onTap: (){},),
        SizedBox(height: 20,),
        PublishStatusDropDown(totalWidth: width*(0.5),),
        SizedBox(height: 20,),
        PublishDateAndTime(totalWidth: width*(0.5),),
        SizedBox(height: 30,),
      ],);
  }
}
