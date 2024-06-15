import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:managment_system/core/global_variables/global_variables.dart';
import '../../../../../core/theme/pallete.dart';
import 'dart:html' as html;

class ProductGallery extends StatefulWidget {
  const ProductGallery({super.key});

  @override
  State<ProductGallery> createState() => _ProductGalleryState();
}

class _ProductGalleryState extends State<ProductGallery> {
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;

  Future<void> _pickImage() async {
    if (kIsWeb) {
      // Web image picker
      final html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
      uploadInput.accept = 'image/*';
      uploadInput.click();

      uploadInput.onChange.listen((event) {
        final html.File file = uploadInput.files!.first;
        final reader = html.FileReader();

        reader.readAsDataUrl(file);
        reader.onLoadEnd.listen((e) {
          setState(() {
            _imageFile = XFile(reader.result as String);
          });
        });
      });
    } else {
      // Mobile (iPad) image picker
      final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        _imageFile = pickedFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
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
           child: InkWell(
             onTap: () {
               _pickImage();
             },
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Icon(Icons.add_photo_alternate_outlined,color: Pallete.blackColor,size: width*(0.023),),
                 Text("Pick your image here",style: GoogleFonts.poppins(color: Pallete.textGreyColor,fontWeight: FontWeight.w400,fontSize:width*(0.008)))
               ],
             ),
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
         child:   Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               // Icon(Icons.upload_file_outlined,color: Pallete.blackColor,size: width*(0.023),),
               _imageFile == null
                   ? Text('No image selected.')
                   : kIsWeb
                   ? Image.network(_imageFile!.path)
                   : Image.file(File(_imageFile!.path))
               // Text("Add Product Gallery Images",style: GoogleFonts.poppins(color: Pallete.textGreyColor,fontWeight: FontWeight.w400,fontSize:width*(0.008)))
             ],
           ),
         ),
       ),
        SizedBox(height: 10,),
      ],);
  }
}
