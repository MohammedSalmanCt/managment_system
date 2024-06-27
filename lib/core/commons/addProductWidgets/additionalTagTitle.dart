import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../global_variables/global_variables.dart';
import '../../theme/pallete.dart';

class AdditionalTagTitleTextField extends StatefulWidget {
  const AdditionalTagTitleTextField({super.key,required this.totalWidth,required this.additionalTagTitle});
  final double totalWidth;
  final TextEditingController additionalTagTitle;

  @override
  State<AdditionalTagTitleTextField> createState() => _AdditionalTagTitleTextFieldState();
}

class _AdditionalTagTitleTextFieldState extends State<AdditionalTagTitleTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Additional Tag Title",style: GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
        SizedBox(
          width:widget.totalWidth,
          height: 50,
          child: TextFormField(
            controller: widget.additionalTagTitle,
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
        SizedBox(
          width: widget.totalWidth,
            child: Text("Add a new tag title. Keywords should be simple and accurate.",style: GoogleFonts.poppins(fontSize:width*(0.006),color: Pallete.textGreyColor,)))
      ],
    );
  }
}
