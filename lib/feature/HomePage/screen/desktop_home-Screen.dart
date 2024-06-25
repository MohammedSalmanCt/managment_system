import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:managment_system/feature/HomePage/screen/side_menu.dart';
import '../../../core/global_variables/global_variables.dart';
import '../../../core/theme/pallete.dart';
import '../../DashBoard/screen/dashboard_screen.dart';
import '../../product_settings/screen/add_product/add_product_screen.dart';
import '../../product_settings/screen/product_list/product_list.dart';

class DeskTopHomeScreen extends StatelessWidget {
  const DeskTopHomeScreen({super.key,required this.tabController});
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
          body: Row(
            children: [
              SideMenu(tabController: tabController,),
              Expanded(
                child: Consumer(
                  builder: (context,ref,child) {
                    final heading=ref.watch(headingProvider);
                    return Container  (
                      color: Pallete.backgroundColor,
                      child: Padding(
                        padding:  EdgeInsets.fromLTRB(20,35,25,0),
                        child:Column(
                          children: [
                            Row(
                              children: [
                                Text(heading,style:GoogleFonts.poppins(fontSize:25,color: Pallete.blackColor,fontWeight: FontWeight.w500,)),
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
                                Text("Admin",style: GoogleFonts.poppins(fontSize:14,color: Pallete.blackColor,fontWeight:FontWeight.w400),)
                              ],
                            ),
                            const SizedBox(height: 30,),
                            SingleChildScrollView(
                              child: SizedBox(
                                height: 580,
                                child: TabBarView(
                                  controller: tabController,
                                  physics: NeverScrollableScrollPhysics(),
                                  children:   [
                                    DashBoardScreen(),
                                Container(
                                  color: Colors.blue,
                                  width: 1024,
                                  height: 800,
                                ),
                                    Container(
                                  color: Colors.lightGreen,
                                  width: 1024,
                                  height: 800,
                                ),
                                    Container(
                                  color: Colors.yellow,
                                  width: 1024,
                                  height: 800,
                                ),
                                    Container(
                                  color: Colors.lightGreen,
                                  width: 1024,
                                  height: 800,
                                ),
                                    Container(
                                  color: Colors.yellow,
                                  width: 1024,
                                  height: 800,
                                ),
                                    Container(
                                  color: Colors.red,
                                  width: 1024,
                                  height: 800,
                                ),
                                    AddProductScreen(
                                      tabController: tabController,
                                      totalWidth: width*(0.2),
                                    totalHeight: width*(0.31),
                                    circleWidth: width*(0.03),
                                    device: true,
                                    gap: width*(0.01),
                                    textSize: width*(0.01),
                                    textSubSize: width*(0.008),),
                                    ProductList(tabController: tabController,device: true,),
                                    Container(
                                  color: Colors.black,
                                  width: 1024,
                                  height: 800,
                                ), Container(
                                  color: Colors.green,
                                  width: 1024,
                                  height: 800,
                                ), Container(
                                  color: Colors.tealAccent,
                                  width: 1024,
                                  height: 800,
                                ), Container(
                                  color: Colors.amber,
                                  width: 1024,
                                  height: 800,
                                ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                ),
              )
            ],
          ),
        )
    );
  }
}
