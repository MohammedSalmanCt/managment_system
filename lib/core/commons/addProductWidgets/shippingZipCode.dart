import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/pallete.dart';

class ZipCodeTextField extends StatefulWidget {
  const ZipCodeTextField({super.key,required this.totalWidth});
  final double totalWidth;

  @override
  State<ZipCodeTextField> createState() => _ZipCodeTextFieldState();
}

class _ZipCodeTextFieldState extends State<ZipCodeTextField> {
  TextEditingController zipCodeController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width:widget.totalWidth,
          height: 40,
          child: TextFormField(
            controller: zipCodeController,
            style:  GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,),
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: "Zip Code (10001)",
              hintStyle:  GoogleFonts.poppins(color: Pallete.textGreyColor,fontWeight: FontWeight.w200,),
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
              contentPadding:const EdgeInsetsDirectional.only(top: 8,start: 10),
            ),
          ),
        ),
      ],
    );
  }
}
