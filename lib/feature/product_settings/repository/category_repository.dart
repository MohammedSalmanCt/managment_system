import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:managment_system/core/commons/search.dart';
import '../../../core/constants/firebase_constants.dart';
import '../../../core/providers/firebase_providers.dart';
import '../../../model/category_model.dart';
import '../../../model/settings_model.dart';


final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
  return CategoryRepository(firestore: ref.watch(firestoreProvider));
});

class CategoryRepository{
  final FirebaseFirestore _firestore;
  CategoryRepository({required FirebaseFirestore firestore}):_firestore=firestore;

  CollectionReference get _category => _firestore.collection(FirebaseConstants.categoryCollections);
  DocumentReference get _settings => _firestore.collection(FirebaseConstants.settingsCollections).doc(FirebaseConstants.settingsCollections);
  /// Add category
 addCategory({required String categoryName,required String image}) async {
   /// Auto Inrement category Id
   int count=0;
   DocumentSnapshot settings = await _settings.get();
   SettingSModel settingsModel = SettingSModel.fromMap(settings.data() as Map<String,dynamic>);
   SettingSModel set = settingsModel.copyWith(categoryId: settingsModel.categoryId+1);
   await _settings.update(set.toMap());
   count=int.tryParse(settingsModel.categoryId.toString())!;

   //add Admin
   var i=Timestamp.now().millisecondsSinceEpoch;
   String docId = 'lmtca$count$i'.toString();
   String id=docId.substring(0,15);
   DocumentReference reference = _category.doc(id);

   CategoryModel categoryModel=CategoryModel(categoryName: categoryName,
       id: id,
       delete: false,
       search: setSearchParam(categoryName.toUpperCase().trim()),
       createdTime: DateTime.now(),
       image: image,
       status: 0,
   reference: reference);
 }

}