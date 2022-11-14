import 'dart:async';

import 'package:flutter/material.dart';
import 'package:getapi_app/Theme/colors.dart';
import 'package:getapi_app/Theme/mySizes.dart';
import 'package:getapi_app/ui/productsscreen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    _loading();
  }

  var _duration=Duration(seconds: 2);

  _loading() async{
    Timer(_duration,(){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProductsScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    MySizes sz= MySizes.getSizes(MediaQuery.of(context));
    return Scaffold(
      body: Container(
        height: sz.getHeight(100)+sz.appBarHeight,
        width: sz.getWidth(100),
        color: Colors.deepOrange,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height:sz.getHeight(30) ,
              ),
              // ignore: prefer_const_constructors
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.deepOrange,
                // child: CircleAvatar(
                //   //backgroundImage: AssetImage("assets/logo.png"),
                //   radius: 45,
                // ),
              ),
              SizedBox(
                height: sz.getHeight(5),
              ),
              Center(
                child: Text(
                  "Welcome to otekit",
                  style: TextStyle(color: bgColor, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
