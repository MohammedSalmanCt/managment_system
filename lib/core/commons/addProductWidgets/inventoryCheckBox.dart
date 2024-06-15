import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/pallete.dart';

class InventoryCheckBox extends StatefulWidget {
  const InventoryCheckBox({super.key,required this.textSize,
    required this.checkBoxSize,required this.subTextSize});
  final double textSize;
  final double subTextSize;
  final double checkBoxSize;

  @override
  State<InventoryCheckBox> createState() => _InventoryCheckBoxState();
}

class _InventoryCheckBoxState extends State<InventoryCheckBox> {
  final allowBackOrdersProvider = StateProvider<bool>((ref) {
return false;
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Allow Backorders",style: GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,
        fontSize:widget.textSize),),
        SizedBox(height: 5,),
        Row(
          children: [
            SizedBox(width: 5,),
            Consumer(
                builder: (context,ref,child) {
                  final allowBackOrders=ref.watch(allowBackOrdersProvider);
                  return SizedBox(
                    width: widget.checkBoxSize,
                    height: widget.checkBoxSize,
                    child: Checkbox(

                      value: allowBackOrders, onChanged: (value) {
                      ref.read(allowBackOrdersProvider.notifier).update((state) => !state);
                    },
                      hoverColor: Colors.transparent,
                      checkColor: Colors.grey.shade100,
                    ),
                  );
                }
            ),
            SizedBox(width: 10,),
            Text("This is a digital Product",style: GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,
                fontSize:widget.textSize),),
          ],
        ),
        SizedBox(height: 5,),
        Text("Decide if the product is a digital or physical item. Shipping may be necessary for real-world items.",style: GoogleFonts.poppins(color: Pallete.textGreyColor,fontWeight: FontWeight.w400,
        fontSize:widget.subTextSize),),

      ],
    );
  }
}
