import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:managment_system/feature/product_settings/screen/product_list/desktop_view/deskTop_product_details.dart';
import '../../../../../core/global_variables/global_variables.dart';
import '../../../../../core/theme/pallete.dart';
import '../product_details.dart';

class DeskTopProductList extends StatefulWidget {
  const DeskTopProductList({super.key,});
  

  @override
  State<DeskTopProductList> createState() => _DeskTopProductListState();
}

class _DeskTopProductListState extends State<DeskTopProductList> {
  TextEditingController searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    TextStyle headingRowStyle=GoogleFonts.poppins(color: Pallete.blackColor,fontWeight: FontWeight.w400,fontSize:width*(0.01));
    return Container(
      width: width,
      child:  Theme(
        data: Theme.of(context).copyWith(
          cardTheme: CardTheme(
            color: Colors.white,
            elevation: 0,
            margin: EdgeInsets.zero,
          ),
      ),
        child: PaginatedDataTable(
          rowsPerPage: 8,
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
                label: Container(
                  width: width*(0.035),
                  child: Text(
                    "Action",
                    style:headingRowStyle,
                  ),
                )),
          ],
          source: DeskTopProductListRow(context: context),
        ),
      ),
    );
  }
}
/// product List Data Row
class DeskTopProductListRow extends DataTableSource {
  final BuildContext context;

  DeskTopProductListRow({required this.context,});

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
                width: width*(0.02),height: height*(0.025),fit: BoxFit.fill,),
              ),
              Container(
                width: width*(0.12),
                child: Text(
                  'Apple Macbook 2024',
                  style:rowTextStyle,
                ),
              ),
                          ],
                        )),
          DataCell(Container(
            width: width*(0.06),
            child: Text(
              "02145YK796",
              style: rowTextStyle
            ),
          )),
          DataCell(
            Container(
              width: width*(0.06),
              child: Text(
                "Laptops",
                style:rowTextStyle,
              ),
            ),
          ),
          DataCell(
            Container(
              width: width*(0.06),
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
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {

                      },
                        child: Icon(Icons.edit,color: Pallete.blackColor,size: width*(0.012),)),
                    InkWell(
                      onTap: () {

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