import 'package:flutter/material.dart';
import 'package:getapi_app/modelviwe/addproductVM.dart';
import 'package:getapi_app/modelviwe/cartVM.dart';
import 'package:getapi_app/modelviwe/productdetailsVM.dart';
import 'package:getapi_app/modelviwe/productsVM.dart';
import 'package:getapi_app/ui/splashscreen.dart';
import 'package:getapi_app/utility/utility.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductsVM>(create: (_)=>ProductsVM()),
        ChangeNotifierProvider<ProductDetailsVM>(create: (_)=>ProductDetailsVM()),
        ChangeNotifierProvider<AddProductVM>(create: (_)=>AddProductVM()),
        ChangeNotifierProvider<CartVM>(create: (_)=>CartVM()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Leader 01',
        theme: ThemeData(

          primarySwatch: Colors.deepOrange,
        ),
        home: const SplashScreen(), //MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

