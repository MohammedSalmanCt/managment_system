import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/pallete.dart';

class ProductStockTextField extends StatefulWidget {
  const ProductStockTextField({super.key,required this.totalWidth});
  final double totalWidth;

  @override
  State<ProductStockTextField> createState() => _ProductStockTextFieldState();
}

class _ProductStockTextFieldState extends State<ProductStockTextField> {
  TextEditingController productStock=TextEditingController();
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
            controller: productStock,
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
