import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:main/UIs/screens/vendor/cart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../Data/env/env.dart';
import '../../../Domain/models/products.dart';

class productController extends GetxController {
  var products = <ProductDetail>[].obs;

  void getProduct(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    // response for unfollow
    var categoryResponse = await http.get(
      Uri.parse('$backendUrl/vendor/category/$id'),
      headers: {
        "Authorization": "Bearer $token",
      },
    );

    if (categoryResponse.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      var jsonResponse = jsonDecode(categoryResponse.body);
      print('JSON Response: $jsonResponse');

    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to get products');
    }
  }
}

class Product extends StatefulWidget {
  @override
  State<Product> createState() => ProductState();
}

class ProductState extends State<Product>{
  int _counter2 = 0;

  void _incrementCounter2() {
    setState(() {
      _counter2++;
    });
  }
  void _decrementCounter2() {
    setState(() {
      if(_counter2 != 0){
        _counter2--;
      }
    });
  }

  final productController controller = Get.put(productController());

  @override
  void initState() {
    super.initState();
    controller.getProduct(2);
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body: Column(
            children: [
              Container(
                width: double.infinity,
                height: 400.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/img/tent2.jpg'),
                        fit: BoxFit.fill
                    )
                ),
              ),

              Container(
                margin: EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    top: 10.0,
                    bottom: 5.0
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        controller.products.isNotEmpty ? controller.products.first.assential_name ?? 'N/A' : 'N/A',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      'Rs. 300',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0xff2FACBB)
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: 20.0,
                    right: 20.0
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Availablity',
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      'In Stock',
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.green
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    bottom: 10.0
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rating',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              top: 5.0,
                              right: 0.2,
                            ),
                            width: 15.0,
                            height: 15.0,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    'assets/img/rate.png',
                                  ),
                                  fit: BoxFit.cover
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                              top: 5.0,
                              right: 0.2,
                            ),
                            width: 15.0,
                            height: 15.0,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      'assets/img/rate.png',
                                    ),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                              top: 5.0,
                              right: 0.2,
                            ),
                            width: 15.0,
                            height: 15.0,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      'assets/img/rate.png',
                                    ),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                              top: 5.0,
                              right: 0.2,
                            ),
                            width: 15.0,
                            height: 15.0,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      'assets/img/rate.png',
                                    ),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                              top: 5.0,
                            ),
                            width: 15.0,
                            height: 15.0,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      'assets/img/rate.png',
                                    ),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Description : ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    Text(
                      'This tent is durable. Have all colours in Blue and Black with sizes L, XL.',
                      style: TextStyle(
                          fontSize: 12
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Contact me: 0748596872',
                          style: TextStyle(
                              fontSize: 12
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(
                  left: 20.0,
                  right: 20,
                ),
                child: Column(
                  children: [
                    Divider(
                      color: Colors.grey,
                    )
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    bottom: 5
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Quantity',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 10,
                        left: 5,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            // width: 50.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.shade300,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(
                                      Icons.remove,
                                      color: Colors.black,
                                    ),
                                    onPressed: _decrementCounter2,
                                  ),
                                  SizedBox(width: 8,),
                                  Container(
                                    width: 38,
                                    height: 39,
                                    padding: EdgeInsets.only(
                                        top: 8
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(5)),
                                        color: Colors.white
                                    ),
                                    child: Text(
                                      '$_counter2',
                                      style: TextStyle(fontSize: 20.0),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SizedBox(width: 8,),
                                  IconButton(
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.black,
                                    ),
                                    alignment: Alignment.center,
                                    onPressed: _incrementCounter2,
                                  ),
                                ],
                              )
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: 20.0,
                    right: 20.0
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.black
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      'Rs. 300',
                      style: TextStyle(
                          fontSize: 25.0,
                          color: Color(0xff2FACBB)
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                alignment: Alignment.center,


                child: Column(
                  children: [
                    Container(
                      width: 200, // Custom width
                      height: 50, // Custom height
                      child: ElevatedButton(
                          onPressed: () {
                            // Add your button action here
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>  Cart())
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            onPrimary: Colors.white,
                            primary: Color(0xff2FACBB),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5), // Adjust the radius here
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  margin: EdgeInsets.all(5.0),
                                  width: 20.0,
                                  height: 20.0,
                                  child: Icon(Icons.shopping_cart_outlined)
                              ),

                              Container(
                                margin: EdgeInsets.only(
                                    right: 26.0
                                ),
                                child: Text(
                                  'Add to cart',
                                  style: TextStyle(
                                      fontSize: 20
                                  ),
                                ),
                              )

                            ],
                          )

                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
    );
  }
}