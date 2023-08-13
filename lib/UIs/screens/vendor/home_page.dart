// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:main/UIs/screens/myorders/track_order.dart';
import 'package:main/UIs/screens/product/add.dart';
import 'package:main/UIs/screens/vendor/catalog.dart';
import 'package:main/UIs/themes/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            'TOUR ESSENTIALS',
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500),
          ),
        ),
        body: SingleChildScrollView(
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
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Add()));
                          },
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Container(
                          width: 30.0,
                          height: 30.0,
                          margin: EdgeInsets.only(
                              // left: 60.0,
                              right: 20.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TrackOrder()));
                            },
                            child: Image(
                              image: AssetImage('assets/img/cart.png'),
                            ),
                          )),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Color(0xff2FACBB),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        )),
                    padding: const EdgeInsets.only(
                      left: 25.0,
                      right: 25.0,
                      top: 12.0,
                      bottom: 12.0,
                    ),
                    margin: const EdgeInsets.only(left: 25.0),
                    child: const Text(
                      'Camping',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: ColorsTravelMate.secundary.withOpacity(0.2),
                    ),
                    padding: const EdgeInsets.only(
                      left: 25.0,
                      right: 25.0,
                      top: 12.0,
                      bottom: 12.0,
                    ),
                    child: const Text(
                      'Hiking',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: ColorsTravelMate.secundary.withOpacity(0.2),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    padding: const EdgeInsets.only(
                      left: 25.0,
                      right: 25.0,
                      top: 12.0,
                      bottom: 12.0,
                    ),
                    margin: const EdgeInsets.only(right: 25.0),
                    child: const Text(
                      'Surfing',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  
                ],
              ),
              const SizedBox(height: 20),
              Container(
                width: size.width * 0.9,
                height: size.height * 0.12,
                margin: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                ),
                padding: const EdgeInsets.only(
                  top: 20.0,
                  bottom: 20.0,
                  left: 30.0,
                  right: 30.0,
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
                decoration: const BoxDecoration(
                    color: Color(0xff2FACBB),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
              ),
              const SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Container(
                  child: Column(
                    children: [
                      Card(
                          elevation: 5.0,
                          shadowColor: Colors.black,
                          color: Color(0xff2FACBB),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
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
                          )),
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
                            ]),
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
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/img/tent.jpg'),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0))),
                          )),
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
                            ]),
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
                          color: ColorsTravelMate.secundary,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/img/pillow.jpg'),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0))),
                          )),
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
                            ]),
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
                          color: ColorsTravelMate.secundary,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/img/chair.jpg'),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0))),
                          )),
                      const Text(
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
                            ]),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Card(
                          elevation: 5.0,
                          shadowColor: ColorsTravelMate.primary,
                          color: ColorsTravelMate.secundary,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/img/light.jpg'),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0))),
                          )),
                      const Text(
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
                            ]),
                      )
                    ],
                  ),
                ),
              ]),
              const SizedBox(height: 20),
              Row(
                children: [
                  Container(
                      margin: const EdgeInsets.only(
                        left: 20.0,
                      ),
                      child: const Text(
                        'Popularity',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ))
                ],
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  Card(
                    elevation: 5.0,
                    shadowColor: Colors.black,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Container(
                      width: size.width * 0.8,
                      height: 230.0,
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10.0,
                          ),
                          GestureDetector(
                            child: Container(
                              width: 300.0,
                              height: 150.0,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/img/tent.jpg',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Catalog()));
                            },
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Tent',
                                      style: TextStyle(
                                        color: Color(0xff2FACBB),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Rs.500',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.0,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 15.0,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 15.0,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 15.0,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 15.0,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 15.0,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 15.0,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Card(
                    elevation: 5.0,
                    shadowColor: Colors.black,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Container(
                      width: size.width * 0.8,
                      height: 230.0,
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10.0,
                          ),
                          GestureDetector(
                            child: Container(
                              width: 300.0,
                              height: 150.0,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/img/tent.jpg',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Catalog()));
                            },
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Tent',
                                      style: TextStyle(
                                        color: Color(0xff2FACBB),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Rs.500',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.0,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 15.0,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 15.0,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 15.0,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 15.0,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 15.0,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 15.0,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
