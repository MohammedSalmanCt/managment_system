import 'package:flutter/material.dart';
import 'package:managment_system/core/theme/pallete.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: const CircularProgressIndicator(
        color: Pallete.blackColor,
      ),
    );
  }
}

