import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:managment_system/core/commons/error.dart';
import 'package:managment_system/core/commons/loader.dart';
import 'package:managment_system/core/utils.dart';
import 'package:managment_system/feature/authentication/controller/auth_controller.dart';
import 'package:managment_system/feature/product_settings/controller/category_controller.dart';
import '../../../../core/global_variables/global_variables.dart';
import '../../../../core/theme/pallete.dart';
import 'dart:html' as html;

void addCategoryAlertBox({required WidgetRef ref,required BuildContext context,required String text}) {
  TextEditingController categoryName=TextEditingController();

  /// img Provider
  final categoryImgProvider = StateProvider<XFile?>((ref) {
return null;
  });
  /// category provider
  final categoryIdProvider = StateProvider<String?>((ref) {
    return null;
  });
  final categoryNameProvider = StateProvider<String?>((ref) {
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

  /// add category
  addCategory(){
    final image= ref.read(categoryImgProvider);
    ref.read(categoryControllerProvider.notifier).addCategory(categoryName: categoryName.text.trim(), context: context,
        image: image!);
    categoryName.clear();
    ref.read(categoryIdProvider.notifier).update((state) => null);
    ref.read(categoryImgProvider.notifier).update((state) => null);
  }

  /// add Subcategory
  addSubCategory(){
    final image= ref.read(categoryImgProvider);
    final categoryId= ref.read(categoryIdProvider);
    ref.read(categoryControllerProvider.notifier).addSubCategory(categoryName: categoryName.text.trim(), context: context,
        image: image!,categoryId: categoryId!);
    categoryName.clear();
    ref.read(categoryIdProvider.notifier).update((state) => null);
    ref.read(categoryImgProvider.notifier).update((state) => null);
  }
  /// alert
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
          final loader=ref.watch(categoryControllerProvider);
          return Container(
            height: height * 0.5,
            width: width * 0.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Pallete.whiteColor,
            ),
            child: loader?
                Center(
                  child: Loader(),
                )
                :Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("$text Name",style: GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
                    SizedBox(
                      width: width*(0.28),
                      height: 50,
                      child: TextFormField(
                        controller: categoryName,
                        style:  GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,),
                        keyboardType: TextInputType.text,
                        decoration:const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:  BorderSide(
                                color: Pallete.textFieldBorderColor),
                          ),
                          border: OutlineInputBorder(
                              borderSide:  BorderSide(
                                  color: Pallete.textFieldBorderColor)),
                          focusedBorder: OutlineInputBorder(
                            borderSide:  BorderSide(
                              color: Pallete.textFieldBorderColor,
                            ),
                          ),
                          contentPadding: EdgeInsetsDirectional.only(top: 8,start: 10),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
            SizedBox(
              width: width*(0.2),
              child: Column(
                children: [
               categoryImage!=null?Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          _pickImage(ref,);
                        },
                        child:Icon(Icons.add_photo_alternate_outlined,color: Pallete.blackColor,size: width*(0.015)),
                      ),
                      SizedBox(width: width*(0.01),),
                      InkWell(
                        onTap: () {
                          ref.watch(categoryImgProvider.notifier).update((state) => null);
                        },
                        child:Icon(Icons.delete_outline,color: Colors.red,size: width*(0.015)),
                      ),
                    ],
                  )
                  :SizedBox(),
                  Container(
                    height: width*(0.1),
                    width: width*(0.2),
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
                  ),
                ],
              ),
            ),
               text!="Category"? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Text("Choose Category",style: GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
                    Consumer(builder: (context, ref, child3) {
                      final admin=ref.watch(adminProvider);
                     return ref.watch(getCategoriesProvider(admin!.id)).when(data:(categories) {
                       Map<String,dynamic> categoryMap={};
                       for(var i in categories)
                         {
                           categoryMap[i.categoryName]=i.id;
                         }
                       List<String> categoryNames=categoryMap.keys.toList();
                       return SizedBox(
                         width: width*(0.28),
                         height: 50,
                         child: DropdownButtonFormField(
                           validator: (value3) {
                             var val2 = value3 ?? '';
                             if (val2.isEmpty) {
                               return 'Please Choose Category';
                             }
                             return null;
                           },
                           decoration: InputDecoration(
                               focusColor: Colors.transparent,
                               hoverColor: Colors.transparent,
                               hintText: 'Category',
                               hintStyle:  GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,),
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
                               contentPadding: EdgeInsetsDirectional.only(top:8,start: 10)
                           ),
                           value: ref.watch(categoryNameProvider),
                           onChanged: (String? newValue) {
                             ref.read(categoryIdProvider.notifier)
                                 .update((state) => categoryMap[newValue]);
                             ref.read(categoryNameProvider.notifier)
                                 .update((state) => newValue);
                           },
                           items:categoryNames.map<DropdownMenuItem<String>>(
                                   (String value) {
                                 return DropdownMenuItem<String>(
                                   value: value,
                                   child: Text(
                                     value,
                                     style:
                                     GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,),
                                   ),
                                 );
                               }).toList(),
                         ),
                       );
                     },
                         error: (error, stackTrace) {
                       print(error);
                           return ErrorText(error: error.toString());
                         },
                         loading: () => Loader(),);
                    }),
                  ],
                )
                   :SizedBox()
              ],
            ),
          );
        }
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            categoryName.clear();
            ref.read(categoryIdProvider.notifier).update((state) => null);
            ref.read(categoryImgProvider.notifier).update((state) => null);
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            minimumSize: Size(width * 0.11, height * 0.06),
            backgroundColor: Pallete.whiteColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(color: Pallete.textFieldBorderColor)),
          ),
          child:const Text(
            'Cancel',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Pallete.blackColor),
          ),
        ),
        ElevatedButton(
          onPressed: () {
              if(categoryName.text.isEmpty){
                showSnackBar(context1, "Please add Name");
              }
            else if(text=="Category"){
              addCategory();
            }
            else{
              if(ref.read(categoryIdProvider)==null)
                {
                  showSnackBar(context1, "Please Choose Category");
                }
              else{
                addSubCategory();
              }
              }
          },
          style: ElevatedButton.styleFrom(
            minimumSize: Size(width * 0.11, height * 0.06),
            backgroundColor: Pallete.whiteColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(color: Pallete.textFieldBorderColor)),
          ),
          child:const  Text(
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