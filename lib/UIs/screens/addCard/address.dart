import 'package:main/UIs/screens/addCard/paycard.dart';
import 'package:flutter/material.dart';

class Address extends StatelessWidget {
  const Address({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Card(
              margin: EdgeInsets.only(
                  top: 45.0,
                  bottom: 30
              ),
              elevation: 5.0,
              shadowColor: Colors.black,
              child: Container(
                padding: EdgeInsets.only(
                    left: 20.0,
                    top: 15.0,
                    bottom: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.arrow_back_ios),
                    SizedBox(width: 35.0,),
                    Text(
                      'Adding Shipping Address',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Form(
              child: Column(
                children: [
                  Card(
                      margin: EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                          bottom: 15.0
                      ),
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 15,
                            right: 15,
                            top: 5,
                            bottom: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: 'Full name',
                              border: InputBorder.none
                          ),
                        ),
                      )

                  ),
                  Card(
                      margin: EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                          bottom: 15.0
                      ),
                      child: Container(
                          width: 320,
                          height: 60,
                          padding: EdgeInsets.only(
                              left: 15,
                              right: 15,
                              top: 10,
                              bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Address',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey
                                ),
                              ),
                              Text(
                                '3 Newbridge Court',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black
                                ),
                              )
                            ],
                          )
                      )

                  ),
                  Card(
                      margin: EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                          bottom: 15.0
                      ),
                      child: Container(
                          width: 320,
                          height: 60,
                          padding: EdgeInsets.only(
                              left: 15,
                              right: 15,
                              top: 10,
                              bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'City',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey
                                ),
                              ),
                              Text(
                                'Chino Hills',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black
                                ),
                              )
                            ],
                          )
                      )

                  ),
                  Card(
                      margin: EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                          bottom: 15.0
                      ),
                      child: Container(
                          width: 320,
                          height: 60,
                          padding: EdgeInsets.only(
                              left: 15,
                              right: 15,
                              top: 10,
                              bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'State/Province/Region',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey
                                ),
                              ),
                              Text(
                                'California',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black
                                ),
                              )
                            ],
                          )
                      )

                  ),
                  Card(
                      margin: EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                          bottom: 15.0
                      ),
                      child: Container(
                          width: 320,
                          height: 60,
                          padding: EdgeInsets.only(
                              left: 15,
                              right: 15,
                              top: 10,
                              bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Zip Code (Postal Code)',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey
                                ),
                              ),
                              Text(
                                '90709',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black
                                ),
                              )
                            ],
                          )
                      )

                  ),
                  Card(
                      margin: EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                          bottom: 15.0
                      ),
                      child: Container(
                          width: 320,
                          height: 60,
                          padding: EdgeInsets.only(
                              left: 15,
                              right: 15,
                              top: 10,
                              bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Country',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'California',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black
                                    ),
                                  ),
                                  Icon(Icons.arrow_forward_ios_rounded)
                                ],
                              )
                            ],
                          )
                      )

                  ),
                ],
              ),
            ),
            Container(
                width: 250,
                margin: EdgeInsets.all(20.0),
                padding: EdgeInsets.only(
                    top: 5.0,
                    left: 40,
                    bottom: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFF0C1C33),
                ),
                child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  PayCard()
                          )
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
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: 18.0
                          ),
                          child: Text(
                            'Save Address',
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    )
                )
            )
          ],
        ),
      ),
    );
  }
}