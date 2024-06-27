import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:managment_system/core/commons/error.dart';
import 'package:managment_system/core/commons/loader.dart';
import 'package:managment_system/core/constants/asset_constants.dart';
import 'package:managment_system/feature/authentication/controller/auth_controller.dart';
import 'package:managment_system/feature/product_settings/controller/product_controller.dart';
import 'package:managment_system/feature/product_settings/screen/product_list/desktop_view/desktopProductList.dart';
import 'package:managment_system/feature/product_settings/screen/product_list/tablet_view/tabProduct_list.dart';
import '../../../../../core/theme/pallete.dart';

class DeletedProductList extends StatefulWidget {
  const DeletedProductList({super.key,required this.tabController,required this.device});
  final TabController tabController;
  final bool device;

  @override
  State<DeletedProductList> createState() => _DeletedProductListState();
}

class _DeletedProductListState extends State<DeletedProductList> {
  ///  deleted product search controller
  TextEditingController deletedSearchController=TextEditingController();
  final deletedProductSearchProvider = StateProvider<String>((ref) {
    return "";
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Consumer(
                builder:(context, ref, child) {
                  return SizedBox(
                    width:350,
                    height: 30,
                    child: TextFormField(
                      controller: deletedSearchController,
                      style:  GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        suffixIcon: InkWell(
                            onTap: () {
                              deletedSearchController.clear();
                              ref.read(deletedProductSearchProvider.notifier).update((state) => "");
                            },
                            child: Icon(Icons.clear,color: Pallete.textFieldBorderColor,)),
                        fillColor: Pallete.whiteColor,
                        labelText: "Search...",
                        labelStyle:GoogleFonts.poppins(color: Pallete.textGreyColor,fontWeight: FontWeight.w400,fontSize:15),
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
                      onChanged: (value) {
                        ref.read(deletedProductSearchProvider.notifier).update((state) => value);
                      },
                    ),
                  );
                }, ),
            ],
          ),
          SizedBox(height: 5,),
          Consumer(builder: (context, ref, child) {
            final admin= ref.watch(adminProvider);
            Map map={
              "adminId":admin?.id,
              "search":ref.watch(deletedProductSearchProvider),
              "delete":true
            };
            return ref.watch(getProductsProvider(jsonEncode(map))).when(data: (products) {
              if(products.isNotEmpty){
                return widget.device? DeskTopProductList(products: products,delete: true,tabController: widget.tabController,)
                    :TabViewProductList(products: products, delete: true,tabController: widget.tabController,);
              }
              else{
                return  Center(
                  child: Lottie.asset(AssetConstants.noData),
                );
              }
            }, error: (error, stackTrace) {
              print(error);
              return ErrorText(error: error.toString());
            },
              loading: () => Loader(),);
          },)
        ],
      ),
    );
  }
}
