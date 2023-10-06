import 'package:flutter/material.dart';
import 'package:main/UIs/screens/product/add.dart';

class Update extends StatefulWidget {
  @override
  UpdateState createState() => UpdateState();
}
class UpdateState extends State<Update> {

  get selectedOption => null;
  bool isSwitched = false;
  bool isSwitched2 = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: Column(
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.menu),
                        SizedBox(width: 80.0,),
                        Text(
                          'My Products',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: 10.0,
                      right: 160.0,
                      bottom: 10.0
                  ),
                  child: Text(
                    'Add Delivery Method',
                    style: TextStyle(
                        fontSize: 18.0,
                        // fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Container(
                  width: double.infinity,
                  // height: 60.0,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Card(
                        // margin: EdgeInsets.only(
                        //   left: 15.0,
                        // ),
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
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(
                          right: 5
                        ),
                        child: Text(
                          'Add',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 15
                          ),
                          textAlign: TextAlign.end,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      top: 10.0,
                      bottom: 10.0
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'My Products',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Add()
                              )
                          );
                        },
                        child: Text(
                          'Add',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.green
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 5.0,
                  shadowColor: Colors.black,
                  margin: EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      bottom: 10.0,
                      top: 5.0
                  ),
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('assets/img/tent3.jpg'),
                                        fit: BoxFit.cover
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(5.0))
                                ),
                              ),
                              SizedBox(height: 10.0,),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Ratings',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0
                                      ),
                                    )
                                  ],
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
                        SizedBox(width: 10.0,),
                        Expanded(
                            flex: 4,
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      bottom: 5.0
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Tent',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                        ),
                                      ),
                                      Text(
                                        'Rs. 400',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      bottom: 5.0,
                                      top: 2.0
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Color: ',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.grey
                                        ),
                                      ),
                                      Text(
                                        'Black',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.black
                                        ),
                                      ),
                                      SizedBox(width: 50,),
                                      Text(
                                        'Size: ',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.grey
                                        ),
                                      ),
                                      Text(
                                        'L',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.black
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 2.0,
                                      bottom: 15.0
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'In Stock',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green,
                                            fontSize: 15.0
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 30, // Custom height
                                        margin: EdgeInsets.only(
                                            top: 10.0
                                        ),
                                        child: ElevatedButton(
                                            onPressed: () {

                                            },
                                            style: ElevatedButton.styleFrom(
                                              onPrimary: Colors.white,
                                              primary: Color(0xff2FACBB).withOpacity(0.2),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(5), // Adjust the radius here
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                  child: Text(
                                                    'Edit Product',
                                                    style: TextStyle(
                                                        fontSize: 10.0,
                                                        color: Color(0xFF2FACBB),
                                                        fontWeight: FontWeight.w900
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                )
                                              ],
                                            )

                                        ),
                                      ),
                                      Container(
                                        height: 30, // Custom height
                                        margin: EdgeInsets.only(
                                          top: 10.0,
                                        ),
                                        child: ElevatedButton(
                                            onPressed: () {
                                            },
                                            style: ElevatedButton.styleFrom(
                                              primary: Color(0xFFE40F16).withOpacity(0.2),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(5), // Adjust the radius here
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                  child: Text(
                                                    'Remove Product',
                                                    style: TextStyle(
                                                        fontSize: 10.0,
                                                        color: Color(0xFFE40F16),
                                                        fontWeight: FontWeight.bold
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
                                ),
                              ],
                            )
                        )

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                Card(
                  elevation: 5.0,
                  shadowColor: Colors.black,
                  margin: EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      bottom: 10.0,
                      top: 5.0
                  ),
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('assets/img/pillow.jpg'),
                                        fit: BoxFit.cover
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(5.0))
                                ),
                              ),
                              SizedBox(height: 10.0,),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Ratings',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0
                                      ),
                                    )
                                  ],
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
                        SizedBox(width: 10.0,),
                        Expanded(
                            flex: 4,
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      bottom: 5.0
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Pillow',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                        ),
                                      ),
                                      Text(
                                        'Rs. 300',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      bottom: 5.0,
                                      top: 2.0
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Color: ',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.grey
                                        ),
                                      ),
                                      Text(
                                        'Green',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.black
                                        ),
                                      ),
                                      SizedBox(width: 50,),
                                      Text(
                                        'Size: ',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.grey
                                        ),
                                      ),
                                      Text(
                                        'L',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.black
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 2.0,
                                      bottom: 15.0
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'In Stock',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green,
                                            fontSize: 15.0
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 30, // Custom height
                                        margin: EdgeInsets.only(
                                            top: 10.0
                                        ),
                                        child: ElevatedButton(
                                            onPressed: () {

                                            },
                                            style: ElevatedButton.styleFrom(
                                              onPrimary: Colors.white,
                                              primary: Color(0xff2FACBB).withOpacity(0.2),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(5), // Adjust the radius here
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                  child: Text(
                                                    'Edit Product',
                                                    style: TextStyle(
                                                        fontSize: 10.0,
                                                        color: Color(0xFF2FACBB),
                                                        fontWeight: FontWeight.w900
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                )
                                              ],
                                            )

                                        ),
                                      ),
                                      Container(
                                        height: 30, // Custom height
                                        margin: EdgeInsets.only(
                                          top: 10.0,
                                        ),
                                        child: ElevatedButton(
                                            onPressed: () {
                                            },
                                            style: ElevatedButton.styleFrom(
                                              primary: Color(0xFFE40F16).withOpacity(0.2),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(5), // Adjust the radius here
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                  child: Text(
                                                    'Remove Product',
                                                    style: TextStyle(
                                                        fontSize: 10.0,
                                                        color: Color(0xFFE40F16),
                                                        fontWeight: FontWeight.bold
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
                                ),
                              ],
                            )
                        )

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                Card(
                  elevation: 5.0,
                  shadowColor: Colors.black,
                  margin: EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      bottom: 10.0,
                      top: 5.0
                  ),
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('assets/img/tent2.jpg'),
                                        fit: BoxFit.cover
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(5.0))
                                ),
                              ),
                              SizedBox(height: 10.0,),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Ratings',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0
                                      ),
                                    )
                                  ],
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
                        SizedBox(width: 10.0,),
                        Expanded(
                            flex: 4,
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      bottom: 5.0
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Tent',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                        ),
                                      ),
                                      Text(
                                        'Rs. 400',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      bottom: 5.0,
                                      top: 2.0
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Color: ',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.grey
                                        ),
                                      ),
                                      Text(
                                        'Blue',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.black
                                        ),
                                      ),
                                      SizedBox(width: 50,),
                                      Text(
                                        'Size: ',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.grey
                                        ),
                                      ),
                                      Text(
                                        'XL',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.black
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 2.0,
                                      bottom: 15.0
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Out of Stock',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red,
                                            fontSize: 15.0
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 30, // Custom height
                                        margin: EdgeInsets.only(
                                            top: 10.0
                                        ),
                                        child: ElevatedButton(
                                            onPressed: () {

                                            },
                                            style: ElevatedButton.styleFrom(
                                              onPrimary: Colors.white,
                                              primary: Color(0xff2FACBB).withOpacity(0.2),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(5), // Adjust the radius here
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                  child: Text(
                                                    'Edit Product',
                                                    style: TextStyle(
                                                        fontSize: 10.0,
                                                        color: Color(0xFF2FACBB),
                                                        fontWeight: FontWeight.w900
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                )
                                              ],
                                            )

                                        ),
                                      ),
                                      Container(
                                        height: 30, // Custom height
                                        margin: EdgeInsets.only(
                                          top: 10.0,
                                        ),
                                        child: ElevatedButton(
                                            onPressed: () {
                                            },
                                            style: ElevatedButton.styleFrom(
                                              primary: Color(0xFFE40F16).withOpacity(0.2),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(5), // Adjust the radius here
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                  child: Text(
                                                    'Remove Product',
                                                    style: TextStyle(
                                                        fontSize: 10.0,
                                                        color: Color(0xFFE40F16),
                                                        fontWeight: FontWeight.bold
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
                                ),
                              ],
                            )
                        )

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}