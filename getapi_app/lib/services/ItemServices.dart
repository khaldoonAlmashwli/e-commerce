import 'package:flutter/cupertino.dart';
import 'package:getapi_app/model/product.dart';
import 'package:getapi_app/services/sqlservice.dart';
class ItemServices {
  SqlService sqlService = SqlService();

  Future openDB() async {
    return await sqlService.openDB();
  }
  Future addToCart(Product data) async {
    return await sqlService.addToCart(data);
  }
  Future getCartList() async {
    return await sqlService.selectCartList();
  }
  Future removeFromCart(int index) async {
    return await sqlService.removeFromCart(index);
  }

}