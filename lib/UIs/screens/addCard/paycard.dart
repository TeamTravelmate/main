import 'package:flutter/material.dart';

class PayCard extends StatefulWidget  {
  @override
  PayCardState createState() => PayCardState();
}
class PayCardState extends State<PayCard> {
  bool _isChecked = false;
  bool _isChecked2 = false;
  // const PayCard({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Card(
              margin: EdgeInsets.only(
                  top: 45.0,
                  bottom: 10
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
                    SizedBox(width: 55.0,),
                    Text(
                      'Payment Methods',
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
                  left: 20,
                  right: 20,
                  top: 20),
              child: Row(
                children: [
                  Text(
                    'Your payment cards',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    ),
                  )
                ],
              ),
            ),
            Card(
              elevation: 2.0,
              shadowColor: Colors.black,
              margin: EdgeInsets.all(20.0),
              color: Color(0xFF222222),
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Positioned(
                    //   bottom: 0.0,
                    //   left: 0.0,
                    //   child: Container(
                    //     color: Colors.red,
                    //     child: CustomPaint(
                    //       painter: CustomContainerShapeBorder(
                    //         height: 100.0,
                    //         width: 300.0,
                    //         radius: 50.0,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 20,
                          top: 30,
                          bottom: 20),
                      width: 28,
                      height: 25,
                      child: Image(
                        image: AssetImage('assets/img/chip.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 100,
                          bottom: 20
                      ),
                      child: Row(
                        children: [
                          Text(
                            '**** **** **** 3947',
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.white
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Card Holder Name',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white
                                ),
                              ),
                              Text(
                                'Jennyfer Doe',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                ),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Expiry Date',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white
                                ),
                              ),
                              Text(
                                '05/23',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                width: 35,
                                height: 25,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('assets/img/mast.png'),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                              Text(
                                'mastercard',
                                style: TextStyle(
                                  fontSize: 6.0,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: 20,),
              child: Row(
                children: [
                  Checkbox(
                    activeColor: Color(0xFF0C1C33),
                    value: _isChecked, // This determines the state of the checkbox
                    onChanged: (bool? newValue) {
                      setState(() {
                        _isChecked = newValue ?? false; // Update the state of the checkbox when it's clicked
                      });
                    },
                  ),
                  Text(
                    'Use as default payment method',
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF0C1C33)
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 140,),
            Container(
              margin: EdgeInsets.only(
                left: 250,
              ),
              child: FloatingActionButton(
                backgroundColor: Color(0xFF0C1C33),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 29,
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30)
                      ),
                    ),
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      double screenHeight = MediaQuery.of(context).size.height;
                      double modalHeight = screenHeight * 0.8;
                      return SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15
                          ),
                          height: modalHeight,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Divider(
                                color: Colors.grey,
                                thickness: 4,
                                indent: 110,
                                endIndent: 110,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Add new card',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Card(
                                  child: Container(
                                    height: 65,
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
                                          hintText: 'Name on card',
                                          border: InputBorder.none
                                      ),
                                    ),
                                  )

                              ),
                              Card(
                                  child: Container(
                                      width: 320,
                                      height: 65,
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
                                            'Card number',
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '5546 8574 5698 3947',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  Container(
                                                    width: 20,
                                                    height: 15,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage('assets/img/mast.png'),
                                                            fit: BoxFit.cover
                                                        )
                                                    ),
                                                  ),
                                                  Text(
                                                    'mastercard',
                                                    style: TextStyle(
                                                      fontSize: 6.0,
                                                      color: Colors.black,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                  )

                              ),
                              Card(
                                  child: Container(
                                      width: 320,
                                      height: 65,
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
                                            'Expire Date',
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey
                                            ),
                                          ),
                                          Text(
                                            '05/23',
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
                                  child: Container(
                                      width: 320,
                                      height: 65,
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
                                            'CVV',
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '567',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black
                                                ),
                                              ),
                                              Container(
                                                width: 20,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage('assets/img/qm.png'),
                                                        fit: BoxFit.cover
                                                    )
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                  )

                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: 20,
                                bottom: 20),

                                child: Row(
                                  children: [
                                    Checkbox(
                                      activeColor: Color(0xFF0C1C33),
                                      value: _isChecked2, // This determines the state of the checkbox
                                      onChanged: (bool? newValue2) {
                                        setState(() {
                                          _isChecked2 = newValue2 ?? false; // Update the state of the checkbox when it's clicked
                                        });
                                      },
                                    ),
                                    Text(
                                      'Use as default payment method',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xFF0C1C33)
                                      ),
                                    )
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
                                                left: 28.0
                                            ),
                                            child: Text(
                                              'Add Card',
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
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}