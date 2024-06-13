import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/pallete.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key,required this.text,required this.icon});
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

      },
      child: Container(
        width: 100,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Pallete.whiteColor,
          border: Border.all(color: Pallete.textFieldBorderColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(text,style: GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
            SizedBox(width: 5,),
            Icon(icon,color: Pallete.blackColor,size: 17,)
          ],
        ),
      ),
    );
  }
}
