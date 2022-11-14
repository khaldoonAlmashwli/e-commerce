import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:getapi_app/model/product.dart';

class ProductsVM extends ChangeNotifier{
  List<Product> productsList=[];
//List<Map<String, >> productsList=[];
  String apiUrl="http://fakestoreapi.com/products";


  Future getProducts() async{
    productsList = [];
    var response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200 ){
      List <dynamic> result = jsonDecode(response.body);
      if( result.length > 0 ) {
        result.forEach((element) {
          productsList.add(Product.getMap(element));
        });
        print(productsList);
      }
    }
  }
  void search(String str){
    notifyListeners();
  }
}