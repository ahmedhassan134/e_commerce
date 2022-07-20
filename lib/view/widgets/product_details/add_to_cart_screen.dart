import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/cart_provider.dart';
class AddToCartScreen extends StatelessWidget {
  const AddToCartScreen ({Key? key,required this.price,required this.productModel}) : super(key: key);
final double price;
final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Container
          (


          padding: const EdgeInsets.all(12),
          child: Row(
            children: [

              Column(
                children: [
                  const Text('price',style: TextStyle(fontSize: 30,color: Colors.white),),
                  const SizedBox(height: 7,),
                  Text( '\$$price',style: const TextStyle(fontSize: 20),)

                ],

              ),
              const SizedBox(width: 20,),
              Expanded(
                  child: ElevatedButton(
                onPressed: (){
                  Provider.of<CartProvider>(context,listen: false).addToProductCart(productModel);
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),


                    ),
                    minimumSize: const Size(100,50),
                    primary: mainColor


                ),
                child: Container(
                  padding: const EdgeInsets.only(left: 60),
                  child: Row(

                    children: const [
                      Text('Add To Cart'),
                      SizedBox(width: 10,),
                      Icon(Icons.shopping_cart)
                    ],
                  ),
                ),
              ))

            ],
          ),
        ),

      ],
    );
  }
}
