import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:managment_system/core/global_variables/global_variables.dart';
import 'package:managment_system/feature/product_settings/screen/product_list/desktop_view/product_details_laptop.dart';

import '../../../../../core/theme/pallete.dart';

class DeskTopProductDetails extends StatefulWidget {
  const DeskTopProductDetails({super.key});

  @override
  State<DeskTopProductDetails> createState() => _DeskTopProductDetailsState();
}

class _DeskTopProductDetailsState extends State<DeskTopProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: Container(
          color: Pallete.backgroundColor,
          child: Padding(
            padding:  EdgeInsets.fromLTRB(20,35,25,0),
            child:Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                        child: Icon(Icons.arrow_back,size:25,color: Pallete.blackColor,)),
                    SizedBox(width: width*(0.01),),
                    Text("Product Detail",style:GoogleFonts.poppins(fontSize:25,color: Pallete.blackColor,fontWeight: FontWeight.w500,)),
                    Spacer(),
                    Container(
                      color:Pallete.homeBackgroundColor ,
                      height: 35,
                      width: 35,
                      child: Icon(Icons.mail_outline),
                    ),
                    SizedBox(width: 20,),
                    Container(
                      color:Pallete.homeBackgroundColor ,
                      height: 35,
                      width: 35,
                      child: Icon(Icons.notifications_active_outlined),
                    ),
                    SizedBox(width: 20,),
                    CircleAvatar(
                      backgroundColor: Pallete.homeBackgroundColor,
                      radius: 17,
                    ),
                    SizedBox(width: 5,),
                    Text("Admin",style: GoogleFonts.poppins(fontSize:14,color: Pallete.blackColor,fontWeight:FontWeight.w400),),
                  ],
                ),
                const SizedBox(height: 30,),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            color: Pallete.whiteColor,
                            height: height*(0.45),
                            width: width*(0.4),
                            child:Padding(
                              padding: EdgeInsets.all(width*(0.01)),
                              child: Column(
                                children: [
                                  Container(
                                    width: width*(0.45),
                                    height: height*(0.24),
                                    color: Pallete.backgroundColor,
                                    child: Image.asset("assets/logo/Rectangle 41.png",
                                    fit: BoxFit.fill,),
                                  ),
                                  SizedBox(height: height*(0.008),),
                                  Container(
                                    color: Pallete.whiteColor,
                                    height: height*(0.15),
                                    width: width*(0.45),
                                    child: ListView.builder(
                                      itemCount: 4,
                                        physics: const NeverScrollableScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder:(context, index) {
                                          return  Padding(
                                            padding:  EdgeInsets.only(right:index!=3? width*(0.01):0),
                                            child: Container(
                                              width: width*(0.088),
                                              height: height*(0.13),
                                              color: Pallete.backgroundColor,
                                              child: Image.asset("assets/logo/Rectangle 42.png",
                                                fit: BoxFit.fill,),
                                            ),
                                          );
                                        }, ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            color: Pallete.whiteColor,
                            constraints: BoxConstraints(
                              maxHeight: height*(0.39),
                              minHeight: height*(0.35)
                            ),
                            width: width*(0.28),
                            child: Padding(
                              padding:  EdgeInsets.all(width*(0.008)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    constraints: BoxConstraints(
                                      maxHeight: height*(0.06),
                                    ),
                                      width: width*(0.26),
                                      child: Text("Apple Macbook",style:GoogleFonts.poppins(fontSize:width*(0.01),color: Pallete.blackColor,fontWeight: FontWeight.w500,))),
                                  Text("AED 5,600.00",style:GoogleFonts.poppins(fontSize:width*(0.01),color: Pallete.blackColor,fontWeight: FontWeight.w500,)),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: width*(0.005),
                                      backgroundColor: Pallete.greyColor,
                                    ),
                                    SizedBox(width: 2,),
                                    CircleAvatar(
                                      radius: width*(0.005),
                                      backgroundColor: Pallete.blackColor,
                                    ),
                                  ],
                                ),
                                  Divider(color: Pallete.textFieldBorderColor,),
                                  Container(
                                    constraints: BoxConstraints(
                                      maxHeight:height*(0.1), // Optional: Constrain max width
                                    ),
                                    width: width*(0.26),
                                    child: Text("Lorem Ipsumis simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's",style:
                                    GoogleFonts.poppins(fontSize:width*(0.008),color: Pallete.blackColor,fontWeight: FontWeight.w400,)),
                                  ),
                                  Divider(color: Pallete.textFieldBorderColor,),
                                  SizedBox(
                                    height: height*(0.1),
                                    width: width*(0.26),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text("Brand",style: GoogleFonts.poppins(fontSize:width*(0.009),color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
                                            Text("          :  ",style: GoogleFonts.poppins(fontSize:width*(0.009),color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
                                            Text("Apple",style: GoogleFonts.poppins(fontSize:width*(0.009),color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text("Availability",style: GoogleFonts.poppins(fontSize:width*(0.009),color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
                                            Text(" :  ",style: GoogleFonts.poppins(fontSize:width*(0.009),color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
                                            Text("In Stock",style: GoogleFonts.poppins(fontSize:width*(0.009),color:Pallete.textGreenColor,fontWeight: FontWeight.w400,),),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text("Seller",style: GoogleFonts.poppins(fontSize:width*(0.009),color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
                                            Text("           :  ",style: GoogleFonts.poppins(fontSize:width*(0.009),color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
                                            Text("LMT",style: GoogleFonts.poppins(fontSize:width*(0.009),color:Pallete.blackColor,fontWeight: FontWeight.w400,),),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            color: Pallete.whiteColor,
                            height: height*(0.2),
                            width: width*(0.22),
                            child: Padding(
                              padding:  EdgeInsets.all(width*(0.008)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Brand",style: GoogleFonts.poppins(fontSize:width*(0.011),color: Pallete.blackColor,fontWeight: FontWeight.w500,),),
                                  SizedBox(height:15,),
                                  Text("Apple",style: GoogleFonts.poppins(fontSize:width*(0.009),color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
                                  SizedBox(height:5,),
                                  Text("LapTop",style: GoogleFonts.poppins(fontSize:width*(0.009),color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
                                  SizedBox(height:5,),
                                  Text("Mobile",style: GoogleFonts.poppins(fontSize:width*(0.009),color:Pallete.blackColor,fontWeight: FontWeight.w400,),),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height*(0.02),),
                      Container(
                        height: height*(0.33),
                        color: Pallete.whiteColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: width*(0.27),
                              height: height*(0.06),
                              child: TabBar(
                                  indicatorColor: Pallete.selectedBlueColor,
                                  tabs: [
                                    Text(
                                        "LapTop",
                                        style: GoogleFonts.poppins(fontSize:width*(0.01),color: Pallete.blackColor,fontWeight: FontWeight.w400,)
                                    ),Text(
                                        "Video",
                                        style: GoogleFonts.poppins(fontSize:width*(0.01),color: Pallete.blackColor,fontWeight: FontWeight.w400,)
                                    ),Text(
                                        "Detail",
                                        style: GoogleFonts.poppins(fontSize:width*(0.01),color: Pallete.blackColor,fontWeight: FontWeight.w400,)
                                    ),Text(
                                        "Brand",
                                        style: GoogleFonts.poppins(fontSize:width*(0.01),color: Pallete.blackColor,fontWeight: FontWeight.w400,)
                                    ),
                                  ]),
                            ),
                            SizedBox(
                              height: height*(0.27),
                              child: TabBarView(
                                children: [
                                  ProductDetailsLapTop(textSize: width*(0.01),),
                                  ProductDetailsLapTop(textSize: width*(0.01),),
                                  ProductDetailsLapTop(textSize: width*(0.01),),
                                  ProductDetailsLapTop(textSize: width*(0.01),),
                                ],),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
