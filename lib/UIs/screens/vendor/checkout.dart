import 'package:flutter/material.dart';
import 'package:main/UIs/screens/addCard/address.dart';
import 'package:main/UIs/screens/addCard/paycard.dart';
import 'package:main/UIs/screens/vendor/success.dart';

class Checkout extends StatelessWidget{
  const Checkout({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Container(
              width: double.infinity, // Set the container's width to occupy the whole screen
              child: Card(
                elevation: 4.0,
                color: Colors.white,
                margin: EdgeInsets.only(
                    top: 50.0
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back_ios_new_outlined),
                      SizedBox(width: 110.0,),
                      Text(
                        'Checkout',
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
              margin: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
              top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Shipping address',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Address()
                          )
                      );
                    },
                    child: Text(
                      'Change',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 18.0
                      ),
                      textAlign: TextAlign.end,
                    ),
                  )
                ],
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Jane Doe',
                                style: TextStyle(
                                  fontSize: 15.0,
                                ),
                                textAlign: TextAlign.left,
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
              margin: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  bottom: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Payment',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PayCard()
                          )
                      );
                    },
                    child: Text(
                      'Change',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 18.0
                      ),
                      textAlign: TextAlign.end,
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Card(
                    margin: EdgeInsets.only(
                        left: 30.0,
                        right: 20.0,
                        bottom: 20.0
                    ),
                    elevation: 5,
                    shadowColor: Colors.black,
                    color: Colors.white,
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      width: 70.0,
                      height: 55.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/img/mc.png'),
                          )
                      ),

                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        right: 60.0
                    ),
                    child: Text(
                      '**** **** **** 3197',
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.black
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: 20.0,
                  right: 200.0,
                  bottom: 5.0
              ),
              child: Text(
                'Delivery Method',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              width: double.infinity,
              // height: 60.0,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Card(
                    margin: EdgeInsets.only(
                      left: 20.0,
                    ),
                    elevation: 5,
                    shadowColor: Colors.black,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 8.0,
                              left: 8.0,
                              top: 15.0,
                              bottom: 4.0
                          ),
                          child: Image.asset(
                            'assets/img/fedex.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0,
                              right: 8.0,
                              top: 1.0,
                              bottom: 10.0),
                          child: Text(
                            '2-3 days.', // Replace with your actual text
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.only(
                      left: 10.0,
                    ),
                    elevation: 5,
                    shadowColor: Colors.black,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 8.0,
                              left: 8.0,
                              top: 20.0,
                              bottom: 4.0
                          ),
                          child: Image.asset(
                            'assets/img/usps.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0,
                              right: 8.0,
                              top: 1.0,
                              bottom: 10.0),
                          child: Text(
                            '2-3 days.', // Replace with your actual text
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.only(
                        left: 10.0,
                        right: 20.0
                    ),
                    elevation: 5,
                    shadowColor: Colors.black,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 8.0,
                              left: 8.0,
                              top: 15.0,
                              bottom: 2.0
                          ),
                          child: Image.asset(
                            'assets/img/dhl.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0,
                              right: 8.0,
                              top: 1.0,
                              bottom: 10.0),
                          child: Text(
                            '2-3 days.', // Replace with your actual text
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey
                            ),
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
                  top: 20.0
              ),
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Order: ',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'Rs. 400 ',
                    style: TextStyle(
                      fontSize: 16.0,
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
              ),
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Delivery: ',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'Rs. 50 ',
                    style: TextStyle(
                      fontSize: 16.0,
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
                  bottom: 20.0
              ),
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Summary: ',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'Rs. 450 ',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold
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
                                  builder: (context) => const Success())
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
                                  left: 25.0
                              ),
                              child: Text(
                                'Submit Order',
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