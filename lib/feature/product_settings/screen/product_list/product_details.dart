import 'package:flutter/cupertino.dart';
import 'package:managment_system/feature/product_settings/screen/product_list/desktop_view/deskTop_product_details.dart';
import 'package:managment_system/feature/product_settings/screen/product_list/tablet_view/tabView_product_details.dart';
import 'package:managment_system/model/product_model.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key,required this.productModel});
  final ProductModel productModel;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if( constraints.maxWidth >1024){
        return DeskTopProductDetails(productModel: widget.productModel,);
      }
      else{
        return TabViewProductDetails(productModel: widget.productModel,);
      }
    },
    );
  }
}
