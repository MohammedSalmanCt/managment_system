import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/pallete.dart';

class ShippingCityTextField extends StatefulWidget {
  const ShippingCityTextField({super.key,required this.totalWidth,});
  final double totalWidth;

  @override
  State<ShippingCityTextField> createState() => _ShippingCityTextFieldState();
}

class _ShippingCityTextFieldState extends State<ShippingCityTextField> {
  TextEditingController shippingCityController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width:widget.totalWidth,
          height: 40,
          child: TextFormField(
            controller: shippingCityController,
            style:  GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,),
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: "City",
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
