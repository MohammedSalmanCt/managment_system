import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/asset_constants.dart';
import '../../../core/global_variables/global_variables.dart';
import '../../../core/theme/pallete.dart';
import '../../HomePage/screen/home_screen.dart';
import '../controller/auth_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  /// role provider
  final roleProvider = StateProvider<String?>((ref) {
 return null;
  });
  /// passwordVisibilityProvider
  final passwordVisibilityProvider = StateProvider<bool>((ref) {
 return false;
  });
  /// controllers
TextEditingController emailController=TextEditingController();
TextEditingController passwordController=TextEditingController();
  /// admin login
  signInAdmin({required WidgetRef ref,required BuildContext context}){
    ref.read(authControllerProvider.notifier).signInAdmin(email: emailController.text.trim(), password: passwordController.text.trim(),
        context: context);
  }
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
     builder: (context, constraints) {
       return SafeArea(
           child:Scaffold(
               backgroundColor: Pallete.whiteColor,
               body:Row(
                 children: [
                  constraints.maxWidth >1024? Image.asset(AssetConstants.loginImg,
                     width: width*(0.57),
                     height: height,
                     fit: BoxFit.fill,):const SizedBox(),
                   SizedBox(width: 20,),
                   Expanded(
                     child: SizedBox(
                       height: height,
                       child: SingleChildScrollView(
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             SizedBox(height: 20),
                             SvgPicture.asset(AssetConstants.logo),
                             SizedBox(height: 26),
                             Text("Hi!"),
                             Text("Login to your dashboard"),
                             SizedBox(height:70),
                             SizedBox(
                               width: 600,
                               child:Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text("Login as",style: GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
                                   Consumer(builder: (context, ref, child3) {
                                     return SizedBox(
                                       height: 50,
                                       child: DropdownButtonFormField(
                                         validator: (value3) {
                                           var val2 = value3 ?? '';
                                           if (val2.isEmpty) {
                                             return 'Please Select a Role';
                                           }
                                           return null;
                                         },
                                         decoration: InputDecoration(
                                             focusColor: Colors.transparent,
                                             hoverColor: Colors.transparent,
                                             hintText: 'Select a Role',
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
                                         // dropdownColor: Pallete.whiteColor,
                                         value: ref.watch(roleProvider),
                                         onChanged: (String? newValue) {
                                           ref.read(roleProvider.notifier)
                                               .update((state) => newValue);
                                         },
                                         items: <String>[
                                           'Super Admin',
                                           'Admin',
                                         ].map<DropdownMenuItem<String>>(
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
                                   }),
                                   SizedBox(height:20),
                                   Text("Email",style: GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
                                   SizedBox(
                                     height: 50,
                                     child: TextFormField(
                                       controller: emailController,
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
                                         hintText:"Email",
                                         hintStyle:  GoogleFonts.poppins(color: Pallete.textGreyColor,fontWeight: FontWeight.w400,),
                                       ),
                                     ),
                                   ),
                                   SizedBox(height: 20),
                                   Text("Password",style:  GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,),),
                                   Consumer(
                                       builder: (context,ref,child) {
                                         final passwordVisibility=ref.watch(passwordVisibilityProvider);
                                         return SizedBox(
                                           height: 50,
                                           child: TextFormField(
                                             obscureText: !passwordVisibility,
                                             controller: passwordController,
                                             style: GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,),
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
                                               contentPadding: const EdgeInsetsDirectional.only(top: 8,start: 10),
                                               hintText:"Password",
                                               hintStyle:  GoogleFonts.poppins(color: Pallete.textGreyColor,fontWeight: FontWeight.w400,),
                                               suffixIcon: InkWell(
                                                 hoverColor: Colors.transparent,
                                                 onTap: () {
                                                   ref.read(passwordVisibilityProvider.notifier).update((state) => !state);
                                                 },
                                                 child: Icon(
                                                   passwordVisibility
                                                       ?  Icons.visibility_off_outlined
                                                       : Icons.visibility_outlined,
                                                   color: Colors.black54,
                                                   // size: width*(0.01),
                                                 ),
                                               ),
                                             ),
                                           ),
                                         );
                                       }
                                   ),
                                   SizedBox(height: height*(0.025),),
                                   Consumer(
                                     builder: (context,ref,child) {
                                       return ElevatedButton(
                                         onPressed: () {
                                           signInAdmin(ref: ref, context: context);
                                         },
                                         style: ElevatedButton.styleFrom(
                                             fixedSize: Size(  600,45,),
                                             backgroundColor: Pallete.loginButtonColor,
                                             shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero)
                                         ),
                                         child: Text("Login",style: GoogleFonts.poppins(color: Pallete.whiteColor,fontWeight: FontWeight.w700,),),
                                       );
                                     },
                                   ),
                                   SizedBox(height:20),
                                   InkWell(
                                     child: Row(
                                       children: [
                                         Spacer(),
                                         Icon(Icons.lock_outline,color: Pallete.textBlueColor,),
                                         SizedBox(width: 5),
                                         Text("Forgot password?",style:GoogleFonts.poppins(color: Pallete.textBlueColor,
                                           fontWeight: FontWeight.w400,),)
                                       ],
                                     ),
                                   ),
                                 ],
                               ) ,
                             ),
                             SizedBox(height: 70),
                             Text("Copyright @ 2024 by LM Tech",style: GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,),)
                           ],
                         ),
                       ),
                     ),
                   ),
                   SizedBox(width: 20,)
                 ],
               )
           )
       );
     },
    );
  }
}
