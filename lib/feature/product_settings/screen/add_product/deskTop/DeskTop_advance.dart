import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:managment_system/core/theme/pallete.dart';
import '../../../../../core/global_variables/global_variables.dart';
import '../TabView/advance/tabViewAdditional_option.dart';
import '../TabView/advance/tabViewShipping.dart';
import '../TabView/advance/tabView_invetory.dart';
import 'advance/deskTopInventory.dart';
import 'advance/deskTopShipping.dart';
import 'advance/desktopAdditional_options.dart';

class DeskTopAdvance extends StatefulWidget {
  const DeskTopAdvance({super.key,required this.device,required this.tabController,
    required this.skuController,required this.stockQuantityController,required this.additionalDescription,
  required this.additionalTagTitle});
  final bool device;
  final TabController tabController;
final TextEditingController skuController;
final TextEditingController stockQuantityController;
final TextEditingController additionalDescription;
final TextEditingController additionalTagTitle;

  @override
  State<DeskTopAdvance> createState() => _DeskTopAdvanceState();
}

class _DeskTopAdvanceState extends State<DeskTopAdvance> {
  @override
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    return  DefaultTabController(
      length: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          TabBar(
            controller: widget.tabController,
              physics:const NeverScrollableScrollPhysics(),
              dividerColor: Colors.transparent,
              indicatorColor: Pallete.selectedBlueColor,
              isScrollable: false,
              onTap: (value) {
              },
              tabs: [
                Text(
                  "Inventory",
                    style: GoogleFonts.poppins(fontSize:widget.device?width*(0.01):width*(0.015),color: Pallete.blackColor,fontWeight: FontWeight.w400,)
                ),Text(
                  "Additional Options",
                    style: GoogleFonts.poppins(fontSize:widget.device?width*(0.01):width*(0.015),color: Pallete.blackColor,fontWeight: FontWeight.w400,)
                ),
                // Text(
                //   "Shipping",
                //     style: GoogleFonts.poppins(fontSize:widget.device?width*(0.01):width*(0.015),color: Pallete.blackColor,fontWeight: FontWeight.w400,)
                // ),
              ]),
          SizedBox(height: 20,),
         widget.device?  SizedBox(
            height: 300,
            child: TabBarView(
              controller: widget.tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
              DeskTopInventory(stockQuantityController: widget.stockQuantityController,
              skuController: widget.skuController,),
                DeskTopAdditionalOption(additionalDescription: widget.additionalDescription,
                additionalTagTitle: widget.additionalTagTitle,),
                // DeskTopShipping(),
            ],),
          )
          : SizedBox(
           height: 420,
           child: TabBarView(
             controller: widget.tabController,
             physics: const NeverScrollableScrollPhysics(),
             children: [
               TabViewInventory(stockQuantityController: widget.stockQuantityController,
                 skuController: widget.skuController,),
               TabViewAdditionalOption(additionalDescription: widget.additionalDescription,
                 additionalTagTitle: widget.additionalTagTitle,),
               // TabViewShipping(),
             ],),
         ),
          SizedBox(height: 10,),
        ],),
    );
  }
}
