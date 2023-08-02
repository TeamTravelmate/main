import 'package:flutter/material.dart';
import 'package:main/UIs/screens/vendor/checkout.dart';
// import 'package:main/UIs/screens/widgets/bottom_nav.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

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
                      Icon(Icons.arrow_back_ios_new_outlined),
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
                                child: Image(
                                  image: AssetImage('assets/img/menu.png'),
                                )
                            )

                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                              ),
                              child: Text(
                                'Colour: Black',
                                style: TextStyle(
                                    fontSize: 10.0
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 10.0,
                                  right: 80.0
                              ),
                              child: Text(
                                'Size: L',
                                style: TextStyle(
                                    fontSize: 10.0
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 50.0,
                              height: 10.0,
                              margin: EdgeInsets.only(
                                  right: 20.0,
                                  left: 2.0
                              ),

                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/img/cart.png'),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 50.0
                              ),
                              child: Text(
                                'Rs. 300',
                                style: TextStyle(
                                    fontSize: 20.0
                                ),
                              ),
                            )
                          ],
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
                                child: Image(
                                  image: AssetImage('assets/img/menu.png'),
                                )
                            )

                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  right: 10.0
                              ),
                              child: Text(
                                'Colour: Blue',
                                style: TextStyle(
                                    fontSize: 10.0
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 10.0,
                                  right: 80.0
                              ),
                              child: Text(
                                'Size: L',
                                style: TextStyle(
                                    fontSize: 10.0
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 50.0,
                              height: 10.0,
                              margin: EdgeInsets.only(
                                  right: 20.0,
                                  left: 2.0
                              ),

                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/img/cart.png'),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 50.0
                              ),
                              child: Text(
                                'Rs. 100',
                                style: TextStyle(
                                    fontSize: 20.0
                                ),
                              ),
                            )
                          ],
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