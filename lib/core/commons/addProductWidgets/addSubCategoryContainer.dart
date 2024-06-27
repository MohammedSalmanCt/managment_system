import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../feature/authentication/controller/auth_controller.dart';
import '../../../feature/product_settings/controller/category_controller.dart';
import '../../global_variables/global_variables.dart';
import '../../theme/pallete.dart';
import '../error.dart';
import '../loader.dart';

class AddSubCategoryContainer extends StatelessWidget {
  const AddSubCategoryContainer({super.key,required this.totalWidth,required this.tagContainerSize,
  required this.tagTextSize});
  final double totalWidth;
  final double tagContainerSize;
  final double tagTextSize;

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Add SubCategory",style: GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
        Consumer(builder: (context, ref, child3) {
          print("objectssssssssssssssssssssssssss");
          final admin=ref.watch(adminProvider);
          final categoryId=ref.watch(selectCategoryIdProvider);
          Map map={
            "adminId":admin!.id,
            "categoryId":categoryId
          };
          return categoryId!=null?ref.watch(getSubCategoriesProvider(jsonEncode(map))).when(data: (subCategories) {
            print("aaaaaaaaaaaaaaaaaaaaaaaaaaaa");
            print(subCategories);
            print(subCategories[0].name);
            Map<String,dynamic> categoryMap={};
            for(var i in subCategories)
            {
              categoryMap[i.name]=i.id;
            }
            List<String> categoryNames=categoryMap.keys.toList();
            return SizedBox(
              width: totalWidth,
              height: 50,
              child:DropdownButtonFormField(
                decoration: InputDecoration(
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    hintText: 'SubCategory',
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
                value: ref.watch(selectSubCategoryNameProvider),
                onChanged: (String? newValue) {
                  ref.read(selectSubCategoryNameProvider.notifier)
                      .update((state) => newValue);
                  ref.read(selectSubCategoryIdProvider.notifier)
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
            }, loading: () => Loader(),)
          :SizedBox();
        }),
        Text("",style: GoogleFonts.poppins(fontSize:width*(0.008),color: Pallete.textGreyColor,))
      ],
    );
  }
}
