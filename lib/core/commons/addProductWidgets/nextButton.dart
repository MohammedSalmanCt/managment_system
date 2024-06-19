import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../global_variables/global_variables.dart';
import '../../theme/pallete.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key,required this.device,required this.text});
  final bool device;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width*(0.06),
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Pallete.whiteColor,
        border: Border.all(color: Pallete.textFieldBorderColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(text,style: GoogleFonts.poppins(fontSize:device?width*(0.01):width*(0.013),color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
          SizedBox(width: 5,),
          device?Icon(Icons.arrow_forward,color: Pallete.blackColor,size: width*(0.01),)
              :SizedBox()
        ],
      ),
    );
  }
}
