import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../global_variables/global_variables.dart';
import '../../theme/pallete.dart';

class AddCategoryDropDwn extends StatelessWidget {
  const AddCategoryDropDwn({super.key,required this.totalWidth});
  final double totalWidth;

  @override
  Widget build(BuildContext context) {
    /// category provider
    final categoryProvider = StateProvider<String?>((ref) {
      return null;
    });
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Add Category",style: GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
        Consumer(builder: (context, ref, child3) {
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
              value: ref.watch(categoryProvider),
              onChanged: (String? newValue) {
                ref.read(categoryProvider.notifier)
                    .update((state) => newValue);
              },
              items: <String>[
                'Toys & Games',
                'Electronics',
              ].map<DropdownMenuItem<String>>(
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
        }),
        Text("A product can be added to a category",style: GoogleFonts.poppins(fontSize:width*(0.008),color: Pallete.textGreyColor,))
      ],
    );
  }
}
