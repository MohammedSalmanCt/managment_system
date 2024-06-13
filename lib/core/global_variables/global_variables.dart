import 'package:flutter_riverpod/flutter_riverpod.dart';

double height = 0.0;
double width = 0.0;
/// side menu index
final selectedSideMenuIndexProvider = StateProvider<int>((ref) {
  return 1;
});
/// heading
final headingProvider = StateProvider<String>((ref) {
  return "DashBoard";
});



