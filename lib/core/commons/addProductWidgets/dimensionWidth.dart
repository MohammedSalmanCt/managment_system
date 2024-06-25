import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/pallete.dart';

class DimensionWidthTextField extends StatefulWidget {
  const DimensionWidthTextField({super.key,required this.totalWidth,});
  final double totalWidth;

  @override
  State<DimensionWidthTextField> createState() => _DimensionWidthTextFieldState();
}

class _DimensionWidthTextFieldState extends State<DimensionWidthTextField> {
  TextEditingController widthController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width:widget.totalWidth,
          height: 40,
          child: TextFormField(
            controller: widthController,
            style:  GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,),
            keyboardType:
            const TextInputType.numberWithOptions(
                decimal: true),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(
                  RegExp(r'^(\d+)?\.?\d{0,2}'))
            ],
            decoration: InputDecoration(
              hintText: "Width[w]",
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
