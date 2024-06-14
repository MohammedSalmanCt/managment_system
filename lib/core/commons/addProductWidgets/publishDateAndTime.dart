import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../theme/pallete.dart';

class PublishDateAndTime extends StatefulWidget {
  const PublishDateAndTime({super.key,required this.totalWidth});
  final double totalWidth;

  @override
  State<PublishDateAndTime> createState() => _PublishDateAndTimeState();
}

class _PublishDateAndTimeState extends State<PublishDateAndTime> {
  final datePickProvider = StateProvider<DateTime?>((ref) {
return null;
  });
  /// date pick
  Future<void> _selectedToDate(
      {required BuildContext context, required WidgetRef ref}) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2035, 8));
    if (picked != null && picked != ref.read(datePickProvider)) {
      ref.read(datePickProvider.notifier).update((state) =>
          DateTime(picked.year, picked.month, picked.day, 23, 59, 59));
    }
  }
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
              _selectedToDate(context: context, ref: ref);
            },
            child: Container(
              height: 50,
              width:widget.totalWidth,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  border: Border.all(color: Pallete.textFieldBorderColor)
              ),
              child: Center(
                child: Text(date!=null?DateFormat('dd/MM/yyyy')
                    .format(date):"",
                  style: GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400),),
              ),
            ),
          );
        }),
        Text("",style: GoogleFonts.poppins(fontSize:10,color: Pallete.textGreyColor,))
      ],
    );
  }
}
