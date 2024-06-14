import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:managment_system/feature/HomePage/screen/side_menu.dart';
import 'package:managment_system/feature/product_settings/screen/add_product/deskTop/add_product_screen.dart';
import '../../../core/global_variables/global_variables.dart';
import '../../../core/theme/pallete.dart';
import '../../DashBoard/screen/dashboard_screen.dart';

class TabHomeScreen extends ConsumerWidget {
  const TabHomeScreen({super.key,required this.tabController});
  final TabController tabController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    final heading=ref.watch(headingProvider);
    print(width);
    return SafeArea(
      child:Scaffold(
        key: _scaffoldKey,
        drawer: drawer(),
        appBar: AppBar(
          backgroundColor: Pallete.whiteColor,
          elevation: 8,
          leading: InkWell(
            onTap: () => _scaffoldKey.currentState?.openDrawer(),
            child: Icon(Icons.menu,color: Pallete.blackColor,),
          ),
          centerTitle: true,
          title: Text(heading,style: GoogleFonts.poppins(fontSize:20,color: Pallete.blackColor,fontWeight: FontWeight.w500,),),
        ),
        body:Container(
          color: Pallete.backgroundColor,
          width: 1024,
          height: 800,
          child:  TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: tabController,
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
                color: Colors.red,
                width: 1024,
                height: 800,
              ),
              AddProductScreen(device: false,
              textSubSize: width*(0.015),
              textSize: width*(0.02),
              gap: width*(0.01),
              circleWidth: width*(0.051),
             totalHeight: width*(0.38),
              totalWidth: width*(0.42),),
              Container(
                color: Colors.purple,
                width: 1024,
                height: 800,
              ), Container(
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
              ), Container(
                color: Colors.brown,
                width: 1024,
                height: 800,
              ), Container(
                color: Colors.lightGreenAccent,
                width: 1024,
                height: 800,
              ), Container(
                color: Colors.teal,
                width: 1024,
                height: 800,
              ),
            ],
          ),
        ),
      )
    );
  }
 Drawer drawer(){
return Drawer(
  backgroundColor: Pallete.sideMenuBackgroundColor,
  child: SideMenu(tabController: tabController)
);
  }
}
