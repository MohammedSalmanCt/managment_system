import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:managment_system/feature/product_settings/controller/product_controller.dart';
import '../../../../../core/commons/error.dart';
import '../../../../../core/commons/loader.dart';
import '../../../../../core/global_variables/global_variables.dart';
import '../../../../../core/theme/pallete.dart';
import '../../../../../model/category_model.dart';
import '../../../../../model/product_model.dart';
import '../../deleted_product/product_action_alert.dart';
import '../product_details.dart';

class DeskTopProductList extends StatefulWidget {
  const DeskTopProductList({super.key,required this.products,required this.delete,required this.tabController});
  final List<ProductModel> products;
  final bool delete;
  final TabController tabController;
  

  @override
  State<DeskTopProductList> createState() => _DeskTopProductListState();
}

class _DeskTopProductListState extends State<DeskTopProductList> {
  @override
  Widget build(BuildContext context) {
    TextStyle headingRowStyle=GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,fontSize:width*(0.01));
    return Consumer(
      builder: (context,ref,child) {
        return SizedBox(
          width: width,
          child:  Theme(
            data: Theme.of(context).copyWith(
              cardTheme: const CardTheme(
                color: Colors.white,
                elevation: 0,
                margin: EdgeInsets.zero,
              ),
          ),
            child: PaginatedDataTable(
              rowsPerPage: widget.products.length<8?widget.products.length:8,
              headingRowColor: MaterialStateProperty.all(Pallete.homeBackgroundColor),
              arrowHeadColor: Pallete.blackColor,
              dataRowHeight: height*(0.068),
              horizontalMargin: 5,
              columns:  [
                 DataColumn(
                    label: Container(
                      width: width*(0.12),
                      child: Text(
                        'Product Details',
                        style:headingRowStyle,
                      ),
                    )),
                 DataColumn(
                    label: Container(
                      width: width*(0.06),
                      child: Text(
                        ' SKU',
                        style:headingRowStyle,
                      ),
                    )),
                 DataColumn(
                    label: Container(
                      width: width*(0.06),
                      child: Text(
                        'Category',
                        style: headingRowStyle,
                      ),
                    )),
                 DataColumn(
                    label: Container(
                      width: width*(0.06),
                      child: Text(
                        'Price',
                        style:headingRowStyle,
                      ),
                    )),
                DataColumn(
                    label: Container(
                      width: width*(0.03),
                      child: Text(
                        "QTY",
                        style:headingRowStyle,
                      ),
                    )),
                DataColumn(
                    label: Container(
                      width: width*(0.04),
                      child: Text(
                        "Status",
                        style:headingRowStyle,
                      ),
                    )),
                DataColumn(
                    label: Container(
                      width: width*(0.05),
                      child: Text(
                        "Rating",
                        style: headingRowStyle,
                      ),
                    )),
                DataColumn(
                    label:Container(
                      width: width*(0.035),
                      child: Text(
                        "Action",
                        style:headingRowStyle,
                      ),
                    )),
              ],
              source: DeskTopProductListRow(context: context,products:widget.products,
                  delete: widget.delete,ref: ref,tabController: widget.tabController),
            ),
          ),
        );
      }
    );
  }
}
/// product List Data Row
class DeskTopProductListRow extends DataTableSource {
  final BuildContext context;
  final List<ProductModel> products;
  final bool delete;
  final WidgetRef ref;
  final TabController tabController;

  DeskTopProductListRow({required this.context,required this.products,required this.delete,
  required this.ref,required this.tabController});

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount =>3;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    TextStyle rowTextStyle=GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,fontSize:width*(0.008));
    return DataRow(
      onSelectChanged: (value) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails(productModel: products[index],),));
      },
        selected: false,
        color:MaterialStateProperty.all(Pallete.whiteColor),
        cells: [
          DataCell(
              Row(
                children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color:Pallete.textFieldBorderColor)
                ),
                child: Image.network(products[index].images[0],
                width: width*(0.02),height: height*(0.025),fit: BoxFit.fill,),
              ),
              Container(
                width: width*(0.12),
                child: Text(
                  products[index].productTitle,
                  style:rowTextStyle,
                ),
              ),
                          ],
                        )),
          DataCell(Container(
            width: width*(0.06),
            child: Text(
              products[index].sku,
              style: rowTextStyle
            ),
          )),
          DataCell(
            Container(
              width: width*(0.06),
              child: FutureBuilder<CategoryModel>(
                    future: ref
                        .watch(
                        productControllerProvider
                            .notifier)
                        .getCategory(categoryId: products[index].categoryId,
                    adminId: products[index].adminId),
                    builder:
                        (context, snapshot) {
                      if (snapshot
                          .connectionState ==
                          ConnectionState
                              .waiting) {
                        return const Loader();
                      } else if (snapshot
                          .hasError) {
                        return ErrorText(
                          error: snapshot
                              .error
                              .toString(),
                        );
                      } else {
                        return Text(
                          snapshot.data!.categoryName,
                          style:rowTextStyle
                        );
                      }
                    },
                  )
            ),
          ),
          DataCell(
            Container(
              width: width*(0.06),
              child: Text(
                "${products[index].currencyType} ${products[index].sellingPrice}",
                style: rowTextStyle,
              ),
            ),
          ),
          DataCell(
            Container(

                width: width*(0.03),
                child: Text(products[index].stockQuantity.toString(),
                style: rowTextStyle,))
          ),
          DataCell(
             Container(
               color: Pallete.soldOutButtonColor,
               child: Center(child: Text("Sold Out",style: rowTextStyle,)),
               height: height*(0.04),
               width: width*(0.04),
             )
          ),
          DataCell(
             Container(
               width: width*(0.05),
               child: Row(
                 children: [
                   Icon(Icons.star,color: Pallete.starFillColor,size: width*(0.01),),
                   Icon(Icons.star,color: Pallete.starFillColor,size: width*(0.01)),
                   Icon(Icons.star,color: Pallete.starFillColor,size: width*(0.01)),
                   Icon(Icons.star,color: Pallete.starFillColor,size: width*(0.01)),
                   Icon(Icons.star,color: Pallete.starNonFillColor,size: width*(0.01)),
                 ],
               ),
             )
          ),
          DataCell(
             Container(
                width: width*(0.035),
                child: delete? InkWell(
                    onTap: () {
                      actionProductAlert(productModel: products[index],context: context,ref: ref,
                          actionText: "Restore");
                    },
                    child: Icon(Icons.restore_from_trash_outlined,color: Pallete.blackColor,size: width*(0.012),)):Row(
                  children: [
                    InkWell(
                      onTap: () {
                        actionProductAlert(productModel: products[index],context: context,ref: ref,
                            actionText: "Edit",tabController: tabController);
                      },
                        child: Icon(Icons.edit,color: Pallete.blackColor,size: width*(0.012),)),
                    InkWell(
                      onTap: () {
                        actionProductAlert(productModel: products[index],context: context,ref: ref,
                        actionText: "Delete");
                      },
                        child: Icon(Icons.delete_outline,color: Pallete.blackColor,size: width*(0.012),)),

                  ],
                ),
              )
          ),
        ]
    );
  }
}