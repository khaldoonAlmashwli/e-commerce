import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:getapi_app/utility/utility.dart';
//import 'package:interviwe/utility/utility.dart';

class AddProductVM extends ChangeNotifier{
  Map<String, dynamic> resultData={};
  String apiUrl="http://fakestoreapi.com/products";

  setResultData(Map<String, dynamic> data){
    resultData=data;
    notifyListeners();
  }
  Future<int>addProduct(Map<String, dynamic> resultData) async {
    var con = await isConnected();
    if(con) {
      var response = await http.post(Uri.parse(apiUrl), body: resultData);
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        print(result);

        //setCurrentProduct(result);
        return 1;
      }else{
        return 0;
      }
    }
    else{
      return -1;
    }
  }
}