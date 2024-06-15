import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/pallete.dart';

class LowStockDropDown extends StatelessWidget {
  const LowStockDropDown({super.key,required this.totalWidth});
  final double totalWidth;

  @override
  Widget build(BuildContext context) {
    /// low stock provider
    final lowStockProvider = StateProvider<String?>((ref) {
      return null;
    });
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Low Stock",style: GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
        Consumer(builder: (context, ref, child3) {
          return SizedBox(
            width: totalWidth,
            height: 50,
            child: DropdownButtonFormField(
              validator: (value3) {
                var val2 = value3 ?? '';
                if (val2.isEmpty) {
                  return 'Please Select Low Stock';
                }
                return null;
              },
              decoration: InputDecoration(
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  hintText: 'Low Stock',
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
              value: ref.watch(lowStockProvider),
              onChanged: (String? newValue) {
                ref.read(lowStockProvider.notifier)
                    .update((state) => newValue);
              },
              items: <String>[
                'stock 1',
                'stock 2',
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
      ],
    );
  }
}
