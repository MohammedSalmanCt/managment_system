import 'package:flutter/cupertino.dart';
import '../../../../../core/global_variables/global_variables.dart';
import '../../../../../core/theme/pallete.dart';

class ManagerScreen extends StatefulWidget {
  const ManagerScreen({super.key,required this.device});
  final bool  device;

  @override
  State<ManagerScreen> createState() => _ManagerScreenState();
}

class _ManagerScreenState extends State<ManagerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        color: Pallete.whiteColor,
        width: width,
        // child:wid
    );
  }
}
