import 'package:flutter/material.dart';
import 'package:getapi_app/model/product.dart';
import 'package:getapi_app/modelviwe/cartVM.dart';
import 'package:getapi_app/modelviwe/productdetailsVM.dart';
import 'package:getapi_app/modelviwe/productsVM.dart';
import 'package:getapi_app/ui/cartscreen.dart';
import 'package:getapi_app/ui/productdetailsscreen.dart';
import 'package:provider/provider.dart';

import 'AddProductScreen.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  TextEditingController searchCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //var cartProvider = Provider.of<CartVM>(context);
    //var productProvider = Provider.of<ProductsVM>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartScreen()));
            },
          ),
          // Padding(
          //   padding: EdgeInsets.all(10.0),
          //   child: Selector<CartVM, int>(
          //       selector: (context, getCounterProvider) =>
          //           getCounterProvider.getCounter,
          //       builder: (context, cartProvider, child) {
          //         return Text("${cartProvider.toString()}");
          //       }),
          // ),
          Consumer<CartVM>(
              builder: (context, object, child) {
                return Text("${object.getCounter.toString()}");
              })
          //Text("${cartProvider.counter.toString()}"),
        ],
        title: Text("Products"),
        backgroundColor: Colors.deepOrange,
        leading: TextField(
          controller: searchCtr,
          onChanged: (v) {
            setState(() {});
          },
        ),
      ),
      body: Consumer<ProductsVM>(
        builder: (context, productsProvider, child) {
          // productsProvider.getProducts();
          return FutureBuilder(
              future: productsProvider.getProducts(),
              builder: (context, snapshot) {
                List<Product> products = productsProvider.productsList;
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.deepOrange,
                        ),
                      );
                    }
                    break;
                  default:
                    {
                      if (snapshot.hasError) {
                        return Center(
                          child: Container(
                            child: Text("Error Happened"),
                          ),
                        );
                      } else {
                        return ListView.builder(
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              if (searchCtr.text.isNotEmpty) {
                                if (products[index]
                                    .title
                                    .toLowerCase()
                                    .contains(searchCtr.text.toLowerCase())) {
                                  return Column(children: [
                                    ListTile(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProductDetailsScreen(
                                                      productId:
                                                          products[index],
                                                    ),
                                            ),);
                                      },
                                      title: Text(products[index].title),
                                      trailing: CircleAvatar(
                                        radius: 50,
                                        backgroundColor: Colors.white,
                                        child: Image.network(
                                            products[index].image),
                                      ),
                                    ),
                                  ]);
                                } else {
                                  return Divider(
                                    height: 1.0,
                                  );
                                }
                              } else {
                                return Column(
                                  children: [
                                    ListTile(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductDetailsScreen(
                                                productId: products[index],
                                              ),
                                            ),
                                        );
                                      },
                                      title: Text(products[index].title),
                                      trailing: CircleAvatar(
                                        radius: 50,
                                        backgroundColor: Colors.white,
                                        child: Image.network(
                                            products[index].image),
                                      ),
                                      leading: Consumer<CartVM>(builder:
                                          (context, cartProvider, child) {
                                        return IconButton(
                                          icon: Icon(
                                            Icons.add_box_rounded,
                                            color: Colors.deepOrange,
                                          ),
                                          mouseCursor: MouseCursor.uncontrolled,
                                          tooltip: "add",
                                          onPressed: () {
                                            cartProvider
                                                .addToCart(products[index]);
                                            cartProvider.funCounter();
                                          },
                                        );
                                      }),
                                      // subtitle: Divider(
                                      //   height: 1.0,
                                      //   color: Colors.green,
                                      // ),
                                    ),
                                    Divider(
                                      height: 0.1,
                                    ),
                                  ],
                                );
                              }
                            });
                      }
                    }
                }
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => AddProductScreen())),
        backgroundColor: Colors.deepOrange,
        child: Center(child: Text("Add +")),
      ),
    );
  }
}
