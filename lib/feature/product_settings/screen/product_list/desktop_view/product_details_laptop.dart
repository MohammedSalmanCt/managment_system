import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/global_variables/global_variables.dart';
import '../../../../../core/theme/pallete.dart';

class ProductDetailsLapTop extends StatefulWidget {
  const ProductDetailsLapTop({super.key,required this.textSize});
  final double textSize;

  @override
  State<ProductDetailsLapTop> createState() => _ProductDetailsLapTopState();
}

class _ProductDetailsLapTopState extends State<ProductDetailsLapTop> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: height*(0.01),),
        Center(
          child: Text("Lorem Ipsumis simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              style:GoogleFonts.poppins(fontSize:widget.textSize,color: Pallete.blackColor,fontWeight: FontWeight.w400,)),
        ),
      ],
    );
  }
}
