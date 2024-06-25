import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:managment_system/core/global_variables/global_variables.dart';
import '../../../../core/theme/pallete.dart';

class AddProductDetails extends StatefulWidget {
  const AddProductDetails({super.key,required this.hintTextSize,required this.productDetailsTextFieldHeight,
    required this.textFontSize,required this.device});
  final double textFontSize;
  final double productDetailsTextFieldHeight;
  final double hintTextSize;
  final bool device;

  @override
  State<AddProductDetails> createState() => _AddProductDetailsState();
}

class _AddProductDetailsState extends State<AddProductDetails> {
  TextEditingController productTitle=TextEditingController();
  TextEditingController productDescription=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20,),
        Text("Product Title",style: GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
        SizedBox(
          width: widget.device?width*(0.3):width*(0.5),
          height: 50,
          child: TextFormField(
            controller: productTitle,
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
        SizedBox(height: 30,),
        SizedBox(
          width: widget.device?width*(0.3):width*(0.5),
          height: 200,
          child: TextFormField(
            controller: productDescription,
            style:  GoogleFonts.poppins(fontSize:widget.textFontSize,color: Pallete.blackColor,fontWeight: FontWeight.w400,),
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
              hintText: "Enter your message...",
              hintStyle:  GoogleFonts.poppins(fontSize:widget.hintTextSize,color: Pallete.blackColor,fontWeight: FontWeight.w400,),
              contentPadding:const EdgeInsetsDirectional.only(top: 10,start: 10,
                  end: 10,bottom: 10),
            ),
          ),
        ),
      ],);
  }
}
