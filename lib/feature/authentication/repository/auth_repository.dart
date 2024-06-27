import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import '../../../core/constants/firebase_constants.dart';
import '../../../core/failure.dart';
import '../../../core/providers/firebase_providers.dart';
import '../../../core/type_def.dart';
import '../../../model/admin_model.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(firestore: ref.watch(firestoreProvider));
});

class AuthRepository{
  final FirebaseFirestore _firestore;
  AuthRepository({required FirebaseFirestore firestore}):_firestore=firestore;

  CollectionReference get _admin => _firestore.collection(FirebaseConstants.adminCollections);
  /// sign in Admin
  FutureEither<AdminModel> signInAdmin({required String email,required String password}) async {
    try{
      AdminModel adminModel = await getAdmin(password: password, email: email);
      if(adminModel.email == email && adminModel.password == password){
        return right(adminModel);
      }
      else{
        throw "Invalid Email or Password";
      }
    }
    on FirebaseException catch( em ){
      throw em.message!;
    }
    // on SocketException {
    //   return left(Failure('Check your Connection'));
    // }
    catch (e){
      return left(Failure(e.toString()));
    }
  }
/// get Admin checking
  Future<AdminModel> getAdmin({required String email,required String password}) async {
    var adminSnapshot = await  _admin.where('email',isEqualTo: email)
        .where("delete",isEqualTo: false)
        .where('password',isEqualTo: password).get();

    DocumentSnapshot admin = adminSnapshot.docs.first;
    AdminModel adminModel = AdminModel.fromMap(admin.data() as Map<String,dynamic>);
    return adminModel;
  }
/// get Admin
  getLoggedAdmin(String aid) async {
    DocumentSnapshot admin = await _admin.doc(aid).get();
    AdminModel adminModel = AdminModel.fromMap(admin.data() as Map<String,dynamic>);
    return adminModel;
  }

}