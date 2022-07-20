
import 'package:ecommerce/providers/cart_provider.dart';
import 'package:ecommerce/providers/product_provider.dart';
import 'package:ecommerce/view/screens/product_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart ';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../models/product_model.dart';

import '../../service/product_service.dart';
import '../../service/responsive.dart';
class CartItem extends StatelessWidget {
  const CartItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
          padding: const EdgeInsets.only(left: 10,right: 10,top: 50),
          child: FutureBuilder<List<ProductModel>>(
            future:AllProductsService().getAllProducts() ,

            builder: (context ,  snapshot){
              if(snapshot.hasData){
                List<ProductModel>  products=snapshot.data!;

                return  GridView.builder(
                  itemCount:products.length,
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: .8,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 8,
                  maxCrossAxisExtent: 200,


                ), itemBuilder: (context,index){
                  return Padding(padding: const EdgeInsets.all(5),
                    child:  InkWell(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                              return ProductDetails(productModel: products[index]);
                            }));
                      // ;
                      },
                      child: Container(
                      padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey,
                  boxShadow: [
                  BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 4,
                  offset: const Offset(4, 8),
                  )
                  ]),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: (){
                                    // Provider.of<ProductProvider>(context,listen: false).managmentFavourite(
                                    //  products[index].id
                                    // );
                                  },
                                  icon:  Provider.of<ProductProvider>(context).isFavourite(
                                      products[index].id
                                  )? Icon(Icons.favorite_outline):Icon(Icons.favorite)
                                ),

                            IconButton(onPressed: (){
                              Provider.of<CartProvider>(context,listen: false).addToProductCart( products[index]);
                            }, icon: Icon(Icons.shopping_cart))
                              ],
                            ),
                            Container(
                              margin:const EdgeInsets.all(.2),
                              width: double.infinity,
                              height: SizeConfig.defaultSize! * 12,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16)),
                              child: Image.network(
                                products[index].image,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(top: 7,start: 4,bottom: 2),
                              child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(child: Text( products[index].title,overflow: TextOverflow.ellipsis,),),
                                  Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(horizontal: 8),
                                    width: SizeConfig.defaultSize! * 4,
                                    height: SizeConfig.defaultSize! * 2,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white),
                                    child:Text(products[index].rating.rate.toString(),style: const TextStyle(color: Colors.red),)
                                  )
                                ],
                              ),
                            )
                          ],
                        ),


                  ),
                    )














                  );




















                });
              }
              else{
                print('error');
                return const Center(child: CircularProgressIndicator(),);
              }

            },

          )
      )
    );
  }
}
