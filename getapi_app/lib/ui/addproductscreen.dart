import 'package:flutter/material.dart';
import 'package:getapi_app/Theme/colors.dart';
import 'package:getapi_app/Theme/mySizes.dart';
import 'package:getapi_app/model/product.dart';
import 'package:getapi_app/modelviwe/addproductVM.dart';
import 'package:provider/provider.dart';


class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  TextEditingController titleCtr= TextEditingController();
  TextEditingController priceCtr= TextEditingController();
  TextEditingController descriptionCtr= TextEditingController();
  TextEditingController imageCtr= TextEditingController();
  TextEditingController categoryCtr= TextEditingController();
  final _signupFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    MySizes sz = MySizes.getSizes(MediaQuery.of(context));
    return Consumer<AddProductVM>(
        builder: (context, addProductProvider, child) {
          return Container(
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _signupFormKey,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Container(
                    //color: Colors.purple,
                    margin: EdgeInsets.all(sz.currentOrint=="vt"?sz.getHeight(1.5):sz.getHeight(3)),
                    constraints:BoxConstraints(
                      maxWidth: sz.currentOrint=="vt"?sz.getWidth(90):sz.getWidth(100),
                      minWidth: sz.currentOrint=="vt"?sz.getWidth(80):sz.getWidth(100),
                      maxHeight: sz.currentOrint=="vt"?600:600,
                      minHeight: sz.currentOrint=="vt"?450:500,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        //SizedBox(height: sz.currentOrint=="vt"?sz.getHeight(2):sz.getHeight(2),),
                        TextFormField(

                            controller: titleCtr,
                            onTap: ()async{

                            },
                            textAlign: TextAlign.left,
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              border:OutlineInputBorder(
                                  borderSide:BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(20.0)
                              ),

                              labelText: "title",

                            ),
                            keyboardType: TextInputType.name,//.numberWithOptions(decimal: true,signed: true),
                            //autofocus: false,Y
                            validator: (email) {
                              if (email!.isEmpty) {
                                return "Enter the title";
                              }
                            }
                        ),
                        // onSaved: (value) => _email = value,
                        TextFormField(
                          controller: priceCtr,
                          autovalidateMode:
                          AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            border:OutlineInputBorder(
                                borderSide:BorderSide(color: mainColor),
                                borderRadius: BorderRadius.circular(20.0)
                            ),
                            labelText: "Price",
                          ),
                        ),
                        // SizedBox(height: sz.currentOrint=="vt"?sz.getHeight(2):sz.getHeight(2),),
                        TextFormField(
                          controller: descriptionCtr,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            border:OutlineInputBorder(
                                borderSide:BorderSide(color: mainColor),
                                borderRadius: BorderRadius.circular(20.0)
                            ),
                            labelText: "Description",
                          ),
                          obscureText: false,
                        ),

                        //SizedBox(height: sz.currentOrint=="vt"?sz.getHeight(2):sz.getHeight(2),),
                        TextFormField(
                          controller: imageCtr,
                          onTap: ()async{

                          },
                          textAlign: TextAlign.left,
                          autovalidateMode:
                          AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            border:OutlineInputBorder(
                                borderSide:BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(20.0)
                            ),
                            labelText: "Image Url",
                          ),
                          keyboardType: TextInputType.name,//.numberWithOptions(decimal: true,signed: true),
                        ),
                        TextFormField(
                          controller: categoryCtr,
                          onTap: ()async{

                          },
                          textAlign: TextAlign.left,
                          autovalidateMode:
                          AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            border:OutlineInputBorder(
                                borderSide:BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(20.0)
                            ),
                            labelText: "Category",
                          ),
                          keyboardType: TextInputType.name,//.numberWithOptions(decimal: true,signed: true),
                        ),
                        // /////////////  LogIn Botton///////////////////
                        ElevatedButton(
                          child: Padding(
                            //padding: EdgeInsets.zero,
                            padding: EdgeInsets.only(top: sz.getWidth(1.5), bottom: sz.getWidth(1.5), left: sz.getWidth(2), right: sz.getWidth(2)),
                            child:Text(
                              'Send',
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                color: secColor,
                                fontSize: 15.0,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            //onSurface: mainColor,
                            primary:Colors.deepOrange,
                            //shadowColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                          ),
                          onPressed: () async {
                            Map<String, dynamic> data = {
                              'title': titleCtr.text,
                              'description': descriptionCtr.text,
                              'category': categoryCtr.text,
                              'image': imageCtr.text,
                              'price': priceCtr.text,
                            };
                            var res = await addProductProvider.addProduct(data);
                            print("RES = "+ res.toString());
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          );
        }
    );
  }
}
