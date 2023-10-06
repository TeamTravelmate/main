import 'dart:io';
import 'package:flutter/material.dart';
import 'package:main/UIs/screens/product/update.dart';
import 'package:main/UIs/screens/vendor/cart.dart';
// import 'package:main/UIs/screens/Trip/publicTrip/joinPublicTripForm.dart';
import '../../themes/colors.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/tripCard_widget.dart';
import '../myorders/track_order.dart';
import '../product/add.dart';
import 'catalog.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            leading: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            title: Text(
              'Tour Essentials',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
            child: Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text(
                          'Welcome!',
                          style: TextStyle(
                            fontSize: 30.0,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Color(0xff2FACBB),
                            ),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Update()
                                    )
                                );
                              },
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                              width: 30.0,
                              height: 30.0,
                              margin: EdgeInsets.only(
                                // left: 60.0,
                                  right: 20.0
                              ),
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Cart()
                                      )
                                  );
                                },
                                child: Image(
                                  image: AssetImage('assets/img/cart.png'),
                                ),
                              )
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          left: 20.0,
                        ),
                        padding: const EdgeInsets.only(
                          top: 10.0,
                          bottom: 20.0,
                          left: 20.0,
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Need Help?',
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Make an appoinment or chat with us',
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        width: size.width * 0.8,
                        height: 115.0,
                        decoration: const BoxDecoration(
                            color: Color(0xff2FACBB),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10)
                            )
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: 20
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: ColorsTravelMate.secundary.withOpacity(0.3)
                    ),
                    child:  TabBar(
                      labelColor: Colors.white,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Color.fromRGBO(47, 172, 187, 35)
                      ),
                      indicatorColor: ColorsTravelMate.secundary,
                      unselectedLabelColor: ColorsTravelMate.primary,
                      labelPadding: EdgeInsets.all(0),
                      unselectedLabelStyle:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      labelStyle:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                      tabs: [
                        Tab(
                          text: "Camping",
                        ),
                        Tab(text: "Hiking"),
                        Tab(text: "Surfing"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: TabBarView(
                      children: [
                        Camping(),
                        Hiking(),
                        Surfing(),
                      ],
                    ),
                  ),



                ],
              ),
            ),
          ),
        ));
  }
}

class Camping extends StatefulWidget {
  const Camping({Key? key}) : super(key: key);

  @override
  _CampingState createState() => _CampingState();
}

class _CampingState extends State<Camping> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Card(
                            elevation: 5.0,
                            shadowColor: Colors.black,
                            color: Color(0xff2FACBB),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5)
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(5.0),
                              child: Column(
                                children: [
                                  Image(
                                    image: AssetImage('assets/img/grid.png'),
                                  ),
                                ],
                              ),
                            )
                        ),
                        Text(
                          'All',
                          style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  blurRadius: 3.0,
                                  color: Colors.grey,
                                  offset: Offset(1.0, 1.0),
                                )
                              ]
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Card(
                            elevation: 5.0,
                            shadowColor: Colors.black,
                            color: Color(0xff2FACBB),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5)
                              ),
                            ),
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/img/tent.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(5.0))
                              ),

                            )
                        ),
                        Text(
                          'Tents',
                          style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  blurRadius: 3.0,
                                  color: Colors.grey,
                                  offset: Offset(1.0, 1.0),
                                )
                              ]
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Card(
                            elevation: 5.0,
                            shadowColor: Colors.black,
                            color: Color(0xff2FACBB),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5)
                              ),
                            ),
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/img/pillow.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(5.0))
                              ),

                            )
                        ),
                        Text(
                          'Pillows',
                          style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  blurRadius: 3.0,
                                  color: Colors.grey,
                                  offset: Offset(1.0, 1.0),
                                )
                              ]
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Card(
                            elevation: 5.0,
                            shadowColor: Colors.black,
                            color: Color(0xff2FACBB),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5)
                              ),
                            ),
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/img/chair.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(5.0))
                              ),

                            )
                        ),
                        Text(
                          'Chairs',
                          style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  blurRadius: 3.0,
                                  color: Colors.grey,
                                  offset: Offset(1.0, 1.0),
                                )
                              ]
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Card(
                            elevation: 5.0,
                            shadowColor: Colors.black,
                            color: Color(0xff2FACBB),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5)
                              ),
                            ),
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/img/light.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(5.0))
                              ),

                            )
                        ),
                        Text(
                          'Tent lights',
                          style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  blurRadius: 3.0,
                                  color: Colors.grey,
                                  offset: Offset(1.0, 1.0),
                                )
                              ]
                          ),
                        )
                      ],
                    ),
                  ),
                ]
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                    margin: const EdgeInsets.only(
                      left: 10.0,
                    ),
                    child: const Text(
                      'Popularity',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                )

              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                  child: Card(
                    elevation: 5.0,
                    shadowColor: Colors.black,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(10)
                      ),
                    ),
                    child: Container(
                        width: size.width * 0.8,
                        height: 200.0,
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            GestureDetector(
                              child: Container(
                                width: size.width * 0.7,
                                height: 150.0,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10)
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/img/tent.jpg',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Catalog()));
                              },
                            ),

                            Container(
                              margin: EdgeInsets.only(
                                  left: 10.0
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      'Tent',
                                      style: TextStyle(
                                        color: Color(0xff2FACBB),
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        right: 20.0
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                            top: 5.0,
                                          ),
                                          width: 8.0,
                                          height: 10.0,
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
                                          width: 8.0,
                                          height: 10.0,
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
                                          width: 8.0,
                                          height: 10.0,
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
                                          width: 8.0,
                                          height: 10.0,
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
                                          width: 8.0,
                                          height: 10.0,
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
                                  left: 10.0
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      right: 220.0,
                                    ),
                                    child: Text(
                                      'Rs.500',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10.0,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )

                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Hiking extends StatefulWidget {
  const Hiking({Key? key}) : super(key: key);

  @override
  _HikingState createState() => _HikingState();
}

class _HikingState extends State<Hiking> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Card(
                            elevation: 5.0,
                            shadowColor: Colors.black,
                            color: Color(0xff2FACBB),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5)
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(5.0),
                              child: Column(
                                children: [
                                  Image(
                                    image: AssetImage('assets/img/grid.png'),
                                  ),
                                ],
                              ),
                            )
                        ),
                        Text(
                          'All',
                          style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  blurRadius: 3.0,
                                  color: Colors.grey,
                                  offset: Offset(1.0, 1.0),
                                )
                              ]
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Card(
                            elevation: 5.0,
                            shadowColor: Colors.black,
                            color: Color(0xff2FACBB),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5)
                              ),
                            ),
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/img/tent.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(5.0))
                              ),

                            )
                        ),
                        Text(
                          'Tents',
                          style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  blurRadius: 3.0,
                                  color: Colors.grey,
                                  offset: Offset(1.0, 1.0),
                                )
                              ]
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Card(
                            elevation: 5.0,
                            shadowColor: Colors.black,
                            color: Color(0xff2FACBB),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5)
                              ),
                            ),
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/img/pillow.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(5.0))
                              ),

                            )
                        ),
                        Text(
                          'Pillows',
                          style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  blurRadius: 3.0,
                                  color: Colors.grey,
                                  offset: Offset(1.0, 1.0),
                                )
                              ]
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Card(
                            elevation: 5.0,
                            shadowColor: Colors.black,
                            color: Color(0xff2FACBB),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5)
                              ),
                            ),
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/img/chair.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(5.0))
                              ),

                            )
                        ),
                        Text(
                          'Chairs',
                          style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  blurRadius: 3.0,
                                  color: Colors.grey,
                                  offset: Offset(1.0, 1.0),
                                )
                              ]
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Card(
                            elevation: 5.0,
                            shadowColor: Colors.black,
                            color: Color(0xff2FACBB),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5)
                              ),
                            ),
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/img/light.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(5.0))
                              ),

                            )
                        ),
                        Text(
                          'Tent lights',
                          style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  blurRadius: 3.0,
                                  color: Colors.grey,
                                  offset: Offset(1.0, 1.0),
                                )
                              ]
                          ),
                        )
                      ],
                    ),
                  ),
                ]
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                    margin: const EdgeInsets.only(
                      left: 10.0,
                    ),
                    child: const Text(
                      'Popularity',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                )

              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                  child: Card(
                    elevation: 5.0,
                    shadowColor: Colors.black,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(10)
                      ),
                    ),
                    child: Container(
                        width: size.width * 0.8,
                        height: 200.0,
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            GestureDetector(
                              child: Container(
                                width: size.width * 0.7,
                                height: 150.0,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10)
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/img/bag.jpg',
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Catalog()));
                              },
                            ),

                            Container(
                              margin: EdgeInsets.only(
                                  left: 10.0
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      'Hiking Bag',
                                      style: TextStyle(
                                        color: Color(0xff2FACBB),
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        right: 20.0
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                            top: 5.0,
                                          ),
                                          width: 8.0,
                                          height: 10.0,
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
                                          width: 8.0,
                                          height: 10.0,
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
                                          width: 8.0,
                                          height: 10.0,
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
                                          width: 8.0,
                                          height: 10.0,
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
                                          width: 8.0,
                                          height: 10.0,
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
                                  left: 10.0
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      right: 220.0,
                                    ),
                                    child: Text(
                                      'Rs.1500',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10.0,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )

                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Surfing extends StatefulWidget {
  const Surfing({Key? key}) : super(key: key);

  @override
  _SurfingState createState() => _SurfingState();
}

class _SurfingState extends State<Surfing> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Card(
                            elevation: 5.0,
                            shadowColor: Colors.black,
                            color: Color(0xff2FACBB),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5)
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(5.0),
                              child: Column(
                                children: [
                                  Image(
                                    image: AssetImage('assets/img/grid.png'),
                                  ),
                                ],
                              ),
                            )
                        ),
                        Text(
                          'All',
                          style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  blurRadius: 3.0,
                                  color: Colors.grey,
                                  offset: Offset(1.0, 1.0),
                                )
                              ]
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Card(
                            elevation: 5.0,
                            shadowColor: Colors.black,
                            color: Color(0xff2FACBB),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5)
                              ),
                            ),
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/img/tent.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(5.0))
                              ),

                            )
                        ),
                        Text(
                          'Tents',
                          style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  blurRadius: 3.0,
                                  color: Colors.grey,
                                  offset: Offset(1.0, 1.0),
                                )
                              ]
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Card(
                            elevation: 5.0,
                            shadowColor: Colors.black,
                            color: Color(0xff2FACBB),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5)
                              ),
                            ),
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/img/pillow.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(5.0))
                              ),

                            )
                        ),
                        Text(
                          'Pillows',
                          style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  blurRadius: 3.0,
                                  color: Colors.grey,
                                  offset: Offset(1.0, 1.0),
                                )
                              ]
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Card(
                            elevation: 5.0,
                            shadowColor: Colors.black,
                            color: Color(0xff2FACBB),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5)
                              ),
                            ),
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/img/chair.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(5.0))
                              ),

                            )
                        ),
                        Text(
                          'Chairs',
                          style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  blurRadius: 3.0,
                                  color: Colors.grey,
                                  offset: Offset(1.0, 1.0),
                                )
                              ]
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Card(
                            elevation: 5.0,
                            shadowColor: Colors.black,
                            color: Color(0xff2FACBB),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5)
                              ),
                            ),
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/img/light.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(5.0))
                              ),

                            )
                        ),
                        Text(
                          'Tent lights',
                          style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  blurRadius: 3.0,
                                  color: Colors.grey,
                                  offset: Offset(1.0, 1.0),
                                )
                              ]
                          ),
                        )
                      ],
                    ),
                  ),
                ]
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                    margin: const EdgeInsets.only(
                      left: 10.0,
                    ),
                    child: const Text(
                      'Popularity',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                )

              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                  child: Card(
                    elevation: 5.0,
                    shadowColor: Colors.black,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(10)
                      ),
                    ),
                    child: Container(
                        width: size.width * 0.8,
                        height: 200.0,
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            GestureDetector(
                              child: Container(
                                width: size.width * 0.7,
                                height: 150.0,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10)
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/img/surfboard.jpg',
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Catalog()));
                              },
                            ),

                            Container(
                              margin: EdgeInsets.only(
                                  left: 10.0
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      'Surfing Board',
                                      style: TextStyle(
                                        color: Color(0xff2FACBB),
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        right: 20.0
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                            top: 5.0,
                                          ),
                                          width: 8.0,
                                          height: 10.0,
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
                                          width: 8.0,
                                          height: 10.0,
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
                                          width: 8.0,
                                          height: 10.0,
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
                                          width: 8.0,
                                          height: 10.0,
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
                                          width: 8.0,
                                          height: 10.0,
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
                                  left: 10.0
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      right: 220.0,
                                    ),
                                    child: Text(
                                      'Rs.6500',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10.0,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )

                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

