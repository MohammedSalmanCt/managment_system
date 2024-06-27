import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../global_variables/global_variables.dart';
import '../../theme/pallete.dart';

class CreateCategoryButton extends StatelessWidget {
  const CreateCategoryButton({super.key,required this.onTap,required this.text});
final TapCallback onTap;
final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:onTap,
      style: ElevatedButton.styleFrom(
          fixedSize: Size(  250,45,),
          backgroundColor: Pallete.buttonYellowColor,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero)
      ),
      child: Text("+  Create a $text",style: GoogleFonts.poppins(color: Pallete.whiteColor,fontWeight: FontWeight.w400,),),
    );
  }
}
