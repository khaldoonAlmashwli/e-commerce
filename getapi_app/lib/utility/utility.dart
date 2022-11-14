import 'dart:async';
import 'dart:io';

Future<bool> isConnected() async{
  try{
    final response= await InternetAddress.lookup("fakestoreapi.com");
    if(response.isNotEmpty){
      print(response);
      return true;
    }
    else{
      return false;
    }
  }
  on SocketException catch(err){
    return false;
  }
}

