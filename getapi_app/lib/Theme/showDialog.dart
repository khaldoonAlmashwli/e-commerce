import 'package:flutter/material.dart';

import 'colors.dart';

Future<bool> myConfirmDialog(BuildContext context, String question)async{
 return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                right: -40.0,
                top: -40.0,
                child: InkResponse(
                  onTap: () {
                    Navigator.of(context).pop(false);
                    },
                  child: CircleAvatar(
                    child: Icon(
                        Icons.close,
                        color: Colors.white),
                    backgroundColor: Colors.deepOrange,
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding:
                      EdgeInsets.all(0.0),
                      child: Text(question),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding:
              EdgeInsets.all(0.0),
              child: ElevatedButton(
                //color: Colors.deepOrange,
                child: Text("نعم"),
                onPressed: () {
                  Navigator.of(context).pop(true);
                  // if(_formKey.currentState.validate()){
                  //   _formKey.currentState.save();
                  //},
                },
              ),
            ),
            Padding(
              padding:
              EdgeInsets.all(0.0),
              child: ElevatedButton(
                //color: Colors.deepOrange,
                child: Text("لا"),
                onPressed: () {
                  Navigator.of(context).pop(false);
                  // if(_formKey.currentState.validate()){
                  //   _formKey.currentState.save();
                  //},
                },
              ),
            )
          ],
        );
      });
}
myShowDialog(BuildContext context, String msg, Widget wgt){
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                right: -40.0,
                top: -40.0,
                child: InkResponse(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: CircleAvatar(
                    child: Icon(
                      Icons.close,
                      color: Colors.white,),
                    backgroundColor: Colors.deepOrange,
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding:
                      EdgeInsets.all(0.0),
                      child: Center(child: wgt),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding:
                      EdgeInsets.all(0.0),
                      child: Center(child: Text(msg,style: TextStyle(color: Colors.deepOrange),)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding:
                      EdgeInsets.all(0.0),
                      child: ElevatedButton(
                        //color: Colors.deepOrange,
                        child: Text("رجوع"),
                        onPressed: () {
                          Navigator.of(context).pop();
                          // if(_formKey.currentState.validate()){
                          //   _formKey.currentState.save();
                          //},
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      });
  //setState(() {});
}