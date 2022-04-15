import 'dart:convert';

import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/utils/reg_constant.dart';
import 'package:http/http.dart' as http;
class ProductService{

  static Future<ProductModel> getAllProducts() async{
    var response= await http.get(Uri.parse('$baseUrl/products'));
    if(response.statusCode==200){
   var data=jsonDecode(response.body);
   List<ProductModel> productList = [];
   data.forEach((e){
     productList.add(ProductModel.fromJson(e));
   });
   return productList;

    }
    else{
      throw Exception('failed to load data');

    }
  }
}