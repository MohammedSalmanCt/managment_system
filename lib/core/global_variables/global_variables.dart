import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

double height = 0.0;
double width = 0.0;
/// side menu index
final selectedSideMenuIndexProvider = StateProvider<int>((ref) {
  return 1;
});
/// side menu sub index
final selectedSideMenuSubIndexProvider = StateProvider<int>((ref) {
  return 0;
});
/// heading
final headingProvider = StateProvider<String>((ref) {
  return "DashBoard";
});
/// function type
typedef TapCallback = void Function();
/// add product page provider
final addProductPageProvider = StateProvider((ref) {
  return 0;
});
/// image pick provider
final imagePickProvider = StateProvider<List<XFile>>((ref) {
  return [];
});