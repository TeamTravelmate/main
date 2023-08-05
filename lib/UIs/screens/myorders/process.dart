import 'package:flutter/material.dart';
import 'package:main/UIs/screens/myorders/cancel.dart';
import 'package:main/UIs/screens/myorders/orders_1.dart';

class Process extends StatelessWidget {
  const Process({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              Card(
                margin: EdgeInsets.only(
                    top: 45.0,
                    bottom: 10.0
                ),
                elevation: 5.0,
                shadowColor: Colors.black,
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.arrow_back_ios_new),
                      Text(
                        'My Orders',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Icon(Icons.search)
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    bottom: 10.0
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Deliver())
                        );
                      },
                      child: Text(
                        'Delivered',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black
                        ),
                      ),
                    ),
                    Container(
                      width: 100, // Custom width
                      height: 40, // Custom height
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(25.0)
                        ),
                        color: Colors.black,
                      ),
                      child: Text(
                        'Processing',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Cancel())
                        );
                      },
                      child: Text(
                        'Cancelled',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                margin: EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    bottom: 20.0
                ),
                shadowColor: Colors.black,
                elevation: 5.0,
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: 5.0,
                            right: 5.0,
                            bottom: 10.0
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Order No:194734',
                              style: TextStyle(
                                  fontSize: 17.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              '05-12-2020',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16.0
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Text(
                              'Tracking Number:   ',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15.0
                              ),
                            ),
                            Text(
                              'IW345875645',
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Quantity:  ',
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.grey
                                  ),
                                ),
                                Text(
                                  '3',
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Total Amount:',
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.grey
                                  ),
                                ),
                                Text(
                                  '112\$',
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: OutlinedButton(
                                onPressed: () {
                                  // Handle button press here
                                },
                                child: Text(
                                  'Details',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black),
                                ),
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  side: BorderSide(
                                      color: Colors.black,
                                      width: 2),
                                ),
                              ),
                            ),
                            Text(
                              '2 days more',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 15.0
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}