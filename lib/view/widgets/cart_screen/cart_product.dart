import 'package:ecommerce/providers/cart_provider.dart';
import 'package:ecommerce/service/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/product_model.dart';

class CartProduct extends StatelessWidget {
   CartProduct({Key? key,required this.productModel,required this.index,required this.quantity}) : super(key: key);
 final ProductModel productModel;
 final int index;
 final int quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: SizeConfig.defaultSize! * 2,
        right: SizeConfig.defaultSize! * 1,
        left: SizeConfig.defaultSize! * 1,
      ),
      padding: EdgeInsets.only(
        top:SizeConfig.defaultSize! * 1,
        bottom: SizeConfig.defaultSize! * 2,
        right: SizeConfig.defaultSize! * 1,
        left: SizeConfig.defaultSize! * 1,
      ),
      width: double.infinity,
      height: SizeConfig.defaultSize! * 18,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Colors.grey),
      child: Row(
        children: [
          Container(
            width: SizeConfig.defaultSize! * 12,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                  image: NetworkImage(
             productModel.image        ),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModel.title,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '\$${  Provider.of<CartProvider>(context).subTotal[index]}',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(onPressed: (){
                    Provider.of<CartProvider>(context,listen: false).removeFromCart(productModel);
                  }, icon: Icon(Icons.remove_circle)),
                   Text(
                    quantity.toString(),
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  IconButton(onPressed: (){
                    Provider.of<CartProvider>(context,listen: false).addToProductCart(productModel);
                  }
                  , icon: const Icon(Icons.add_circle)),
                ],
              ),
              IconButton(onPressed: (){
                Provider.of<CartProvider>(context,listen: false).removeOneItem(productModel);
              }, icon: const Icon(Icons.delete,color: Colors.red,)),
            ],
          )
        ],
      ),
    );
  }
}
