import 'package:ecommerce/providers/cart_provider.dart';
import 'package:ecommerce/service/responsive.dart';

import 'package:ecommerce/view/widgets/cart_screen/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../widgets/cart_screen/cart_product.dart';
import '../widgets/cart_screen/cart_total.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  static String id = 'cartscreen';
  late int  val;



  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('cart screen'),
          actions: [IconButton(onPressed: () {
            Provider.of<CartProvider>(context,listen: false).clearProduct();
          }, icon: const Icon(Icons.backspace))],
        ),
        body: Provider.of<CartProvider>(context).productMaps.isEmpty?
            const EmptyCart():Column(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [

                  SizedBox(
                    height: SizeConfig.defaultSize! * 62,
                    width: double.infinity,
                    child: ListView.separated(
                      itemBuilder: (context,index){
                        return CartProduct(
                          quantity:Provider.of<CartProvider>(context).productMaps.values.toList()[index],
                          index: index,
                          productModel: Provider.of<CartProvider>(context).productMaps.keys.toList()[index],
                        );

                      },
                      separatorBuilder: (context,index){
                        return SizedBox(height:SizeConfig.defaultSize! * 3 ,);
                      },
                      itemCount: Provider.of<CartProvider>(context).productMaps.length,
                    ),
                  ),
                ],
              ),
            ),



            const Padding(padding: EdgeInsets.only(bottom: 30),

              child: CartTotal(),
            )
          ],
        )
    );
  }
}
