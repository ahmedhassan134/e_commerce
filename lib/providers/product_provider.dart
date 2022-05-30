import 'package:flutter/cupertino.dart';

import '../models/product_model.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> productList = <ProductModel>[];
  List<ProductModel> favoriteList = <ProductModel>[];

  // void managmentFavourite(int productId) {
  //   var existingIndex =
  //       favoriteList.indexWhere((element) => element.id == productId);
  //   print(existingIndex);
  //   if (existingIndex >= 0) {
  //     favoriteList.removeAt(existingIndex);
  //   } else {
  //     favoriteList.where(
  //       (element) {
  //
  //        return favoriteList.add(favoriteList.contains(element)););
  //       },
  //     );
  //     print('added');
  //   }

  //   notifyListeners();
  //   print('success');
  // }

  bool isFavourite(int productId) {
    return favoriteList.any((element) => element.id == productId);
  }
}
