import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../global_variables/global_variables.dart';
import '../../theme/pallete.dart';

class AdditionalDescriptionTextField extends StatefulWidget {
  const AdditionalDescriptionTextField({super.key,required this.totalWidth});
  final double totalWidth;

  @override
  State<AdditionalDescriptionTextField> createState() => _AdditionalDescriptionTextFieldState();
}

class _AdditionalDescriptionTextFieldState extends State<AdditionalDescriptionTextField> {
  TextEditingController additionalTagTitle=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Additional Description",style: GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
        SizedBox(
          width:widget.totalWidth,
          height: 145,
          child: TextFormField(
            controller: additionalTagTitle,
            style:  GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,),
            keyboardType: TextInputType.text,
            maxLines: 10,
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
        Text("Enhance your SEO ranking with an added tag description for the product.",style: GoogleFonts.poppins(fontSize:width*(0.008),color: Pallete.textGreyColor,))
      ],
    );
  }
}
