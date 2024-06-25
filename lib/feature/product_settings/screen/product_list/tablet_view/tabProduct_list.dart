import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:managment_system/feature/product_settings/screen/product_list/tablet_view/tabView_product_details.dart';
import '../../../../../core/global_variables/global_variables.dart';
import '../../../../../core/theme/pallete.dart';
import '../product_details.dart';

class TabViewProductList extends StatefulWidget {
  const TabViewProductList({super.key,});


  @override
  State<TabViewProductList> createState() => _TabViewProductListState();
}

class _TabViewProductListState extends State<TabViewProductList> {
  @override
  Widget build(BuildContext context) {
    TextStyle headingRowStyle=GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,fontSize:width*(0.012));
    return SizedBox(
      width: width,
      height: 750,
      child:  Theme(
        data: Theme.of(context).copyWith(
          cardTheme: CardTheme(
            color: Colors.white,
            elevation: 0,
            margin: EdgeInsets.zero,
          ),
        ),
        child: PaginatedDataTable(
          rowsPerPage: 10,
          headingRowColor: MaterialStateProperty.all(Pallete.homeBackgroundColor),
          arrowHeadColor: Pallete.blackColor,
          dataRowHeight:height*(0.08),
          horizontalMargin: 5,
          columns:  [
            DataColumn(
                label: Container(
                  width: width*(0.15),
                  child: Text(
                    'Product Details',
                    style:headingRowStyle,
                  ),
                )),
            DataColumn(
                label: Container(
                  width: width*(0.07),
                  child: Text(
                    'Category',
                    style: headingRowStyle,
                  ),
                )),
            DataColumn(
                label: Container(
                  width: width*(0.07),
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
                  width: width*(0.06),
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
                label: Container(
                  width: width*(0.042),
                  child: Text(
                    "Action",
                    style:headingRowStyle,
                  ),
                )),
          ],
          source: TabViewProductListRow(context: context),
        ),
      ),
    );
  }
}
/// product List Data Row
class TabViewProductListRow extends DataTableSource {
  final BuildContext context;

  TabViewProductListRow({required this.context,});

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
    TextStyle rowTextStyle=GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,fontSize:width*(0.01));
    return DataRow(
        onSelectChanged: (value) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails(),));
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
                    child: Image.asset("assets/logo/image 1.png",
                      width: width*(0.02),height: height*(0.03),fit: BoxFit.fill,),
                  ),
                  Container(
                    width: width*(0.15),
                    child: Text(
                      'Apple Macbook 2024',
                      style:rowTextStyle,
                    ),
                  ),
                ],
              )),
          DataCell(
            Container(
              width: width*(0.07),
              child: Text(
                "Laptops",
                style:rowTextStyle,
              ),
            ),
          ),
          DataCell(
            Container(
              width: width*(0.07),
              child: Text(
                "AED 5,600.00",
                style: rowTextStyle,
              ),
            ),
          ),
          DataCell(
              Container(

                  width: width*(0.03),
                  child: Text("13",
                    style: rowTextStyle,))
          ),
          DataCell(
              Container(
                color: Pallete.soldOutButtonColor,
                height: height*(0.04),
                width: width*(0.06),
                child: Center(child: Text("Sold Out",style: rowTextStyle,)),
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
                width: width*(0.04),
                child: Row(
                  children: [
                    InkWell(
                        onTap: () {

                        },
                        child: Icon(Icons.edit,color: Pallete.blackColor,size: width*(0.015),)),
                    InkWell(
                        onTap: () {

                        },
                        child: Icon(Icons.delete_outline,color: Pallete.blackColor,size: width*(0.015),)),

                  ],
                ),
              )
          ),
        ]
    );
  }
}