import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:managment_system/core/constants/asset_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/global_variables/global_variables.dart';
import '../../../core/theme/pallete.dart';
import '../../../model/admin_model.dart';
import '../../HomePage/screen/home_screen.dart';
import '../controller/auth_controller.dart';
import 'login_screen.dart';
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
/// keep login checking
  getLocalStatus() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.containsKey('uid')) {
      String? aid =pref.getString('uid');
      AdminModel adminModel = await ref.watch(authControllerProvider.notifier).getLoggedAdmin(aid??'');
      ref.read(adminProvider.notifier).update(adminModel);
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomeScreen(),), (route) => false);
    } else {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginScreen(),), (route) => false);
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getLocalStatus();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: Pallete.whiteColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: height*0.6,
                width: 400,
                child: SvgPicture.asset(AssetConstants.logo,fit: BoxFit.fill,)
              ),
            ],
          ),
        ),
      )
    );
  }

}
