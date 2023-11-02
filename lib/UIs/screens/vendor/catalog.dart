import 'package:flutter/material.dart';
import 'package:main/UIs/screens/vendor/product.dart';

class Catalog extends StatelessWidget{
  const Catalog({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Card(
              elevation: 4.0,
              color: Colors.white,
              margin: EdgeInsets.only(
                top: 50.0,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.arrow_back_ios_new_outlined),
                    Text(
                      'Camping Tent',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Icon(Icons.search),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: 20.0,
                  ),
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Catalog',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Container(
                  width: 55.0,
                  height: 55.0,
                  margin: EdgeInsets.only(
                      right: 10.0
                  ),
                  padding: EdgeInsets.all(10.0),
                  child: Image(
                    image: AssetImage('assets/img/filter.png'),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 170.0,
                  height: 160.0,
                  margin: const EdgeInsets.only(
                      left: 20.0,
                      right: 10.0,
                      bottom: 10.0),
                  child: Card(
                    elevation: 5.0,
                    shadowColor: Colors.black,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(10)
                      ),
                    ),
                    child: Container(
                        alignment: Alignment(0.0,0.0),
                        padding: const EdgeInsets.all(6.0),
                        child: Column(
                          children: [
                            GestureDetector(
                              child: Container(
                                width: 130.0,
                                height: 90.0,
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
                                        builder: (context) =>  Product()));
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      right: 55.0
                                  ),
                                  child: Text(
                                    'Tents',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                )
                            
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      right: 10.0
                                  ),
                                  child: Text(
                                    'Rs. 850',
                                    style: TextStyle(
                                      color: Color(0xff2FACBB),
                                      fontSize: 12.0,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Container(
                                  width: 15.0,
                                  height: 15.0,
                                  margin: EdgeInsets.only(
                                    left: 60.0,
                                  ),
                                  child: Image(
                                    image: AssetImage('assets/img/cart.png'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )

                    ),
                  ),
                ),
                Container(
                  width: 170.0,
                  height: 160.0,
                  margin: const EdgeInsets.only(
                      left: 20.0,
                      right: 10.0,
                      bottom: 10.0),
                  child: Card(
                    elevation: 5.0,
                    shadowColor: Colors.black,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(10)
                      ),
                    ),
                    child: Container(
                        alignment: Alignment(0.0,0.0),
                        padding: const EdgeInsets.all(6.0),
                        child: Column(
                          children: [
                            GestureDetector(
                              child: Container(
                                width: 130.0,
                                height: 90.0,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10)
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/img/tent1.jpg',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>  Product()));
                              },
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      right: 55.0
                                  ),
                                  child: Text(
                                    'Tents',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                )

                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      right: 10.0
                                  ),
                                  child: Text(
                                    'Rs. 850',
                                    style: TextStyle(
                                      color: Color(0xff2FACBB),
                                      fontSize: 12.0,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Container(
                                  width: 15.0,
                                  height: 15.0,
                                  margin: EdgeInsets.only(
                                    left: 60.0,
                                  ),
                                  child: Image(
                                    image: AssetImage('assets/img/cart.png'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )

                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 170.0,
                  height: 160.0,
                  margin: const EdgeInsets.only(
                      left: 20.0,
                      right: 10.0,
                      bottom: 10.0),
                  child: Card(
                    elevation: 5.0,
                    shadowColor: Colors.black,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(10)
                      ),
                    ),
                    child: Container(
                        alignment: Alignment(0.0,0.0),
                        padding: const EdgeInsets.all(6.0),
                        child: Column(
                          children: [
                            GestureDetector(
                              child: Container(
                                width: 130.0,
                                height: 90.0,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10)
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/img/tent2.jpg',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>  Product()));
                              },
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      right: 55.0
                                  ),
                                  child: Text(
                                    'Tents',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                )

                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      right: 10.0
                                  ),
                                  child: Text(
                                    'Rs. 4500',
                                    style: TextStyle(
                                      color: Color(0xff2FACBB),
                                      fontSize: 12.0,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Container(
                                  width: 15.0,
                                  height: 15.0,
                                  margin: EdgeInsets.only(
                                    left: 60.0,
                                  ),
                                  child: Image(
                                    image: AssetImage('assets/img/cart.png'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )

                    ),
                  ),
                ),
                Container(
                  width: 170.0,
                  height: 160.0,
                  margin: const EdgeInsets.only(
                      left: 20.0,
                      right: 10.0,
                      bottom: 10.0),
                  child: Card(
                    elevation: 5.0,
                    shadowColor: Colors.black,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(10)
                      ),
                    ),
                    child: Container(
                        alignment: Alignment(0.0,0.0),
                        padding: const EdgeInsets.all(6.0),
                        child: Column(
                          children: [
                            GestureDetector(
                              child: Container(
                                width: 130.0,
                                height: 90.0,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10)
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/img/tent3.jpg',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>  Product()));
                              },
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      right: 55.0
                                  ),
                                  child: Text(
                                    'Tents',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                )

                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      right: 10.0
                                  ),
                                  child: Text(
                                    'Rs. 1500',
                                    style: TextStyle(
                                      color: Color(0xff2FACBB),
                                      fontSize: 12.0,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Container(
                                  width: 15.0,
                                  height: 15.0,
                                  margin: EdgeInsets.only(
                                    left: 60.0,
                                  ),
                                  child: Image(
                                    image: AssetImage('assets/img/cart.png'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )

                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 170.0,
                  height: 160.0,
                  margin: const EdgeInsets.only(
                      left: 20.0,
                      right: 10.0,
                      bottom: 10.0),
                  child: Card(
                    elevation: 5.0,
                    shadowColor: Colors.black,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(10)
                      ),
                    ),
                    child: Container(
                        alignment: Alignment(0.0,0.0),
                        padding: const EdgeInsets.all(6.0),
                        child: Column(
                          children: [
                            GestureDetector(
                              child: Container(
                                width: 130.0,
                                height: 90.0,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10)
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/img/tent4.jpg',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>  Product()));
                              },
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      right: 55.0
                                  ),
                                  child: Text(
                                    'Tents',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                )

                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      right: 10.0
                                  ),
                                  child: Text(
                                    'Rs. 2000',
                                    style: TextStyle(
                                      color: Color(0xff2FACBB),
                                      fontSize: 12.0,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Container(
                                  width: 15.0,
                                  height: 15.0,
                                  margin: EdgeInsets.only(
                                    left: 60.0,
                                  ),
                                  child: Image(
                                    image: AssetImage('assets/img/cart.png'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )

                    ),
                  ),
                ),
                Container(
                  width: 170.0,
                  height: 160.0,
                  margin: const EdgeInsets.only(
                      left: 20.0,
                      right: 10.0,
                      bottom: 10.0),
                  child: Card(
                    elevation: 5.0,
                    shadowColor: Colors.black,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(10)
                      ),
                    ),
                    child: Container(
                        alignment: Alignment(0.0,0.0),
                        padding: const EdgeInsets.all(6.0),
                        child: Column(
                          children: [
                            GestureDetector(
                              child: Container(
                                width: 130.0,
                                height: 90.0,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10)
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/img/tent5.jpg',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>  Product()));
                              },
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      right: 55.0
                                  ),
                                  child: Text(
                                    'Tents',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                )

                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      right: 10.0
                                  ),
                                  child: Text(
                                    'Rs. 1050',
                                    style: TextStyle(
                                      color: Color(0xff2FACBB),
                                      fontSize: 12.0,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Container(
                                  width: 15.0,
                                  height: 15.0,
                                  margin: EdgeInsets.only(
                                    left: 60.0,
                                  ),
                                  child: Image(
                                    image: AssetImage('assets/img/cart.png'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )

                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

    );

  }
}