import 'dart:io';
import 'dart:math';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:managment_system/core/commons/loader.dart';
import 'package:managment_system/core/global_variables/global_variables.dart';
import 'package:managment_system/feature/authentication/controller/auth_controller.dart';
import '../../../../core/theme/pallete.dart';
import 'dart:html' as html;

class ProductGallery extends StatefulWidget {
  const ProductGallery({super.key, required this.device});
  final bool device;

  @override
  State<ProductGallery> createState() => _ProductGalleryState();
}

class _ProductGalleryState extends State<ProductGallery> {
  /// image picking
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(WidgetRef ref, [int? index]) async {
    final imageList = ref.watch(imagePickProvider);
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
          if (imageList.isNotEmpty && index != null) {
            ref.watch(imagePickProvider.notifier).update((state) {
              final newList = List<XFile>.from(state);
              newList[index] = XFile(reader.result as String);
              return newList;
            });
          } else {
            ref.watch(imagePickProvider.notifier).update((state) => [...state, XFile(reader.result as String)]);
          }
        });
      });
    } else {
      /// Mobile (iPad) image picker
      final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        if (imageList.isNotEmpty && index != null) {
          ref.watch(imagePickProvider.notifier).update((state) {
            final newList = List<XFile>.from(state);
            newList[index] = pickedFile;
            return newList;
          });
        } else {
          ref.watch(imagePickProvider.notifier).update((state) => [...state, pickedFile]);
        }
      }
    }
  }
  /// image pick loading
  final editImageLoadingProvider = StateProvider<bool>((ref) {
return false;
  });
  /// edit image picked
  Future<void> _editPickImage(WidgetRef ref, [int? index]) async {
    ref.read(editImageLoadingProvider.notifier).update((state) => true);
    final imageList = ref.watch(imagePickProvider);
    final admin=ref.read(adminProvider);
    var storageRef = FirebaseStorage.instance.ref()
        .child("${admin?.name}/Product/${DateTime.now().microsecondsSinceEpoch}");
    print("Storage reference created");
    final metaData = SettableMetadata(contentType: 'image/png');
    if (kIsWeb) {
      /// Web image picker
      final html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
      uploadInput.accept = 'image/*';
      uploadInput.click();

      uploadInput.onChange.listen((event) {
        final html.File file = uploadInput.files!.first;
        final reader = html.FileReader();

        reader.readAsDataUrl(file);
        reader.onLoadEnd.listen((e) async {
          XFile xFile= XFile(reader.result as String);
         dynamic file = await xFile.readAsBytes();
          /// Create a web-compatible Blob object
          final html.Blob webBlob = html.Blob([file]);
          UploadTask uploadTask = storageRef.putBlob(webBlob, metaData);
          /// Wait for the upload to complete
          var snapshot = await uploadTask.whenComplete(() => {});
          print('Upload complete');
          // Get the download URL
          String downloadUrl = await snapshot.ref.getDownloadURL();
          if (imageList.isNotEmpty && index != null) {
            ref.watch(productEditImageListProvider.notifier).update((state) {
              final newList = List<String>.from(state);
              newList[index] = downloadUrl;
              return newList;
            });
          } else {
            ref.watch(productEditImageListProvider.notifier).update((state) => [...state, downloadUrl]);
          }
          ref.read(editImageLoadingProvider.notifier).update((state) => false);
        });
      });
    } else {
      /// Mobile (iPad) image picker
      final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
       File file = File(pickedFile.path);
     UploadTask uploadTask = storageRef.putFile(file, metaData);
       /// Wait for the upload to complete
       var snapshot = await uploadTask.whenComplete(() => {});
       String downloadUrl = await snapshot.ref.getDownloadURL();
        if (imageList.isNotEmpty && index != null) {
          ref.watch(productEditImageListProvider.notifier).update((state) {
            final newList = List<String>.from(state);
            newList[index] = downloadUrl;
            return newList;
          });
        } else {
          ref.watch(productEditImageListProvider.notifier).update((state) => [...state, downloadUrl]);
        }
       ref.read(editImageLoadingProvider.notifier).update((state) => false);
      }
    }
  }

  /// delete confirmation alert in gridView images
  void deleteConfirmationAlert({
    required WidgetRef ref,
    required int index,
  }) {
    final imageList = ref.watch(imagePickProvider);
    final heading=ref.watch(headingProvider);
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context1) => AlertDialog(
        contentTextStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: Pallete.whiteColor,
            fontSize:width * 0.015),
        actionsAlignment: MainAxisAlignment.center,
        backgroundColor: Pallete.backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        actionsPadding: EdgeInsets.only(bottom:height * 0.05),
        content: SizedBox(
          height:height * 0.15,
          width:width * 0.25,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Are you sure delete this image?',
                style: GoogleFonts.poppins(
                  color: Pallete.blackColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(MediaQuery.of(context).size.width * 0.11,height * 0.06),
              backgroundColor: Pallete.whiteColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * 0.02),
                  side: const BorderSide(color: Pallete.textFieldBorderColor)),
            ),
            child: Text(
              'Cancel',
              style: GoogleFonts.poppins(
                color: Pallete.blackColor,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if(heading!="Edit Product"){
                ref
                    .read(imagePickProvider.notifier)
                    .update((state) => List.from(imageList)..removeAt(index));
              }
              else{
                final editImageList=ref.read(productEditImageListProvider);
                ref.read(productEditImageListProvider.notifier).update((state) => List.from(editImageList)..removeAt(index));
              }
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(MediaQuery.of(context).size.width * 0.11,height * 0.06),
              backgroundColor: Pallete.whiteColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * 0.02),
                  side: const BorderSide(color: Pallete.textFieldBorderColor)),
            ),
            child: Text(
              'Delete',
              style: GoogleFonts.poppins(
                color: Pallete.blackColor,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final pickImage = ref.watch(imagePickProvider);
        final heading=ref.watch(headingProvider);
        final editImgLoading=ref.read(editImageLoadingProvider);
        final editImgList=ref.watch(productEditImageListProvider);
        int itemCount = max(0, min(heading=="Edit Product"?editImgList.length:pickImage.length, 4));
        print(editImgList);
        print(editImgLoading);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              "Product Image",
              style: GoogleFonts.poppins(
                color: Pallete.blackColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            Container(
              width:width * 0.42,
              height:height * 0.15,
              decoration: BoxDecoration(
                  border: Border.all(color: Pallete.textFieldBorderColor)),
              child: heading=="Edit Product"?Center(
                child: editImgLoading?Loader()
                    :editImgList.isEmpty
                    ? InkWell(
                  onTap: () {
                    _editPickImage(ref);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_photo_alternate_outlined,
                        color: Pallete.blackColor,
                        size:width * 0.023,
                      ),
                      Text(
                        "Pick your image here",
                        style: GoogleFonts.poppins(
                            color: Pallete.textGreyColor,
                            fontWeight: FontWeight.w400,
                            fontSize:width * 0.008),
                      ),
                    ],
                  ),
                )
                    : Row(
                  children: [
                  Container(
                    width:width * 0.15,
                    height:height * 0.15,
                    decoration: BoxDecoration(
                        border: Border.all(color: Pallete.textFieldBorderColor)),
                    child: Image.network(
                      editImgList[0],
                      fit: BoxFit.fill,
                    ),
                  ),
                    Row(
                      children: [
                        SizedBox(width:width * 0.01),
                        InkWell(
                          onTap: () {
                            _editPickImage(ref,0);
                          },
                          child: Icon(
                            Icons.add_photo_alternate_outlined,
                            color: Pallete.blackColor,
                            size:width * 0.015,
                          ),
                        ),
                        SizedBox(width:width * 0.01),
                        InkWell(
                          onTap: () {

                              if (editImgList.isNotEmpty) {
                                ref
                                    .watch(productEditImageListProvider.notifier)
                                    .update((state) =>
                                List.from(editImgList)
                                  ..removeAt(0));
                              } else {
                                ref
                                    .watch(productEditImageListProvider.notifier)
                                    .update((state) => []);
                              }
                                },
                          child: Icon(
                            Icons.delete_outline,
                            color: Colors.red,
                            size:width * 0.015,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
                  :Center(
                child: pickImage.isEmpty
                    ? InkWell(
                  onTap: () {
                   _pickImage(ref);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_photo_alternate_outlined,
                        color: Pallete.blackColor,
                        size:width * 0.023,
                      ),
                      Text(
                        "Pick your image here",
                        style: GoogleFonts.poppins(
                            color: Pallete.textGreyColor,
                            fontWeight: FontWeight.w400,
                            fontSize:width * 0.008),
                      ),
                    ],
                  ),
                )
                    : Row(
                  children: [
                Container(
                      width:width * 0.15,
                      height:height * 0.15,
                      decoration: BoxDecoration(
                          border: Border.all(color: Pallete.textFieldBorderColor)),
                      child:  kIsWeb
                          ? Image.network(
                        pickImage[0].path,
                        fit: BoxFit.fill,
                      )
                          : Image.file(
                        File(pickImage[0].path),
                        fit: BoxFit.fill,
                      )
                    ),
                    Row(
                      children: [
                        SizedBox(width:width * 0.01),
                        InkWell(
                          onTap: () {
                          _pickImage(ref,0);
                          },
                          child: Icon(
                            Icons.add_photo_alternate_outlined,
                            color: Pallete.blackColor,
                            size:width * 0.015,
                          ),
                        ),
                        SizedBox(width:width * 0.01),
                        InkWell(
                          onTap: () {
                                    if (pickImage.isNotEmpty) {
                                      ref
                                          .watch(imagePickProvider.notifier)
                                          .update((state) =>
                                              List.from(pickImage)
                                                ..removeAt(0));
                                    } else {
                                      ref
                                          .watch(imagePickProvider.notifier)
                                          .update((state) => []);
                                    }
                                },
                          child: Icon(
                            Icons.delete_outline,
                            color: Colors.red,
                            size:width * 0.015,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Product Gallery",
              style: GoogleFonts.poppins(
                color: Pallete.blackColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            Container(
              width: width * 0.42,
              height: height * 0.18,
              decoration: BoxDecoration(
                  border: Border.all(color: Pallete.textFieldBorderColor)),
              child: GridView.builder(
                itemCount: itemCount,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: widget.device ? 4 : 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: widget.device ? 1/.8 : 1 / .32,
                ),
                itemBuilder: (context, index) {
                  return heading!="Edit Product"?Container(
                    width: widget.device
                        ? width * 0.15
                        : width * 0.2,
                    height: widget.device
                        ?width * 0.15
                        : height * 0.08,
                    decoration: BoxDecoration(
                        border: Border.all(color: Pallete.textFieldBorderColor)),
                    child: index == pickImage.length - 1 || index + 1 == pickImage.length
                        ? InkWell(
                      onTap: () {
                        _pickImage(ref);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.upload_file_outlined,
                            color: Pallete.blackColor,
                            size: width * 0.023,
                          ),
                          Text(
                            "Add Product Gallery Images",
                            style: GoogleFonts.poppins(
                                color: Pallete.textGreyColor,
                                fontWeight: FontWeight.w400,
                                fontSize: width * 0.008),
                          ),
                        ],
                      ),
                    )
                        : InkWell(
                      onTap: () {
                        deleteConfirmationAlert(ref: ref, index: index + 1);
                      },
                      child: SizedBox(
                        child: kIsWeb
                            ? Image.network(
                          pickImage[index + 1].path,
                          fit: BoxFit.fill,
                        )
                            : Image.file(
                          File(pickImage[index + 1].path),
                          fit: BoxFit.fill,
                        )
                      ),
                    ),
                  )
                  : Container(
                    width: widget.device
                        ? width * 0.15
                        : width * 0.2,
                    height: widget.device
                        ?width * 0.15
                        : height * 0.08,
                    decoration: BoxDecoration(
                        border: Border.all(color: Pallete.textFieldBorderColor)),
                    child: index == editImgList.length - 1 || index + 1 == editImgList.length
                        ? editImgLoading?
                        Loader()
                        :InkWell(
                      onTap: () {
                        _editPickImage(ref);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.upload_file_outlined,
                            color: Pallete.blackColor,
                            size: width * 0.023,
                          ),
                          Text(
                            "Add Product Gallery Images",
                            style: GoogleFonts.poppins(
                                color: Pallete.textGreyColor,
                                fontWeight: FontWeight.w400,
                                fontSize: width * 0.008),
                          ),
                        ],
                      ),
                    )
                        : InkWell(
                      onTap: () {
                        deleteConfirmationAlert(ref: ref, index: index + 1);
                      },
                      child: SizedBox(
                          child: Image.network(
                            editImgList[index + 1],
                            fit: BoxFit.fill,
                          )
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
          ],
        );
      },
    );
  }
}
