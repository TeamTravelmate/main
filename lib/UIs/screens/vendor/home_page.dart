// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:main/UIs/screens/vendor/catalog.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'TOUR ESSENTIALS',
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
      body: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  'Welcome!',
                  style: TextStyle(
                    fontSize: 40.0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage('assets/img/girl1.jpeg'),
                ),
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
                    )
                ),
                padding: const EdgeInsets.only(
                  left: 25.0,
                  right: 25.0,
                  top: 12.0,
                  bottom: 12.0,),
                margin: const EdgeInsets.only(left: 25.0),
                child: const Text(
                  'Camping',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.lightBlueAccent,
                ),
                padding: const EdgeInsets.only(
                  left: 25.0,
                  right: 25.0,
                  top: 12.0,
                  bottom: 12.0,),
                child: const Text(
                  'Hiking',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                padding: const EdgeInsets.only(
                  left: 25.0,
                  right: 25.0,
                  top: 12.0,
                  bottom: 12.0,),
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
          Row(
            children: [
              Container(
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
                  children: [
                    Row(
                      children: [
                        Text(
                          'Need Help?',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Make an appoinment or chat with us',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                width: 315.0,
                height: 100.0,
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
                    left: 20.0,
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
                margin: const EdgeInsets.only(
                    left: 20.0,
                    right: 20.0
                ),
                child: Card(
                  elevation: 5.0,
                  shadowColor: Colors.black,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(10)
                    ),
                  ),
                  child: Container(
                      width: 310.0,
                      height: 200.0,
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            child: Container(
                              width: 280.0,
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
                                                  'images/rate.png',
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
                                                  'images/rate.png',
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
                                                  'images/rate.png',
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
                                                  'images/rate.png',
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
                                                  'images/rate.png',
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
                                    right: 250.0,
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
    );
  }
}