import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/pallete.dart';

class ShippingStateDropDown extends StatelessWidget {
  const ShippingStateDropDown({super.key,required this.totalWidth});
  final double totalWidth;

  @override
  Widget build(BuildContext context) {
    /// shipping state provider
    final shippingStateProvider = StateProvider<String?>((ref) {
      return null;
    });
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Consumer(builder: (context, ref, child3) {
          return SizedBox(
            width: totalWidth,
            height: 40,
            child: DropdownButtonFormField(
              validator: (value3) {
                var val2 = value3 ?? '';
                if (val2.isEmpty) {
                  return 'Please Select State';
                }
                return null;
              },
              style:GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,) ,
              decoration: InputDecoration(
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  hintText: 'State',
                  hintStyle:  GoogleFonts.poppins(color: Pallete.textGreyColor,fontWeight: FontWeight.w400,),
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
              value: ref.watch(shippingStateProvider),
              onChanged: (String? newValue) {
                ref.read(shippingStateProvider.notifier)
                    .update((state) => newValue);
              },
              items: <String>[
                'Dubai',
                'Sharjah',
                'Ajman',
                'Abu Dhabi',
                'Fujairah',
                'Umm Al-Quwain',
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
