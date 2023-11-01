import 'package:flutter/material.dart';
import 'package:main/UIs/screens/addCard/address.dart';

class Shipping_address extends StatelessWidget{
  const Shipping_address({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: BackButton(
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          title: Text(
            'Shipping Address',
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
              color: Colors.black,
            )
          ],
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Address()
                          )
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 10,
                          top: 10),
                      margin: EdgeInsets.only(
                          right: 20
                      ),
                      child: Text(
                        'Add',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green
                        ),
                      ),
                    )
                )

              ],
            ),
            Container(
              margin: EdgeInsets.all(15.0),
              child: Card(
                elevation: 6,
                shadowColor: Colors.black,
                color: Colors.white,
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Delete',
                            style: TextStyle(
                                color: Colors.red
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Jane Doe',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                              Text(
                                '3 Newbridge Court',
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                'Chino Hills, CA 91709, United Sates',
                                textAlign: TextAlign.left,
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15.0),
              child: Card(
                elevation: 6,
                shadowColor: Colors.black,
                color: Colors.white,
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Delete',
                            style: TextStyle(
                                color: Colors.red
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Jane Doe',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                              Text(
                                '3 Newbridge Court',
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                'Chino Hills, CA 91709, United Sates',
                                textAlign: TextAlign.left,
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15.0),
              child: Card(
                elevation: 6,
                shadowColor: Colors.black,
                color: Colors.white,
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Delete',
                            style: TextStyle(
                                color: Colors.red
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Jane Doe',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                              Text(
                                '3 Newbridge Court',
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                'Chino Hills, CA 91709, United Sates',
                                textAlign: TextAlign.left,
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15.0),
              child: Card(
                elevation: 6,
                shadowColor: Colors.black,
                color: Colors.white,
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Delete',
                            style: TextStyle(
                                color: Colors.red
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Jane Doe',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                              Text(
                                '3 Newbridge Court',
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                'Chino Hills, CA 91709, United Sates',
                                textAlign: TextAlign.left,
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}