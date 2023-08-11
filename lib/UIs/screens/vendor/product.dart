import 'package:flutter/material.dart';
import 'package:main/UIs/screens/vendor/cart.dart';


class Product extends StatefulWidget {
  @override
  State<Product> createState() => ProductState();
}

class ProductState extends State<Product>{
  int _counter1 = 0;
  int _counter2 = 0;
  void _incrementCounter1() {
    setState(() {
      _counter1++;
    });
  }
  void _decrementCounter1() {
    setState(() {
      _counter1--;
    });
  }
  void _incrementCounter2() {
    setState(() {
      _counter2++;
    });
  }
  void _decrementCounter2() {
    setState(() {
      _counter2--;
    });
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 400.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/img/tent2.jpg'),
                      fit: BoxFit.fill
                  )
              ),
            ),

            Container(
              margin: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  top: 10.0,
                  bottom: 5.0
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tent',
                    style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.black
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'Rs. 300',
                    style: TextStyle(
                        fontSize: 25.0,
                        color: Color(0xff2FACBB)
                    ),
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Availablity',
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'In Stock',
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.green
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
                  bottom: 10.0
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Rating',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            top: 5.0,
                            right: 0.2,
                          ),
                          width: 15.0,
                          height: 15.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  'assets/img/rate.png',
                                ),
                                fit: BoxFit.cover
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            top: 5.0,
                            right: 0.2,
                          ),
                          width: 15.0,
                          height: 15.0,
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
                            right: 0.2,
                          ),
                          width: 15.0,
                          height: 15.0,
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
                            right: 0.2,
                          ),
                          width: 15.0,
                          height: 15.0,
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
                          width: 15.0,
                          height: 15.0,
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
              margin: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Divider(
                    color: Colors.grey,
                  )
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  bottom: 5
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Quantity',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black
                    ),
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
                            height: 40.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade300,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(
                                    Icons.remove,
                                    color: Colors.black,
                                  ),
                                  onPressed: _decrementCounter2,
                                ),
                                SizedBox(width: 8,),
                                Container(
                                  width: 38,
                                  height: 39,
                                  padding: EdgeInsets.only(
                                      top: 8
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(5)),
                                      color: Colors.white
                                  ),
                                  child: Text(
                                    '$_counter2',
                                    style: TextStyle(fontSize: 20.0),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(width: 8,),
                                IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.black,
                                  ),
                                  alignment: Alignment.center,
                                  onPressed: _incrementCounter2,
                                ),
                              ],
                            )
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.black
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'Rs. 300',
                    style: TextStyle(
                        fontSize: 25.0,
                        color: Color(0xff2FACBB)
                    ),
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              alignment: Alignment.center,


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
                                  builder: (context) =>  Cart())
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          onPrimary: Colors.white,
                          primary: Color(0xff2FACBB),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5), // Adjust the radius here
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                margin: EdgeInsets.all(5.0),
                                width: 20.0,
                                height: 20.0,
                                child: Icon(Icons.shopping_cart_outlined)
                            ),

                            Container(
                              margin: EdgeInsets.only(
                                  right: 26.0
                              ),
                              child: Text(
                                'Add to cart',
                                style: TextStyle(
                                    fontSize: 20
                                ),
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