

import 'package:ecommerce/models/product_model.dart';
import 'package:flutter/cupertino.dart';

class CartProvider extends ChangeNotifier {
  var productMaps = {};

  void addToProductCart(ProductModel productModel) {
    if (productMaps.containsKey(productModel)) {
      productMaps[productModel] += 1;
      // print(productMaps.values);
      // print(productMaps.entries
      //     .map((e) => e.key.price * e.value)
      //     .toList()
      //     .reduce((value, element) => value + element)
      //     .toStringAsFixed(2));
      // print('pro one');
    } else {
      productMaps[productModel] = 1;
      // print(productMaps.values);
      // print(productMaps.entries
      //     .map((e) => e.key.price * e.value)
      //     .toList()
      //     .reduce((value, element) => value + element)
      //     .toStringAsFixed(2));
      // print('pro two');
    }
    notifyListeners();
  }

  void removeFromCart(ProductModel productModel) {
    if (productMaps.containsKey(productModel) &&
        productMaps[productModel] == 1) {
      productMaps.removeWhere((key, value) => key == productModel);
    }
    else {
      productMaps[productModel] -= 1;
    }
    notifyListeners();
  }

  void removeOneItem(ProductModel productModel) {
    productMaps.removeWhere((key, value) => key == productModel);
    notifyListeners();
  }

  void clearProduct() {
    productMaps.clear();
    notifyListeners();
  }

  get subTotal =>
      productMaps.entries.map((e) => e.key.price * e.value).toList();

  get total => productMaps.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);
  // Map<dynamic, dynamic> mapList = {
  //   'a': [
  //     ProductModel(
  //       id: 1,
  //       title: "title",
  //       price: 20,
  //       description: "description",
  //       category: categoryValues.map![jsonDecode("source")["category"]],
  //       image: "image",
  //       rating:Rating.fromJson(jsonDecode("source")["category"]),
  //     ),
  //     ProductModel(
  //       id: 1,
  //       title: "title",
  //       price: 20,
  //       description: "description",
  //       category: categoryValues.map![jsonDecode("source")["category"]],
  //       image: "image",
  //       rating:Rating.fromJson(jsonDecode("source")["category"]),
  //     ),
  //   ],
  //   'b':[
  //     ProductModel(
  //       id: 1,
  //       title: "title",
  //       price: 20,
  //       description: "description",
  //       category: categoryValues.map![jsonDecode("source")["category"]],
  //       image: "image",
  //       rating:Rating.fromJson(jsonDecode("source")["category"]),
  //     ),
  //
  //   ]
  // };
}
