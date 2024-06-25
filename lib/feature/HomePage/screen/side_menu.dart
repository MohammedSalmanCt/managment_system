import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/asset_constants.dart';
import '../../../core/global_variables/global_variables.dart';
import '../../../core/theme/pallete.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key,required this.tabController});
  final TabController tabController;

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  Map<String, List<String>> roleData = {
    'Super Admin': [
      'Dashboard',
      'Organizations',
    ],
    'Admin': [
      'Dashboard',
      'Quotes',
      'Deleted Quotes',
      'Add Product',
      'Product List',
      'Deleted Product',
      'Quotation Banner',
      'Settings',
      'Label',

    ],
  };
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle= GoogleFonts.poppins(color: Pallete.whiteColor,fontWeight: FontWeight.w200,);
    return Consumer(
        builder: (context,ref,child) {
          final selectSideMenu=ref.watch(selectedSideMenuIndexProvider);
          final selectSideMenuSub=ref.watch(selectedSideMenuSubIndexProvider);
          return Container(
            height: height,
            width: 280,
            color: Pallete.sideMenuBackgroundColor,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height:25),
                  Row(
                    children: [
                      SizedBox(width: 30,),
                      SvgPicture.asset(AssetConstants.logo,width: 70,height: 60,fit: BoxFit.fill,),
                      Spacer(),
                      Text("Admin",style:  GoogleFonts.poppins(color: Pallete.whiteColor,fontWeight: FontWeight.w400,),),
                      SizedBox(width: 50),
                    ],
                  ),
                  SizedBox(height: 60),
                  ListTile(
                    onTap: () {
                      widget.tabController.animateTo(0);
                      ref.read(selectedSideMenuIndexProvider.notifier).update((state) => 1);
                      ref.read(headingProvider.notifier).update((state) => "Dashboard");
                    },
                    leading: sideMenuLeadingContainer(Icons.grid_view,selectSideMenu==1?Pallete.dashBoardIconsBackgroundColor
                        :Pallete.dashBoardIconsBackgroundBlack,selectSideMenu==1?Pallete.whiteColor:Pallete.greyColor),
                    title: Text("Dashboard",
                      style: textStyle,),
                  ),
                  SizedBox(height:15),
                  ExpansionTile(
                    iconColor: Pallete.whiteColor,
                      title:Text("Office",style:  textStyle,),
                  leading:sideMenuLeadingContainer(Icons.person_outline,selectSideMenu==2?Pallete.dashBoardIconsBackgroundColor
                      :Pallete.dashBoardIconsBackgroundBlack,selectSideMenu==2?Pallete.whiteColor:Pallete.greyColor),
                    children: [
                      ListTile(
                        onTap: () {
                          widget.tabController.animateTo(1);
                          ref.read(selectedSideMenuIndexProvider.notifier).update((state) => 2);
                          ref.read(selectedSideMenuSubIndexProvider.notifier).update((state) => 1);
                          ref.read(headingProvider.notifier).update((state) => "Branch Manager");
                        },
                        title: Padding(
                          padding: EdgeInsets.only(left: 90),
                          child: Text("Branch Manager",style:  GoogleFonts.poppins(color:selectSideMenu==2 && selectSideMenuSub==1?Pallete.textBlueColor :Pallete.whiteColor,fontWeight: FontWeight.w200,),),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          widget.tabController.animateTo(2);
                          ref.read(selectedSideMenuIndexProvider.notifier).update((state) => 2);
                          ref.read(selectedSideMenuSubIndexProvider.notifier).update((state) => 2);
                          ref.read(headingProvider.notifier).update((state) => "Manager");
                        },
                        title: Padding(
                          padding: EdgeInsets.only(left:90),
                          child: Text("Manager",style:  GoogleFonts.poppins(color:selectSideMenu==2 && selectSideMenuSub==2?Pallete.textBlueColor :Pallete.whiteColor,fontWeight: FontWeight.w200,),),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          widget.tabController.animateTo(3);
                          ref.read(selectedSideMenuIndexProvider.notifier).update((state) => 2);
                          ref.read(selectedSideMenuSubIndexProvider.notifier).update((state) => 3);
                          ref.read(headingProvider.notifier).update((state) => "Staff");
                        },
                        title: Padding(
                          padding: EdgeInsets.only(left:90),
                          child: Text("Staff",style:  GoogleFonts.poppins(color:selectSideMenu==2 && selectSideMenuSub==3?Pallete.textBlueColor :Pallete.whiteColor,fontWeight: FontWeight.w200,),),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          widget.tabController.animateTo(4);
                          ref.read(selectedSideMenuIndexProvider.notifier).update((state) => 2);
                          ref.read(selectedSideMenuSubIndexProvider.notifier).update((state) => 4);
                          ref.read(headingProvider.notifier).update((state) => "Clients");
                        },
                        title: Padding(
                          padding: EdgeInsets.only(left:90),
                          child: Text("Clients",style:  GoogleFonts.poppins(color:selectSideMenu==2 && selectSideMenuSub==4?Pallete.textBlueColor :Pallete.whiteColor,fontWeight: FontWeight.w200,),),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  ListTile(
                    onTap: () {
                      widget.tabController.animateTo(5);
                      ref.read(selectedSideMenuIndexProvider.notifier).update((state) => 3);
                      ref.read(headingProvider.notifier).update((state) => "Quotes");
                    },
                    leading: sideMenuLeadingContainer(Icons.insert_drive_file_outlined,selectSideMenu==3?Pallete.dashBoardIconsBackgroundColor
                        :Pallete.dashBoardIconsBackgroundBlack,selectSideMenu==3?Pallete.whiteColor:Pallete.greyColor),
                    title: Text("Quotes",
                      style: textStyle,),
                  ),
                  SizedBox(height:15,),
                  ListTile(
                    onTap: () {
                      widget.tabController.animateTo(6);
                      ref.read(selectedSideMenuIndexProvider.notifier).update((state) => 4);
                      ref.read(headingProvider.notifier).update((state) => "Deleted Quotes");
                    },
                    leading: sideMenuLeadingContainer(Icons.delete_outline,selectSideMenu==4?Pallete.dashBoardIconsBackgroundColor
                        :Pallete.dashBoardIconsBackgroundBlack,selectSideMenu==4?Pallete.whiteColor:Pallete.greyColor),
                    title: Text("Deleted Quotes",
                      style: textStyle,),
                  ),
                  SizedBox(height: 15,),
                  ExpansionTile(
                    iconColor: Pallete.whiteColor,
                    title:Text("Product Settings",style: textStyle,),
                    leading:sideMenuLeadingContainer(CupertinoIcons.layers_alt,selectSideMenu==5?Pallete.dashBoardIconsBackgroundColor
                        :Pallete.dashBoardIconsBackgroundBlack,selectSideMenu==5?Pallete.whiteColor:Pallete.greyColor),
                    children: [
                      ListTile(
                        onTap: () {
                          widget.tabController.animateTo(7);
                          ref.read(selectedSideMenuIndexProvider.notifier).update((state) => 5);
                          ref.read(selectedSideMenuSubIndexProvider.notifier).update((state) => 1);
                          ref.read(headingProvider.notifier).update((state) => "Add Product");
                        },
                        title: Padding(
                          padding:  EdgeInsets.only(left: 90),
                          child: Text("Add Product",style: GoogleFonts.poppins(color:selectSideMenu==5 && selectSideMenuSub==1?Pallete.textBlueColor :Pallete.whiteColor,fontWeight: FontWeight.w200,),),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          widget.tabController.animateTo(8);
                          ref.read(selectedSideMenuIndexProvider.notifier).update((state) => 5);
                          ref.read(selectedSideMenuSubIndexProvider.notifier).update((state) => 2);
                          ref.read(headingProvider.notifier).update((state) => "Product List");
                        },
                        title: Padding(
                          padding: EdgeInsets.only(left:90),
                          child: Text("Product List",style:  GoogleFonts.poppins(color:selectSideMenu==5 && selectSideMenuSub==2?Pallete.textBlueColor :Pallete.whiteColor,fontWeight: FontWeight.w200,),),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          widget.tabController.animateTo(9);
                          ref.read(selectedSideMenuIndexProvider.notifier).update((state) => 5);
                          ref.read(selectedSideMenuSubIndexProvider.notifier).update((state) => 3);
                          ref.read(headingProvider.notifier).update((state) => "Deleted Product");
                        },
                        title: Padding(
                          padding: EdgeInsets.only(left: 90),
                          child: Text("Deleted Product",style:  GoogleFonts.poppins(color:selectSideMenu==5 && selectSideMenuSub==3?Pallete.textBlueColor :Pallete.whiteColor,fontWeight: FontWeight.w200,),),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  ListTile(
                    onTap: () {
                      widget.tabController.animateTo(10);
                      ref.read(selectedSideMenuIndexProvider.notifier).update((state) => 6);
                      ref.read(headingProvider.notifier).update((state) => "Quotation Banner");
                    },
                    leading: sideMenuLeadingContainer(Icons.photo_outlined,selectSideMenu==6?Pallete.dashBoardIconsBackgroundColor
                        :Pallete.dashBoardIconsBackgroundBlack,selectSideMenu==6?Pallete.whiteColor:Pallete.greyColor),
                    title: Text("Quotation Banner",
                      style: textStyle,),
                  ),
                  SizedBox(height: 15,),
                  ListTile(
                    onTap: () {
                      widget.tabController.animateTo(11);
                      ref.read(selectedSideMenuIndexProvider.notifier).update((state) => 7);
                      ref.read(headingProvider.notifier).update((state) => "Settings");
                    },
                    leading: sideMenuLeadingContainer(Icons.settings_outlined,selectSideMenu==7?Pallete.dashBoardIconsBackgroundColor
                        :Pallete.dashBoardIconsBackgroundBlack,selectSideMenu==7?Pallete.whiteColor:Pallete.greyColor),
                    title: Text("Settings",
                      style: textStyle,),
                  ),
                  SizedBox(height: 15,),
                  ListTile(
                    onTap: () {
                      widget.tabController.animateTo(12);
                      ref.read(selectedSideMenuIndexProvider.notifier).update((state) => 8);
                      ref.read(headingProvider.notifier).update((state) => "Label");
                    },
                    leading: sideMenuLeadingContainer(Icons.label_outline,selectSideMenu==8?Pallete.dashBoardIconsBackgroundColor
                        :Pallete.dashBoardIconsBackgroundBlack,selectSideMenu==8?Pallete.whiteColor:Pallete.greyColor),
                    title: Text("Label",
                      style: textStyle,),
                  ),
                  SizedBox(height:40,),
                ],
              ),
            ),
          );
        }
    );
  }
  /// side icons
  Container sideMenuLeadingContainer( IconData icon,Color backgroundColor,Color ionColor) {
    return Container(
      height: 40,
      width: 40,
      color:backgroundColor,
      child: Icon(icon,color: ionColor,),
    );
  }
}
