import 'package:flutter/material.dart';
import 'package:getapi_app/model/product.dart';
import 'package:getapi_app/modelviwe/productdetailsVM.dart';
import 'package:provider/provider.dart';


class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key, required this.productId}) : super(key: key);
  final Product productId;
  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductDetailsVM>(
        builder: (context, productsDetailsProvider, child) {
          productsDetailsProvider.getProductById(widget.productId.id);
          return Scaffold(
            appBar: AppBar(
              title: Text("Product Details"),
            ),
            body: FutureBuilder(
                future: productsDetailsProvider.getProductById(widget.productId.id),
                builder: (context, snapshot){
                  Product product= widget.productId;
                  switch(snapshot.connectionState){
                    case ConnectionState.waiting: {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.deepOrange,
                        ),
                      ) ;
                    }
                    break;
                    default :{
                      if(snapshot.hasError){
                        return Center(
                          child: Container(
                            child: Text("Error Happened"),
                          ),
                        );
                      }
                      else{
                        return Column(
                          textDirection:TextDirection.ltr,
                          children: [
                            CircleAvatar(child: Image.network(product.image,),
                              radius: 150,
                              backgroundColor: Colors.white,),
                            SizedBox(height: 4,),
                            Divider(height: 1.0,),
                            Text("TITLE:  " +product.title),
                            SizedBox(height: 4,),
                            Divider(height: 1.0,),
                            Text("Price:  " +product.price),
                            SizedBox(height: 4,),
                            Divider(height: 1.0,),
                            Text("Description:  " +product.description),
                            SizedBox(height: 4,),
                            Divider(height: 1.0,),
                            Text("Category:  " +product.category),
                            SizedBox(height: 4,),
                            Divider(height: 1.0,),
                            Text("Rate:  " +product.rate),
                            SizedBox(height: 4,),
                            Divider(height: 1.0,),
                            Text("Count:  " +product.count),
                          ],
                        );
                      }
                    }
                  }
                }),
          );
        }
    );
  }
}
