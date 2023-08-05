import 'package:flutter/material.dart';
import 'package:main/UIs/screens/vendor/home_page.dart';

class Success extends StatelessWidget {
  const Success({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(''
                        'assets/img/camp.jpg'
                    ),
                    opacity: 0.7,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                color: Color(0xFF0C1C33).withOpacity(0.6),
              ),
              Center(
                child: Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0))
                    ),
                    child: Container(
                      margin: EdgeInsets.only(
                          top: 20.0,
                          bottom: 15.0,
                          left: 20.0,
                          right: 20.0
                      ),
                      padding: EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 45.0,
                            height: 45.0,
                            margin: EdgeInsets.only(
                                top: 30.0,
                                bottom: 20.0
                            ),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/img/tick.png'),
                                  fit: BoxFit.cover,
                                ),
                                shape: BoxShape.circle
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0,
                                right: 8.0,
                                top: 20.0),
                            child: Text(
                              'Order Successfully',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: Color(0xFF0C1C33)
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0,
                                right: 8.0,
                                bottom: 10.0),
                            child: Text(
                              'Placed',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: Color(0xFF0C1C33)
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0,
                                right: 8.0),
                            child: Text(
                              'Your payment was successful!',
                              style: TextStyle(
                                  color: Color(0xFF0C1C33),
                                  fontSize: 15.0
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0,
                                right: 8.0),
                            child: Text(
                              'You will get your order shortly.',
                              style: TextStyle(
                                  color: Color(0xFF0C1C33),
                                  fontSize: 15.0
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0,
                                right: 8.0,
                                bottom: 40.0),
                            child: Text(
                              'Enjoy your trip in Sri Lanka!',
                              style: TextStyle(
                                  color: Color(0xFF0C1C33),
                                  fontSize: 15.0
                              ),
                            ),
                          ),
                          Container(
                            width: 200, // Custom width
                            height: 50, // Custom height
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const HomePage())
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
                                          left: 18.0
                                      ),
                                      child: Text(
                                        'Continue Shopping',
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
                ),
              )
            ],
          )
      ),
    );
  }
}