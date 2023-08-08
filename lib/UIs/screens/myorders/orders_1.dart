import 'package:flutter/material.dart';

class Deliver extends StatelessWidget {
  const Deliver({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              Card(
                margin: EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    bottom: 20.0,
                  top: 30
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
                              'Delivered',
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
                              'Delivered',
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
                              'Delivered',
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