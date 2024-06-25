import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:managment_system/core/theme/pallete.dart';
import 'core/global_variables/global_variables.dart';
import 'feature/authentication/screen/login_screen.dart';
import 'feature/authentication/screen/spash_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    return MaterialApp(
      title: 'Proposal Managment Admin',
      home:  SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
