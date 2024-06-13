import 'package:flutter/material.dart';
import '../../../core/theme/pallete.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return  Container(
        height: 600,
        decoration: BoxDecoration(
          color: Pallete.whiteColor,
            boxShadow:  [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 10,
                blurRadius: 20,
                offset: Offset(0, 10),
              )
            ]
        ),
      );
  }
}
