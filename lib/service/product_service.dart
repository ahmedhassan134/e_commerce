import 'dart:convert';

import '../models/product_model.dart';

import 'package:http/http.dart'as http;

class AllProductsService{

  Future<List<ProductModel>> getAllProducts() async {
    http.Response request = await http.get(
        Uri.parse('https://fakestoreapi.com/products'));
    if (request.statusCode == 200) {
      var result = request.body;
      var data = jsonDecode(result);

      List <ProductModel>producList = [];
      for (var item in data) {
        producList.add(ProductModel.fromJson(item));
      }
      print(producList.length);
      return producList;

    }
    else{

      return  [];

    }

  }}





















