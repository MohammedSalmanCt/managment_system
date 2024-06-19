import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../global_variables/global_variables.dart';
import '../../theme/pallete.dart';

class AddTagContainer extends StatelessWidget {
  const AddTagContainer({super.key,required this.totalWidth,required this.tagContainerSize,
  required this.tagTextSize});
  final double totalWidth;
  final double tagContainerSize;
  final double tagTextSize;

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
              itemCount: tagList.length,
              itemBuilder:(context, index) {
                return Padding(
                  padding:  EdgeInsets.all(width*(0.003)),
                  child: InkWell(
                    onTap: () {
                      ref.read(selectedTagProvider.notifier).update((state) => tagList[index]);
                      print(tagList[index]);
                    },
                    child: Container(
                      width: tagContainerSize,
                      height: height*(0.023),
                      decoration: BoxDecoration(
                          color: selectedTag==tagList[index]?Pallete.selectedBlueColor:Pallete.homeBackgroundColor,
                          borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(tagList[index],style: GoogleFonts.poppins(fontSize:tagTextSize,color: Pallete.blackColor,),),
                          Icon(Icons.clear,size:tagTextSize,color:Pallete.blackColor)
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
