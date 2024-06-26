import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/pallete.dart';

class PreOrderDateTextField extends StatefulWidget {
  const PreOrderDateTextField({super.key,required this.totalWidth,required this.textSize});
  final double totalWidth;
  final double textSize;

  @override
  State<PreOrderDateTextField> createState() => _PreOrderDateTextFieldState();
}

class _PreOrderDateTextFieldState extends State<PreOrderDateTextField> {
  TextEditingController preOrderController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Pre-Order*",style: GoogleFonts.poppins(fontSize:widget.textSize,color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
        SizedBox(
          width:widget.totalWidth,
          height: 50,
          child: TextFormField(
            controller: preOrderController,
            style:  GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,),
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
