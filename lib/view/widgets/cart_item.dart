import 'package:ecommerce/providers/product_provider.dart';
import 'package:ecommerce/service/responsive.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {














    if (Provider.of<productProvider>(context).isLoading) {
      return  Expanded(
        child: GridView.builder(
          itemCount: Provider.of<productProvider>(context).productList.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio: .8,
            crossAxisSpacing: 6,
            mainAxisSpacing: 8,
            maxCrossAxisExtent: 200,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5),
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
                      children: const [
                        Icon(Icons.favorite_outline),
                        Icon(Icons.add)
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      height: SizeConfig.defaultSize! * 15,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16)),
                      child: Image.network(
                        Provider.of<productProvider>(context).productList[index].image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(Provider.of<productProvider>(context).productList[index].title),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            width: SizeConfig.defaultSize! * 12,
                            height: SizeConfig.defaultSize! * 4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [Text('4.7'), Icon(Icons.star)],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },

        ),
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );

    }
  }
}
