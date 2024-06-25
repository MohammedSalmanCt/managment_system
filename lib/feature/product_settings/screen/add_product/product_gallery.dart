import 'dart:io';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:managment_system/core/global_variables/global_variables.dart';
import '../../../../core/theme/pallete.dart';
import 'dart:html' as html;


class ProductGallery extends StatefulWidget {
  const ProductGallery({super.key,required this.device});
  final bool device;

  @override
  State<ProductGallery> createState() => _ProductGalleryState();
}

class _ProductGalleryState extends State<ProductGallery> {
  /// image picking
  final ImagePicker _picker = ImagePicker();
  Future<void> _pickImage(WidgetRef ref,[int? index]) async {
    final imageList=ref.watch(imagePickProvider);
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
          if(imageList.isNotEmpty && index==0)
          {
            ref.watch(imagePickProvider.notifier).update((state) => List.from(imageList)..removeAt(0));
            final newList = ref.watch(imagePickProvider);
            ref.watch(imagePickProvider.notifier).update((state) => List.from(newList)
              ..insert(0,XFile(reader.result as String)));
          }
          else if(imageList.isEmpty){
            ref.read(imagePickProvider.notifier).update((state) => [XFile(reader.result as String)]);
          }
          else {
            ref.watch(imagePickProvider.notifier).update((state) => [...state,XFile(reader.result as String)]);
          }
        });
      });
    } else {
      /// Mobile (iPad) image picker
      final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if(imageList.isNotEmpty && index==0)
        {
          ref.watch(imagePickProvider.notifier).update((state) => List.from(imageList)..removeAt(0));
          final newList = ref.watch(imagePickProvider);
          ref.watch(imagePickProvider.notifier).update((state) => List.from(newList)
            ..insert(0,pickedFile!));
        }
      else if(imageList.isEmpty){
        ref.read(imagePickProvider.notifier).update((state) => [pickedFile!]);
      }
      else {
        ref.watch(imagePickProvider.notifier).update((state) => [...state,pickedFile!]);
      }
    }
  }

  /// delete confirmation alert in gridView images
  void deleteConfirmationAlert({
    required WidgetRef ref,
    required int index,
  }) {
    final imageList=ref.watch(imagePickProvider);
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context1) => AlertDialog(
        contentTextStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: Pallete.whiteColor,
            fontSize: width * 0.015),
        actionsAlignment: MainAxisAlignment.center,
        backgroundColor:Pallete.backgroundColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),
        actionsPadding: EdgeInsets.only(bottom: height * 0.05),
        content: SizedBox(
          height: height * 0.15,
          width: width * 0.25,
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Are you sure delete this image ?',style: GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,)),
            ],
          ),
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
                  borderRadius: BorderRadius.circular(height * 0.02),
                  side: const BorderSide(color: Pallete.textFieldBorderColor)),
            ),
            child: Text(
                'Cancel',
                style: GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,)
            ),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(imagePickProvider.notifier).update((state) => List.from(imageList)..removeAt(index));
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(width * 0.11, height * 0.06),
              backgroundColor: Pallete.whiteColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(height * 0.02),
                  side: const BorderSide(color: Pallete.textFieldBorderColor)),
            ),
            child: Text(
                'Delete',
                style: GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,)
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Consumer(
        builder: (context,ref,child) {
          final pickImage=ref.watch(imagePickProvider);
          int itemCount = max(0, min(pickImage.length, 4));
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Text("Product Image",style: GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
              Container(
                width: width*(0.42),
                height: height*(0.15),
                decoration: BoxDecoration(
                    border: Border.all(color:Pallete.textFieldBorderColor)
                ),
                child:   Center(
                  child: pickImage.isEmpty?InkWell(
                    onTap: () {
                      _pickImage(ref);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.add_photo_alternate_outlined,color: Pallete.blackColor,size: width*(0.023),),
                        Text("Pick your image here",style: GoogleFonts.poppins(color: Pallete.textGreyColor,fontWeight: FontWeight.w400,fontSize:width*(0.008)))
                      ],
                    ),
                  )
                      :  Row(
                    children: [
                      Container(
                        width: width*(0.15),
                        height: height*(0.15),
                        decoration: BoxDecoration(
                            border: Border.all(color:Pallete.textFieldBorderColor)
                        ),
                        child:kIsWeb? Image.network(pickImage[0].path,fit: BoxFit.fill,)
                            :Image.file(File(pickImage[0].path),fit: BoxFit.fill,),
                      ),
                      Row(
                        children: [
                          SizedBox(width: width*(0.01),),
                          InkWell(
                            onTap: () {
                              _pickImage(ref,0);
                            },
                            child:Icon(Icons.add_photo_alternate_outlined,color: Pallete.blackColor,size: width*(0.015)),
                          ),
                          SizedBox(width: width*(0.01),),
                          InkWell(
                            onTap: () {
                              ref.watch(imagePickProvider.notifier).update((state) => List.from(pickImage)..removeAt(0));
                            },
                            child:Icon(Icons.delete_outline,color: Colors.red,size: width*(0.015)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Text("Product Gallery",style: GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
              Container(
                width: width*(0.42),
                height: height*(0.18),
                decoration: BoxDecoration(
                    border: Border.all(color:Pallete.textFieldBorderColor)
                ),
                child:   GridView.builder(
                  itemCount: itemCount,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: widget.device?4:2,
                    crossAxisSpacing: 5,mainAxisSpacing: 5,
                    childAspectRatio: widget.device?1:1/.32,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                        width:widget.device? width*(0.15):width*(0.2),
                        height:widget.device? height*(0.18):height*(0.08),
                        decoration: BoxDecoration(
                            border: Border.all(color:Pallete.textFieldBorderColor)
                        ),
                        child: index==pickImage.length-1 || index + 1==pickImage.length?
                        InkWell(
                          onTap: () {
                            _pickImage(ref);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.upload_file_outlined,color: Pallete.blackColor,size: width*(0.023),),
                              Text("Add Product Gallery Images",style: GoogleFonts.poppins(color: Pallete.textGreyColor,fontWeight: FontWeight.w400,fontSize:width*(0.008)))
                            ],
                          ),
                        )
                            :InkWell(
                          onTap: () {
                            deleteConfirmationAlert(ref: ref, index: index + 1);
                          },
                          child: SizedBox(
                            child: kIsWeb? Image.network(pickImage[index + 1].path,fit: BoxFit.fill,)
                                :Image.file(File(pickImage[index + 1].path),fit: BoxFit.fill,),
                          ),
                        )
                    );
                  },),
              ),
              SizedBox(height: 10,),
            ],);
        }
    );
  }
}
