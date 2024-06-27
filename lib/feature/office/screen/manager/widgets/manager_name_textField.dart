import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/global_variables/global_variables.dart';
import '../../../../../core/theme/pallete.dart';

class ManagerNameField extends StatefulWidget {
  const ManagerNameField({super.key,required this.device,required this.textFontSize,
  required this.controller,required this.heading});
  final bool device;
  final String heading;
  final double textFontSize;
  final TextEditingController controller;
  @override
  State<ManagerNameField> createState() => _ManagerNameFieldState();
}

class _ManagerNameFieldState extends State<ManagerNameField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.heading,style: GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
        SizedBox(
          width: widget.device?width*(0.21):width*(0.5),
          height: 50,
          child: TextFormField(
            controller: widget.controller,
            style:  GoogleFonts.poppins(fontSize:widget.textFontSize,color: Pallete.blackColor,fontWeight: FontWeight.w400,),
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
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
