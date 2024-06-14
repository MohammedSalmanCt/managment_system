import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/pallete.dart';

class TypeOfProductDiscountGrid extends StatefulWidget {
  const TypeOfProductDiscountGrid({super.key});

  @override
  State<TypeOfProductDiscountGrid> createState() => _TypeOfProductDiscountGridState();
}

class _TypeOfProductDiscountGridState extends State<TypeOfProductDiscountGrid> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text("Types of product discount",style: GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
          // Icon(Icons.rounded)
          ],
        ),

      ],
    );
  }
}
