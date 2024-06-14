import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../global_variables/global_variables.dart';
import '../../theme/pallete.dart';

class AddTagContainer extends StatelessWidget {
  const AddTagContainer({super.key,required this.totalWidth});
  final double totalWidth;

  @override
  Widget build(BuildContext context) {
    List<String> tagList=[
      "watches",
      "sports",
      "clothes",
      "bottles"
    ];
    final selectedTagProvider = StateProvider<String?>((ref) {
return null;
    });
    return   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Add Tag",style: GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
        Consumer(builder: (context, ref, child3) {
          final selectedTag=ref.watch(selectedTagProvider);
          return Container(
            width: totalWidth,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                border: Border.all(color: Pallete.textFieldBorderColor)
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder:(context, index) {
                return Padding(
                  padding:  EdgeInsets.all(width*(0.005)),
                  child: InkWell(
                    onTap: () {
                      ref.read(selectedTagProvider.notifier).update((state) => tagList[index]);
                    },
                    child: Container(
                      width: width*(0.045),
                      height: height*(0.023),
                      decoration: BoxDecoration(
                          color: tagList.contains(selectedTag)?Pallete.selectedBlueColor:Pallete.homeBackgroundColor,
                          borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Text(tagList[index],style: GoogleFonts.poppins(fontSize:width*(0.008),color: Pallete.blackColor,),),
                          Icon(Icons.clear,size:width*(0.008),color:Pallete.blackColor)
                        ],
                      ),
                    ),
                  ),
                );
              }, ),
          );
        }),
        Text("",style: GoogleFonts.poppins(fontSize:width*(0.008),color: Pallete.textGreyColor,))

      ],
    );
  }
}
