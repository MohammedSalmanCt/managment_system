import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/pallete.dart';

class ChooseCurrencyDropDown extends StatelessWidget {
  const ChooseCurrencyDropDown({super.key,required this.totalWidth});
  final double totalWidth;

  @override
  Widget build(BuildContext context) {
    final currencyProvider = StateProvider<String?>((ref) {
      return null;
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Choose your currency",style: GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
        Consumer(builder: (context, ref, child3) {
          return Container(
            width: totalWidth,
            height: 50,
            child: DropdownButtonFormField(
              validator: (value3) {
                var val2 = value3 ?? '';
                if (val2.isEmpty) {
                  return 'Please Choose Currency';
                }
                return null;
              },
              decoration: InputDecoration(
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  hintText: 'Currency',
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
              value: ref.watch(currencyProvider),
              onChanged: (String? newValue) {
                ref.read(currencyProvider.notifier)
                    .update((state) => newValue);
              },
              items: <String>[
                'AED',
                'INR',
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
