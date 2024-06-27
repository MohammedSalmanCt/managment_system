import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:managment_system/core/commons/error.dart';
import 'package:managment_system/core/commons/loader.dart';
import 'package:managment_system/feature/authentication/controller/auth_controller.dart';
import 'package:managment_system/feature/product_settings/controller/category_controller.dart';
import '../../global_variables/global_variables.dart';
import '../../theme/pallete.dart';

class AddCategoryDropDwn extends StatelessWidget {
  const AddCategoryDropDwn({super.key,required this.totalWidth});
  final double totalWidth;

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Add Category",style: GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
        Consumer(builder: (context, ref, child3) {
          final admin=ref.watch(adminProvider);
        return ref.watch(getCategoriesProvider(admin!.id)).when(data: (categories) {
          Map<String,dynamic> categoryMap={};
          for(var i in categories)
          {
            categoryMap[i.categoryName]=i.id;
          }
          List<String> categoryNames=categoryMap.keys.toList();
           return SizedBox(
             width: totalWidth,
             height: 50,
             child: DropdownButtonFormField(
               validator: (value3) {
                 var val2 = value3 ?? '';
                 if (val2.isEmpty) {
                   return 'Please Category';
                 }
                 return null;
               },
               decoration: InputDecoration(
                   focusColor: Colors.transparent,
                   hoverColor: Colors.transparent,
                   hintText: 'Category',
                   hintStyle:  GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,),
                   enabledBorder:const OutlineInputBorder(
                     borderSide:  BorderSide(
                         color: Pallete.textFieldBorderColor),
                   ),
                   border:const OutlineInputBorder(
                       borderSide:  BorderSide(
                           color: Pallete.textFieldBorderColor)),
                   focusedBorder:const OutlineInputBorder(
                     borderSide:  BorderSide(
                       color: Pallete.textFieldBorderColor,
                     ),
                   ),
                   contentPadding: EdgeInsetsDirectional.only(top:8,start: 10)
               ),
               value: ref.watch(selectCategoryNameProvider),
               onChanged: (String? newValue) {
                 ref.read(selectCategoryNameProvider.notifier)
                     .update((state) => newValue);
                 ref.read(selectCategoryIdProvider.notifier)
                     .update((state) => categoryMap[newValue]);
               },
               items: categoryNames.map<DropdownMenuItem<String>>(
                       (String value) {
                     return DropdownMenuItem<String>(
                       value: value,
                       child: Text(
                         value,
                         style:
                         GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,),
                       ),
                     );
                   }).toList(),
             ),
           );
         },
             error: (error, stackTrace) {
               print(error);
               return ErrorText(error: error.toString());
             }, loading: () => Loader(),);
        }),
        Text("A product can be added to a category",style: GoogleFonts.poppins(fontSize:width*(0.008),color: Pallete.textGreyColor,))
      ],
    );
  }
}
