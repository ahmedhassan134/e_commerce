import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/view/widgets/cart_screen/cart_total.dart';
import 'package:ecommerce/view/widgets/product_details/add_to_cart_screen.dart';
import 'package:ecommerce/view/widgets/product_details/rating_star.dart';
import 'package:ecommerce/view/widgets/product_details/read_more.dart';
import 'package:ecommerce/view/widgets/product_details/sized_list.dart';
import 'package:flutter/material.dart';

import '../widgets/product_details/product_details_widget.dart';

class ProductDetails extends StatefulWidget {
  ProductDetails({Key? key, required this.productModel}) : super(key: key);

  static String id = 'productDetails';
  final ProductModel productModel;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductDetailsWidget(img: widget.productModel.image),
              RatingStar(
                title: widget.productModel.title,
                rate: widget.productModel.rating.rate,
              ),
               ReadMore(
                desc: widget.productModel.description,
              ),
              SizedList(),
             // Spacer( flex: 1),
       SizedBox(height: 90,),
             AddToCartScreen(price: widget.productModel.price,
             productModel:widget.productModel ,)
            ],
          ),
        ),
      ),
    );
  }
}
