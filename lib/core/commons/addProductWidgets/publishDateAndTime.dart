import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../global_variables/global_variables.dart';
import '../../theme/pallete.dart';

class PublishDateAndTime extends StatefulWidget {
  const PublishDateAndTime({super.key,required this.totalWidth});
  final double totalWidth;

  @override
  State<PublishDateAndTime> createState() => _PublishDateAndTimeState();
}

class _PublishDateAndTimeState extends State<PublishDateAndTime> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Publish Date & Time",style: GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
        Consumer(builder: (context, ref, child3) {
          final date=ref.watch(datePickProvider);
          return InkWell(
            onTap: () {
              selectedToDate(context: context, ref: ref,text: "Publish Date & Time");
            },
            child: Container(
              height: 50,
              width:widget.totalWidth,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  border: Border.all(color: Pallete.textFieldBorderColor)
              ),
              child: Center(
                child: date!=null?Text(DateFormat('dd/MM/yyyy')
                    .format(date),
                  style: GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400),)
               : Icon(Icons.calendar_month,color: Pallete.blackColor,),
              ),
            ),
          );
        }),
        Text("",style: GoogleFonts.poppins(fontSize:10,color: Pallete.textGreyColor,))
      ],
    );
  }
}
