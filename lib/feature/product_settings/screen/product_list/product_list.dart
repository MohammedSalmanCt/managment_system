import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:managment_system/feature/product_settings/screen/product_list/desktop_view/desktopProductList.dart';
import '../../../../../core/theme/pallete.dart';
import '../../../../core/global_variables/global_variables.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key,required this.tabController,required this.device});
  final TabController tabController;
  final bool device;

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  TextEditingController searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Consumer(
                builder:(context, ref, child) {
                  return SizedBox(
                    width:200,
                    height: 30,
                    child: TextFormField(
                      controller: searchController,
                      style:  GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        fillColor: Pallete.whiteColor,
                        labelText: "Search...",
                        labelStyle:GoogleFonts.poppins(color: Pallete.textGreyColor,fontWeight: FontWeight.w400,fontSize:10),
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
                      ),
                    ),
                  );
                }, ),
              Consumer(
                builder: (context,ref,child) {
                  return InkWell(
                    onTap: () {
                      widget.tabController.animateTo(5);
                      ref.read(selectedSideMenuIndexProvider.notifier).update((state) => 5);
                      ref.read(selectedSideMenuSubIndexProvider.notifier).update((state) => 1);
                      ref.read(headingProvider.notifier).update((state) => "Add Product");
                    },
                    child: Container(
                      color: Pallete.loginButtonColor,
                      width:120,
                      height: 30,
                      child: Center(child: Text("+ Add Product",style:GoogleFonts.poppins(color: Pallete.whiteColor,fontWeight: FontWeight.w400,),)),
                    ),
                  );
                }
              )
            ],
          ),
          SizedBox(height: 5,),
         DeskTopProductList(device: widget.device,)
        ],
      ),
    );
  }
}
