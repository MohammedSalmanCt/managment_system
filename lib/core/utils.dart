import 'package:flutter/material.dart';
import 'package:managment_system/core/theme/pallete.dart';

void showSnackBar(BuildContext context,String message){
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(
      content: Center(child: Text(message)),
      backgroundColor: Pallete.blackColor,
      behavior: SnackBarBehavior.floating,
      width: 500,
      elevation: 30,
    ),
    );
}


