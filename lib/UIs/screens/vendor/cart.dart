import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:main/UIs/screens/vendor/checkout.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Data/env/env.dart';
import 'package:http/http.dart' as http;

class CartController extends GetxController{
  var cart = <Cart>[].obs;

  void getCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    // response to get following
    var cartResponse = await http.get(
      Uri.parse('$backendUrl/vendor/myCart/'),
      headers: {
        "Authorization": "Bearer $token",
      },
    );

    if (cartResponse.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      var jsonResponse = jsonDecode(cartResponse.body);
      print('JSON Response: $jsonResponse');

      // List<dynamic> jsonList = jsonResponse['following'] ?? [];
      // cart.value = Cart.fromJsonList(jsonList);
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to load data');
    }
  }
}

class Cart extends StatefulWidget {
  @override
  State<Cart> createState() => CartState();
}

class CartState extends State<Cart>{
  int _counter1 = 0;
  int _counter2 = 0;
  void _incrementCounter1() {
    setState(() {
      _counter1++;
    });
  }
  void _decrementCounter1() {
    setState(() {
      if(_counter1 != 0){
        _counter1--;
      }
    });
  }
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Container(
              width: double.infinity, // Set the container's width to occupy the whole screen
              child: Card(
                margin: EdgeInsets.only(
                    top: 50.0
                ),
                elevation: 4.0,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_back),
                      SizedBox(width: 120.0,),
                      Text(
                        'My Cart',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

              ),
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              child: Card(
                // Define the shape of the card
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Row(
                  children: [
                    Column(
                      children: <Widget>[
                        Container(
                          height: 110,
                          width: 100,

                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/img/tent4.jpg'
                                ),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(5.0))
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  right: 115.0,
                                  left: 5.0
                              ),
                              child: Text(
                                'Tent',
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(
                                    left: 20.0,
                                    right: 10.0
                                ),
                                child: Icon(Icons.more_vert),
                            )

                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 5,),
                            Text(
                              'Colour: Black',
                              style: TextStyle(
                                  fontSize: 12.0
                              ),
                            ),
                            SizedBox(width: 20,),
                            Text(
                              'Size: L',
                              style: TextStyle(
                                  fontSize: 12.0
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: 10,
                              left: 5
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                // width: 50.0,
                                // height: 10.0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(0.2), // Set the shadow color with some opacity
                                              spreadRadius: 2, // Set the spread radius of the shadow
                                              blurRadius: 4, // Set the blur radius of the shadow
                                              offset: Offset(2, 2), // Set the offset of the shadow
                                            ),
                                          ],
                                        ),
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.remove,
                                            color: Colors.grey,
                                          ),
                                          onPressed: _decrementCounter1,
                                        ),
                                      ),
                                      SizedBox(width: 8,),
                                      Text(
                                        '$_counter1',
                                        style: TextStyle(fontSize: 18.0),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(width: 8,),
                                      Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(0.2), // Set the shadow color with some opacity
                                              spreadRadius: 2, // Set the spread radius of the shadow
                                              blurRadius: 2,
                                              offset: Offset(2, 2),
                                            ),
                                          ],
                                        ),
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.add,
                                            color: Colors.grey,
                                          ),
                                          alignment: Alignment.center,
                                          onPressed: _incrementCounter1,
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 40.0
                                ),
                                child: Text(
                                  'Rs. 300',
                                  style: TextStyle(
                                      fontSize: 20.0
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              child: Card(
                // Define the shape of the card
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Row(
                  children: [
                    Column(
                      children: <Widget>[
                        Container(
                          height: 110,
                          width: 100,

                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/img/pillow.jpg'
                                ),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(5.0))
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  right: 95.0,
                                  left: 5.0
                              ),
                              child: Text(
                                'Pillow',
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(
                                    left: 20.0,
                                    right: 10.0
                                ),
                                child: Icon(Icons.more_vert),
                            )

                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 5,),
                            Text(
                              'Colour: Blue',
                              style: TextStyle(
                                  fontSize: 12.0
                              ),
                            ),
                            SizedBox(width: 20,),
                            Text(
                              'Size: L',
                              style: TextStyle(
                                  fontSize: 12.0
                              ),
                            ),
                          ],
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
                                // height: 10.0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(0.2), // Set the shadow color with some opacity
                                              spreadRadius: 2, // Set the spread radius of the shadow
                                              blurRadius: 4, // Set the blur radius of the shadow
                                              offset: Offset(2, 2), // Set the offset of the shadow
                                            ),
                                          ],
                                        ),
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.remove,
                                            color: Colors.grey,
                                          ),
                                          onPressed: _decrementCounter2,
                                        ),
                                      ),
                                      SizedBox(width: 8,),
                                      Text(
                                        '$_counter2',
                                        style: TextStyle(fontSize: 18.0),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(width: 8,),
                                      Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(0.2), // Set the shadow color with some opacity
                                              spreadRadius: 2, // Set the spread radius of the shadow
                                              blurRadius: 2,
                                              offset: Offset(2, 2),
                                            ),
                                          ],
                                        ),
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.add,
                                            color: Colors.grey,
                                          ),
                                          alignment: Alignment.center,
                                          onPressed: _incrementCounter2,
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 40.0
                                ),
                                child: Text(
                                  'Rs. 100',
                                  style: TextStyle(
                                      fontSize: 20.0
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 70.0,),
            Container(
              margin: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total amount:',
                    style: TextStyle(
                        fontSize: 18.0
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'Rs. 400',
                    style: TextStyle(
                        fontSize: 18.0
                    ),
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
            ),
            Container(
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
                                  builder: (context) => const Checkout())
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          onPrimary: Colors.white,
                          primary: Color(0xff0C1C33),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5), // Adjust the radius here
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: 45.0
                              ),
                              child: Text(
                                'Checkout',
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                                textAlign: TextAlign.center,
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