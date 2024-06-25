import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/utils.dart';
import '../../../model/admin_model.dart';
import '../../HomePage/screen/home_screen.dart';
import '../repository/auth_repository.dart';


final adminProvider = NotifierProvider<Admin, AdminModel?>(() => Admin());

final authControllerProvider = NotifierProvider<AuthController, bool>(() => AuthController());
class AuthController extends Notifier<bool>{

  @override
  bool build() {
    return false;
  }

  AuthRepository get _authRepository => ref.read(authRepositoryProvider);
/// sign in Admin
  signInAdmin({required String email,required String password,required BuildContext context}) async {
    print("ssssssssssssss$email");
    print("ssssssssssssss$password");
    final admin = await _authRepository.signInAdmin(email: email, password: password);
    admin.fold((l) => showSnackBar(context,'Invalid Email/Password or Admin No Longer Exist'), (adminModel) async {
      ref.read(adminProvider.notifier).update(adminModel);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('uid', adminModel.id);
      if(context.mounted) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
                (route) => false);
      }
    });
  }
  /// get Admin
  getLoggedAdmin(String aid){
    return _authRepository.getLoggedAdmin(aid);
  }
}

class Admin extends Notifier<AdminModel?>{
  @override
  AdminModel? build() {
    return null;
  }

  update(AdminModel adminModel){
    state = adminModel;
  }


}