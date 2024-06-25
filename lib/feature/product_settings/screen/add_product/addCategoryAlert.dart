import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/global_variables/global_variables.dart';
import '../../../../core/theme/pallete.dart';
import 'dart:html' as html;

void addCategoryAlertBox({required WidgetRef ref,required BuildContext context,}) {
  TextEditingController categoryName=TextEditingController();

  /// img Provider
  final categoryImgProvider = StateProvider<XFile?>((ref) {
return null;
  });
  /// image picking
  final ImagePicker _picker = ImagePicker();
  Future<void> _pickImage(WidgetRef ref) async {
    if (kIsWeb) {
      /// Web image picker
      final html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
      uploadInput.accept = 'image/*';
      uploadInput.click();

      uploadInput.onChange.listen((event) {
        final html.File file = uploadInput.files!.first;
        final reader = html.FileReader();

        reader.readAsDataUrl(file);
        reader.onLoadEnd.listen((e) {
            ref.watch(categoryImgProvider.notifier).update((state) =>XFile(reader.result as String));
        });
      });
    } else {
      /// Mobile (iPad) image picker
      final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

        ref.watch(categoryImgProvider.notifier).update((state) => pickedFile!);
    }
  }
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context1) => AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      backgroundColor: Pallete.whiteColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)),
      // actionsPadding: EdgeInsets.only(bottom: height * 0.05),
      content: Consumer(
        builder: (context,ref,child) {
          final categoryImage=ref.watch(categoryImgProvider);
          return SizedBox(
            height: height * 0.4,
            width: width * 0.4,
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Category Name",style: GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
                SizedBox(
                  width: width*(0.35),
                  height: 50,
                  child: TextFormField(
                    controller: categoryName,
                    style:  GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      enabledBorder:const OutlineInputBorder(
                        borderSide:  BorderSide(
                            color: Pallete.textFieldBorderColor),
                      ),
                      border:const OutlineInputBorder(
                          borderSide:  BorderSide(
                              color: Pallete.textFieldBorderColor)),
                      focusedBorder:const OutlineInputBorder(
                        borderSide:  BorderSide(
                          color: Pallete.textFieldBorderColor,
                        ),
                      ),
                      contentPadding:const EdgeInsetsDirectional.only(top: 8,start: 10),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
            Text("Category Image",style: GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
            Container(
              height: height*(0.25),
              width: width*(0.25),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Pallete.textFieldBorderColor),
                  color: Pallete.whiteColor
              ),
              child: categoryImage!=null?
              kIsWeb?Image.network(categoryImage.path,fit: BoxFit.fill,)
                  :Image.file(File(categoryImage.path),fit: BoxFit.fill,)
                  :Center(
                child: InkWell(
                  onTap: () {
                    _pickImage(ref);
                  },
                  child: Icon(Icons.add,size: 40,color: Pallete.greyColor,),
                ),
              ),
            )
              ],
            ),
          );
        }
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            minimumSize: Size(width * 0.11, height * 0.06),
            backgroundColor: Pallete.whiteColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(color: Pallete.textFieldBorderColor)),
          ),
          child: Text(
            'Cancel',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Pallete.blackColor),
          ),
        ),
        ElevatedButton(
          onPressed: () {

          },
          style: ElevatedButton.styleFrom(
            minimumSize: Size(width * 0.11, height * 0.06),
            backgroundColor: Pallete.whiteColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(color: Pallete.textFieldBorderColor)),
          ),
          child: Text(
            'Add',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Pallete.blackColor),
          ),
        ),
      ],
    ),
  );
}