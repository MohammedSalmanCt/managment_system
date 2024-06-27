import 'dart:html' as html;
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';
import '../failure.dart';
import '../providers/firebase_providers.dart';
import '../type_def.dart';

final storageRepositoryProvider = Provider<StorageRepository>((ref) {
  return  StorageRepository(firebaseStorage: ref.watch(storageProvider));
});


class StorageRepository {
  final FirebaseStorage _firebaseStorage;
  StorageRepository({required FirebaseStorage firebaseStorage})
      : _firebaseStorage = firebaseStorage;

  FutureEither<List<String>> getImageUrl({
    required String storeFolder,
    required List<XFile> image,
  }) async {
    try {
      List<String> imageUrls=[];
      for(int i=0;i<image.length;i++){
        dynamic file;
        if (kIsWeb) {
          /// Convert XFile to Blob
          file = await image[i].readAsBytes();
        } else {
          /// On mobile platforms, convert XFile to File
          file = File(image[i].path);
        }
        print("file.lengthSync()ssss");

        var storageRef = _firebaseStorage
            .ref()
            .child("$storeFolder/${DateTime.now().microsecondsSinceEpoch}");
        print("Storage reference created");
        final metaData = SettableMetadata(contentType: 'image/png');
        print("Metadata set");
        UploadTask uploadTask;
        if (kIsWeb) {
          /// Create a web-compatible Blob object
          final html.Blob webBlob = html.Blob([file]);
          uploadTask = storageRef.putBlob(webBlob, metaData);
        } else {
          uploadTask = storageRef.putFile(file, metaData);
        }

        /// Wait for the upload to complete
        var snapshot = await uploadTask.whenComplete(() => {});
        print('Upload complete');
        // Get the download URL
        String downloadUrl = await snapshot.ref.getDownloadURL();
        print("Download URL: $downloadUrl");
        imageUrls.add(downloadUrl);
      }
      return right(imageUrls);
    } on FirebaseException catch (error) {
      return left(Failure(error.message!));
    } catch (e) {
      print("Exception: $e");
      return left(Failure(e.toString()));
    }
  }
}
