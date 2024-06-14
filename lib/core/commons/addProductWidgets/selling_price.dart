import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/pallete.dart';

class SellingPriceTextField extends StatefulWidget {
  const SellingPriceTextField({super.key,required this.totalWidth});
  final double totalWidth;

  @override
  State<SellingPriceTextField> createState() => _SellingPriceTextFieldState();
}

class _SellingPriceTextFieldState extends State<SellingPriceTextField> {
  TextEditingController sellingPrice=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Selling Price *",style: GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
        SizedBox(
          width:widget.totalWidth,
          height: 50,
          child: TextFormField(
            controller: sellingPrice,
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
