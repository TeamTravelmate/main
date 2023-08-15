import 'package:flutter/material.dart';

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
                          'Update Product',
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
                      left: 20.0,
                      right: 20.0,
                      top: 10.0,
                      bottom: 10.0
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Add delivery method',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(
                      left: 20.0,
                      right: 20.0
                  ),

                  child: Row(
                    children: [
                      Card(
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
                      SizedBox(width: 20.0,),
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
                      SizedBox(width: 50.0,),
                      Text(
                        'Add',
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold
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
                    children: [
                      Text(
                        'My Products',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      )
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
                                height: 130.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('assets/img/tent3.jpg'),
                                        fit: BoxFit.cover
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(5.0))
                                ),
                              ),
                              SizedBox(height: 20.0,),
                              Text(
                                'View Reviews',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline
                                ),
                              )
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
                                        'Color: Black     Size: ',
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
                                            fontSize: 15.0
                                        ),
                                      ),
                                      Switch(
                                        onChanged: (bool? newValue) {
                                          setState(() {
                                            isSwitched  = newValue ?? false;
                                          });
                                        },
                                        value: isSwitched,
                                        activeColor: Colors.green,
                                        activeTrackColor: Colors.grey,
                                        inactiveThumbColor: Colors.redAccent,
                                        inactiveTrackColor: Colors.grey,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
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
                                  margin: EdgeInsets.only(
                                      left: 140.0,
                                      bottom: 10.0
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(
                                          top: 5.0,
                                        ),
                                        width: 10.0,
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
                                        width: 10.0,
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
                                        width: 10.0,
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
                                        width: 10.0,
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
                                        width: 10.0,
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
                                height: 130.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('assets/img/pillow.jpg'),
                                        fit: BoxFit.cover
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(5.0))
                                ),
                              ),
                              SizedBox(height: 20.0,),
                              Text(
                                'View Reviews',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline
                                ),
                              )
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
                                        'Color: Blue     Size: ',
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
                                            fontSize: 15.0
                                        ),
                                      ),
                                      Switch(
                                        onChanged: (bool? newValue) {
                                          setState(() {
                                            isSwitched2  = newValue ?? false;
                                          });
                                        },
                                        value: isSwitched2,
                                        activeColor: Colors.green,
                                        activeTrackColor: Colors.grey,
                                        inactiveThumbColor: Colors.redAccent,
                                        inactiveTrackColor: Colors.grey,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
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
                                  margin: EdgeInsets.only(
                                      left: 140.0,
                                      bottom: 10.0
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(
                                          top: 5.0,
                                        ),
                                        width: 10.0,
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
                                        width: 10.0,
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
                                        width: 10.0,
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
                                        width: 10.0,
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
                                        width: 10.0,
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
                )
              ],
            ),
          ),
        )
    );
  }
}