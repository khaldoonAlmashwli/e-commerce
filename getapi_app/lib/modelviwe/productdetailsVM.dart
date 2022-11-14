import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;
import 'package:getapi_app/model/product.dart';

class ProductDetailsVM extends ChangeNotifier {
  // ignore: prefer_const_constructors
  Product currentProduct = Product(
      id: -1,
      title: "",
      price: "",
      description: "",
      category: "",
      image: "",
      rate: "",
      count: "");
  String apiUrl = "http://fakestoreapi.com/products/";

  void setCurrentProduct(Map<String, dynamic> map) {
    currentProduct = Product.getMap(map);
    notifyListeners();
  }

  Future getProductById(int id) async {
    var response = await http.get(
        Uri.parse(apiUrl + id.toString()));
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      print(result);
    }
  }

}