import 'package:ecommerce/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/cart_provider.dart';
class CartTotal extends StatelessWidget {
  const CartTotal({Key? key,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(

      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Column(
            children: [
              const Text('Total',style: TextStyle(fontSize: 30,color: Colors.grey),),
              const SizedBox(height: 10,),
              Text( '\$${  Provider.of<CartProvider>(context).total.toString()}',style: const TextStyle(fontSize: 20),)

            ],

          ),
          const SizedBox(width: 20,),
          Expanded(child: ElevatedButton(
            onPressed: (){},
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),


              ),
              minimumSize: Size(100,50),
              primary: mainColor


            ),
            child: Row(
              children: [
                Text('check out'),
                Icon(Icons.shopping_cart)
              ],
            ),
          ))

        ],
      ),
    );
  }
}
