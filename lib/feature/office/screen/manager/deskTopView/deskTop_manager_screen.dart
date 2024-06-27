import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:managment_system/core/global_variables/global_variables.dart';
import 'package:managment_system/feature/office/screen/manager/widgets/manager_name_textField.dart';

class DeskTopManagerScreen extends StatefulWidget {
  const DeskTopManagerScreen({super.key});
  @override
  State<DeskTopManagerScreen> createState() => _DeskTopManagerScreenState();
}

class _DeskTopManagerScreenState extends State<DeskTopManagerScreen> {
  /// manager userType provider
  final managerUserTypeProvider = StateProvider<String?>((ref) {
  return null;
  });
  /// manager controller
  TextEditingController managerNameController=TextEditingController();
  TextEditingController managerEmailController=TextEditingController();
  TextEditingController managerIdController=TextEditingController();
  TextEditingController managerEmiratesIdController=TextEditingController();
  TextEditingController managerPhoneController=TextEditingController();
  TextEditingController managerDesignationController=TextEditingController();
  TextEditingController managerAddressController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 20,),
        Row(
          children: [
            ManagerNameField(device: true, textFontSize: width*(0.01), controller: managerNameController, heading: "Name"),
            Spacer(),
            ManagerNameField(device: true, textFontSize: width*(0.01), controller: managerIdController, heading: "Name"),
          ],
        )
      ],
    );
  }
}
