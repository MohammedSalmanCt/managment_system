import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Tab_home_screen.dart';
import 'desktop_home-Screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  TabController? tabController;
  @override
  void initState() {
     tabController=TabController(length:14 , vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  LayoutBuilder(builder: (context, constraints) {
       if( constraints.maxWidth >1024){
         return DeskTopHomeScreen(tabController: tabController!);
       }
       else{
         return TabHomeScreen(tabController: tabController!,);
       }
      },);
  }
}
