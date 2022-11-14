import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getapi_app/model/cart.dart';
import 'package:getapi_app/modelviwe/cartVM.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context){
      return Consumer<CartVM>(
          builder: (context, cartProvider, child) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Cart Screen"),
              ),
              body: FutureBuilder(
                  future: cartProvider.getCardList(),
                  builder: (context, snapshot){
                    List<Cart> cartList = cartProvider.itemList;
                    if(cartList.isEmpty){
                      return Center(
                        child: Container(
                          child: Text("Cart is empty"),
                        ),
                      );
                    }
                    else {
                      return ListView.builder(
                          itemCount: cartList.length,
                          itemBuilder: (context, index){
                            return Stack(
                              children:[ ListTile(
                                  onTap: () {},
                                  title: Text(cartList[index].title),
                                  leading: IconButton(
                                        icon: Icon(Icons.remove_circle_rounded,color: Colors.deepOrange,),
                                        mouseCursor: MouseCursor.defer,
                                        tooltip: "delete",
                                        onPressed: () {
                                          cartProvider.removeFromCart(cartList[index].cart_id);
                                        },),
                                  trailing: CircleAvatar(
                                    radius: 25.0,
                                    backgroundColor: Colors.white70,
                                    child: Text(cartList[index].price.toString())
                                  ),
                              ),
                                Divider(height: 1.5,),
                            ]);
                          });
                    }
                  }),
            );
          });
  }
}