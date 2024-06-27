import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:managment_system/core/global_variables/global_variables.dart';
import '../../../core/theme/pallete.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key,required this.device});
  final bool device;

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return  Container(
        height: 600,
        decoration: BoxDecoration(
          color: Pallete.whiteColor,
            boxShadow:  [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 10,
                blurRadius: 20,
                offset: Offset(0, 10),
              )
            ]
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 40,left: 40,top: 30,bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               widget.device? deskTopContainer(color: Pallete.whiteColor,count: 1000,heading: "Pending Quotes",icon: Icons.insert_drive_file_outlined)
                :tabViewContainer(color: Pallete.whiteColor,count: 1000,heading: "Pending Quotes",icon: Icons.insert_drive_file_outlined),
                widget.device?deskTopContainer(color: Pallete.whiteColor,count: 1000,heading: "Approved Quotes",icon: Icons.insert_drive_file_outlined)
                :tabViewContainer(color: Pallete.whiteColor,count: 1000,heading: "Approved Quotes",icon: Icons.insert_drive_file_outlined),
                widget.device?deskTopContainer(color: Pallete.whiteColor,count: 1000,heading: "Total Quotes",icon: Icons.insert_drive_file_outlined)
                :tabViewContainer(color: Pallete.whiteColor,count: 1000,heading: "Total Quotes",icon: Icons.insert_drive_file_outlined),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20,right: 40,left: 40, ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.device?deskTopContainer(color: Pallete.whiteColor,count: 1000,heading: "Products",icon: Icons.insert_drive_file_outlined)
                :tabViewContainer(color: Pallete.whiteColor,count: 1000,heading: "Products",icon: Icons.insert_drive_file_outlined),
                widget.device?deskTopContainer(color: Pallete.whiteColor,count: 1000,heading: "Deleted Products",icon: Icons.insert_drive_file_outlined)
                :tabViewContainer(color: Pallete.whiteColor,count: 1000,heading: "Deleted Products",icon: Icons.insert_drive_file_outlined),
                widget.device?deskTopContainer(color: Pallete.whiteColor,count: 1000,heading: "Discount Request",icon: Icons.insert_drive_file_outlined)
                :tabViewContainer(color: Pallete.whiteColor,count: 1000,heading: "Discount Request",icon: Icons.insert_drive_file_outlined),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40),
            child: widget.device?deskTopContainer(color: Pallete.whiteColor,count: 1000,heading: "Clients",icon: Icons.insert_drive_file_outlined)
            :tabViewContainer(color: Pallete.whiteColor,count: 1000,heading: "Clients",icon: Icons.insert_drive_file_outlined),
          ),
        ],
      ),
      );
  }

  Container deskTopContainer({required Color color,required int count,
    required String heading,required IconData icon}) {
    return Container(
          height: width*(0.07),
          width: width*(0.2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color,
            border: Border.all(color: Pallete.textFieldBorderColor)
          ),
          child: Padding(
            padding: EdgeInsets.all(width*(0.01)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(count.toString(),style: GoogleFonts.poppins(fontSize:width*(0.013),color: Pallete.blackColor,fontWeight: FontWeight.bold,),),
                    Text(heading,style: GoogleFonts.poppins(fontSize:width*(0.01),color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
                  ],
                ),
                Icon(icon,size: width*(0.035),)
              ],
            ),
          ),
        );
  }

  Container tabViewContainer({required Color color,required int count,
    required String heading,required IconData icon}) {
    return Container(
          height: width*(0.08),
          width: width*(0.23),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color,
            border: Border.all(color: Pallete.textFieldBorderColor)
          ),
          child: Padding(
            padding: EdgeInsets.all(width*(0.01)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(count.toString(),style: GoogleFonts.poppins(fontSize:width*(0.015),color: Pallete.blackColor,fontWeight: FontWeight.bold,),),
                    Text(heading,style: GoogleFonts.poppins(fontSize:width*(0.012),color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
                  ],
                ),
                Icon(icon,size: width*(0.04),)
              ],
            ),
          ),
        );
  }
}
