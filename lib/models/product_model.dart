

// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  ProductModel({
   required  this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  int id;
  String title;
  double price;
  String description;
  Category ?category;
  String image;
  Rating rating;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    title: json["title"],
    price: json["price"].toDouble(),
    description: json["description"],
    category: categoryValues.map![json["category"]],
    image: json["image"],
    rating: Rating.fromJson(json["rating"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "category": categoryValues.reverse![category],
    "image": image,
    "rating": rating.toJson(),
  };
}

enum Category { MEN_S_CLOTHING, JEWELERY, ELECTRONICS, WOMEN_S_CLOTHING }

final categoryValues = EnumValues({
  "electronics": Category.ELECTRONICS,
  "jewelery": Category.JEWELERY,
  "men's clothing": Category.MEN_S_CLOTHING,
  "women's clothing": Category.WOMEN_S_CLOTHING
});

class Rating {
  Rating({
    required this.rate,
    required this.count,
  });

  double rate;
  int count;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    rate: json["rate"].toDouble(),
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "rate": rate,
    "count": count,
  };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String> ?reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map?.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}




















// class ProductModel {
//   final dynamic id;
//   final String title;
//   final double price;
//   final String description;
//   final String category;
//   final String image;
//   final RatingModel rate;
//
//   ProductModel(
//       {required this.id,
//         required this.title,
//         required this.price,
//         required this.description,
//         required this.category,
//         required this.image,
//         required this.rate});
//
//   factory ProductModel.fromjson(dynamic json) {
//     return ProductModel(
//         id: json['id'],
//         title: json['title'],
//         price: json['price'],
//         description: json['description'],
//         category: json['category'],
//         image: json['image'],
//         rate: RatingModel.fromjson(json['rating']));
//   }
//
//
// }
//
// class RatingModel {
//   final double rate;
//   final int count;
//
//   RatingModel({required this.rate, required this.count});
//
//   factory RatingModel.fromjson(json) {
//     return RatingModel(rate: json['rate'], count: json['count']);
//   }
// }