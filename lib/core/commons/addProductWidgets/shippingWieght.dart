import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/pallete.dart';

class ShippingWeightTextField extends StatefulWidget {
  const ShippingWeightTextField({super.key,required this.totalWidth,required this.textSize,required this.subTextSize});
  final double totalWidth;
  final double textSize;
  final double subTextSize;

  @override
  State<ShippingWeightTextField> createState() => _ShippingWeightTextFieldState();
}

class _ShippingWeightTextFieldState extends State<ShippingWeightTextField> {
  TextEditingController weightController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text("Weight (kg)",style: GoogleFonts.poppins(fontSize:widget.textSize,color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
         Icon(CupertinoIcons.question_circle,color: Pallete.blackColor,)
          ],
        ),
        SizedBox(
          width:widget.totalWidth,
          height: 40,
          child: TextFormField(
            controller: weightController,
            style:  GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,),
            keyboardType:
            const TextInputType.numberWithOptions(
                decimal: true),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(
                  RegExp(r'^(\d+)?\.?\d{0,2}'))
            ],
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
        Text("Decide if the product is a digital or physical item. Shipping may be necessary for real-world items.",style: GoogleFonts.poppins(fontSize:widget.subTextSize,color: Pallete.textGreyColor,fontWeight: FontWeight.w400,),),
      ],
    );
  }
}
