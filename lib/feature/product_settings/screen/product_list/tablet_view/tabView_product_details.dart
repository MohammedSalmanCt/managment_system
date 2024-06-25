import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/global_variables/global_variables.dart';
import '../../../../../core/theme/pallete.dart';
import '../desktop_view/product_details_laptop.dart';

class TabViewProductDetails extends StatefulWidget {
  const TabViewProductDetails({super.key});

  @override
  State<TabViewProductDetails> createState() => _TabViewProductDetailsState();
}

class _TabViewProductDetailsState extends State<TabViewProductDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      appBar: AppBar(
        backgroundColor: Pallete.whiteColor,
        centerTitle: true,
        title: Text("Product Detail",style: GoogleFonts.poppins(fontSize:20,color: Pallete.blackColor,fontWeight: FontWeight.w500,),),
      ),
        body: DefaultTabController(
          length: 4,
          child: Container(
            color: Pallete.backgroundColor,
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding:  const EdgeInsets.all(10),
              child:SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: height*(0.25),
                      color: Pallete.whiteColor,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(width*(0.01)),
                            width: width*(0.3),
                            color: Pallete.backgroundColor,
                            child: Image.asset("assets/logo/Rectangle 41.png",
                              fit: BoxFit.fill,),
                          ),
                          Container(
                            width: width*(0.635),
                            margin: EdgeInsets.all(width*(0.01)),
                            child:  ListView.builder(
                                              itemCount: 4,
                                              physics: const NeverScrollableScrollPhysics(),
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder:(context, index) {
                                                return  Padding(
                                                  padding:  EdgeInsets.only(right:index!=3? width*(0.01):0),
                                                  child: Container(
                                                    width: width*(0.151),
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
                    SizedBox(height: height*(0.02),),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: height*(0.3),
                          width: width*(0.73),
                          color: Pallete.whiteColor,
                          child: Padding(
                            padding:  EdgeInsets.all(width*(0.008)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                              Container(
                                  constraints: BoxConstraints(
                                    maxHeight: height*(0.06),
                                  ),
                                  width: width*(0.5),
                                              child: Text("Apple Macbook",
                                                  style:GoogleFonts.poppins(fontSize:width*(0.015),color: Pallete.blackColor,fontWeight: FontWeight.w500,))),
                                          Spacer(),
                                          Text("AED 5,600.00",style:GoogleFonts.poppins(fontSize:width*(0.015),color: Pallete.blackColor,fontWeight: FontWeight.w500,)),

                                  ],
                                ),
                              Row(
                              children: [
                                CircleAvatar(
                                  radius: width*(0.006),
                                  backgroundColor: Pallete.greyColor,
                                ),
                                SizedBox(width: 2,),
                                CircleAvatar(
                                  radius: width*(0.006),
                                  backgroundColor: Pallete.blackColor,
                                ),
                              ],
                            ),
                                Divider(color: Pallete.textFieldBorderColor,),
                                            Container(
                                              constraints: BoxConstraints(
                                                maxHeight:height*(0.08), // Optional: Constrain max width
                                              ),
                                              width: width*(0.71),
                                              child: Text("Lorem Ipsumis simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's",style:
                                              GoogleFonts.poppins(fontSize:width*(0.01),color: Pallete.blackColor,fontWeight: FontWeight.w400,)),
                                            ),
                                            Divider(color: Pallete.textFieldBorderColor,),
                                            SizedBox(
                                              height: width*(0.06),
                                              width: width*(0.7),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text("Brand",style: GoogleFonts.poppins(fontSize:width*(0.012),color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
                                                      Text("          :  ",style: GoogleFonts.poppins(fontSize:width*(0.012),color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
                                                      Text("Apple",style: GoogleFonts.poppins(fontSize:width*(0.012),color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text("Availability",style: GoogleFonts.poppins(fontSize:width*(0.012),color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
                                                      Text(" :  ",style: GoogleFonts.poppins(fontSize:width*(0.012),color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
                                                      Text("In Stock",style: GoogleFonts.poppins(fontSize:width*(0.012),color:Pallete.textGreenColor,fontWeight: FontWeight.w400,),),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text("Seller",style: GoogleFonts.poppins(fontSize:width*(0.012),color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
                                                      Text("           :  ",style: GoogleFonts.poppins(fontSize:width*(0.012),color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
                                                      Text("LMT",style: GoogleFonts.poppins(fontSize:width*(0.012),color:Pallete.blackColor,fontWeight: FontWeight.w400,),),
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
                          height: height*(0.2),
                          width: width*(0.24),
                          color: Pallete.whiteColor,
                          child: Padding(
                            padding:  EdgeInsets.all(width*(0.008)),
                            child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Brand",style: GoogleFonts.poppins(fontSize:width*(0.015),color: Pallete.blackColor,fontWeight: FontWeight.w500,),),
                                          SizedBox(height:15,),
                                          Text("Apple",style: GoogleFonts.poppins(fontSize:width*(0.013),color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
                                          SizedBox(height:5,),
                                          Text("LapTop",style: GoogleFonts.poppins(fontSize:width*(0.013),color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
                                          SizedBox(height:5,),
                                          Text("Mobile",style: GoogleFonts.poppins(fontSize:width*(0.013),color:Pallete.blackColor,fontWeight: FontWeight.w400,),),
                                        ],
                                      ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height*(0.02),),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: Pallete.whiteColor,
                          height: height*(0.06),
                          child: TabBar(
                              indicatorColor: Pallete.selectedBlueColor,
                              tabs: [
                                Text(
                                    "LapTop",
                                    style: GoogleFonts.poppins(fontSize:width*(0.015),color: Pallete.blackColor,fontWeight: FontWeight.w400,)
                                ),Text(
                                    "Video",
                                    style: GoogleFonts.poppins(fontSize:width*(0.015),color: Pallete.blackColor,fontWeight: FontWeight.w400,)
                                ),Text(
                                    "Detail",
                                    style: GoogleFonts.poppins(fontSize:width*(0.015),color: Pallete.blackColor,fontWeight: FontWeight.w400,)
                                ),Text(
                                    "Brand",
                                    style: GoogleFonts.poppins(fontSize:width*(0.015),color: Pallete.blackColor,fontWeight: FontWeight.w400,)
                                ),
                              ]),
                        ),
                        Container(
                          height: height*(0.5),
                          color: Pallete.whiteColor,
                          child: TabBarView(
                            children: [
                              ProductDetailsLapTop(textSize: width*(0.013),),
                              ProductDetailsLapTop(textSize: width*(0.013),),
                              ProductDetailsLapTop(textSize: width*(0.013),),
                              ProductDetailsLapTop(textSize: width*(0.013),),
                            ],),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        )
    )
    );
  }
}
