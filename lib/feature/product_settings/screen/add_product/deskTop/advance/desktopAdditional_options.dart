import 'package:flutter/cupertino.dart';
import 'package:managment_system/core/commons/addProductWidgets/additionalDescription.dart';
import 'package:managment_system/core/commons/addProductWidgets/additionalTagTitle.dart';
import 'package:managment_system/core/commons/addProductWidgets/specificTags.dart';
import 'package:managment_system/core/global_variables/global_variables.dart';

class DeskTopAdditionalOption extends StatefulWidget {
  const DeskTopAdditionalOption({super.key});

  @override
  State<DeskTopAdditionalOption> createState() => _DeskTopAdditionalOptionState();
}

class _DeskTopAdditionalOptionState extends State<DeskTopAdditionalOption> {
  @override
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            AdditionalTagTitleTextField(totalWidth: width*(0.2),),
            Spacer(),
            SpecificTagContainer(totalWidth: width*(0.2),tagTextSize: width*(0.008),tagContainerSize: width*(0.044),)
          ],
        ),
        SizedBox(height: 10,),
        AdditionalDescriptionTextField(totalWidth: width*(0.4)),
        SizedBox(height: 10,),

      ],
    );
  }
}
