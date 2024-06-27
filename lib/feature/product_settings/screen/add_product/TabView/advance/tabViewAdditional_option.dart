import 'package:flutter/cupertino.dart';
import 'package:managment_system/core/commons/addProductWidgets/additionalDescription.dart';
import 'package:managment_system/core/commons/addProductWidgets/additionalTagTitle.dart';
import 'package:managment_system/core/commons/addProductWidgets/specificTags.dart';
import 'package:managment_system/core/global_variables/global_variables.dart';

class TabViewAdditionalOption extends StatefulWidget {
  const TabViewAdditionalOption({super.key,required this.additionalDescription,required this.additionalTagTitle});
  final TextEditingController additionalTagTitle;
  final TextEditingController additionalDescription;

  @override
  State<TabViewAdditionalOption> createState() => _TabViewAdditionalOptionState();
}

class _TabViewAdditionalOptionState extends State<TabViewAdditionalOption> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AdditionalTagTitleTextField(totalWidth: width*(0.5),additionalTagTitle: widget.additionalTagTitle,),
        SizedBox(height: 20,),
        SpecificTagContainer(totalWidth: width*(0.5),tagContainerSize: width*(0.08),tagTextSize: width*(0.01)),
        SizedBox(height: 20,),
        AdditionalDescriptionTextField(totalWidth: width*(0.5),additionalDescription: widget.additionalDescription,),
        SizedBox(height: 20,),
      ],
    );
  }
}
