import 'package:flutter/cupertino.dart';
import 'package:getapi_app/model/cart.dart';
import 'package:getapi_app/model/product.dart';
import 'package:getapi_app/services/ItemServices.dart';

class CartVM with ChangeNotifier{
  ItemServices itemServices = ItemServices();
  List<Cart> itemList = [];
  int counter = 0;

  get getCounter => counter;
  void funCounter() {
    counter++;
    print("-----------$counter");
    notifyListeners();
  }

  getCardList()async{
    itemList = [];
    try {
      await itemServices.openDB();
      List list = await itemServices.getCartList();
      itemList.clear();
      list.forEach((element){
        itemList.add(Cart.getMap(element));
        print("-------------selected items from cart list--------------");
      });
    }catch (e){
      print(e);
    }
  }
  addToCart(Product item)async{
    try{
      await itemServices.openDB();
      var result = await itemServices.addToCart(item);
      print("add new item $result to cart");
      return result;
    }catch (e){
      print(e);
    }
  }
  removeFromCart(int index)async{
    try{
      await itemServices.openDB();
      itemServices.removeFromCart(index);
      int result = itemList.indexWhere((element) => element.cart_id == index);
      itemList.removeAt(result);
      print("removed index $result from cart");
      notifyListeners();
     }catch (e){
       print(e);
     }
  }

}