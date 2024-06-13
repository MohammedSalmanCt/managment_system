import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/commons/nextButton.dart';
import '../../../../core/global_variables/global_variables.dart';
import '../../../../core/theme/pallete.dart';

class DeskTopAddProductScreen extends StatefulWidget {
  const DeskTopAddProductScreen({super.key});

  @override
  State<DeskTopAddProductScreen> createState() => _DeskTopAddProductScreenState();
}

class _DeskTopAddProductScreenState extends State<DeskTopAddProductScreen> {
  TextEditingController productTitle=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Pallete.whiteColor,
      width: width,
      child: Row(
        children: [
          Container(
            width: 300,
            color: Colors.red,
          ),
          SizedBox(width: width*(0.01),),
          Container(
            width: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
              Text("Email",style: GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
              SizedBox(
                height: 50,
                child: TextFormField(
                  controller: productTitle,
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
              SizedBox(height: 20,),
              Text("Product Details",style: GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
              SizedBox(
                height: 200,
                child: TextFormField(
                  controller: productTitle,
                  style:  GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,),
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
                    contentPadding:const EdgeInsetsDirectional.only(top: 8,start: 10),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Divider(color: Pallete.textFieldBorderColor,
                thickness: 1,
              ),
              SizedBox(height: 15,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Improve product visibility by adding a compelling description.",style: GoogleFonts.poppins(fontSize:10,color: Pallete.homeBackgroundColor,
                    fontWeight: FontWeight.w400,),),
                  NextButton(text: "Next", icon: Icons.arrow_forward)
                ],
              )
            ],),
          ),
          SizedBox(width: width*(0.01),)
        ],
      ),
    );
  }
}
