
import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/service/product_service.dart';
import 'package:flutter/cupertino.dart';

class productProvider with ChangeNotifier{
  List<ProductModel> productList=[];
  bool isLoading=true;


  void getProducts()async {
    var products=await ProductService.getAllProducts();
try{
  isLoading=true;
  // for(int i=0;i<productList.length;i++){
  //   productList.add(products);
  // }
  if(productList.isNotEmpty){
    productList.add(products);
  }

}
finally{
  isLoading=false;
  notifyListeners();

}





  }

}