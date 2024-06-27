import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../global_variables/global_variables.dart';
import '../../theme/pallete.dart';

class RestockDate extends StatefulWidget {
  const RestockDate({super.key,required this.totalWidth,required this.textSize});
  final double totalWidth;
  final double textSize;

  @override
  State<RestockDate> createState() => _RestockDateState();
}

class _RestockDateState extends State<RestockDate> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Restock Date",style: GoogleFonts.poppins(fontSize:widget.textSize,color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
        Consumer(builder: (context, ref, child3) {
          final date=ref.watch(restockDateProvider);
          return InkWell(
            onTap: () {
              selectedToDate(context: context, ref: ref,text: "Restock Date");
            },
            child: Container(
              height: 50,
              width:widget.totalWidth,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(color: Pallete.textFieldBorderColor)
              ),
              child: Center(
                child: date!=null?Text(DateFormat('dd/MM/yyyy')
                    .format(date),
                  style: GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400),)
                :Icon(Icons.calendar_month,color: Pallete.blackColor,),
              ),
            ),
          );
        }),
      ],
    );
  }
}
