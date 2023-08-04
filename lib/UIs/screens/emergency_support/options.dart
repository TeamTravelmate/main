import 'package:flutter/material.dart';
import 'package:main/UIs/screens/emergency_support/contacts.dart';
import 'package:main/UIs/screens/emergency_support/guidelines.dart';
import 'package:main/UIs/screens/emergency_support/sos_confirmed.dart';
import 'emergency_support_home.dart'; // Replace 'emergency_support_home.dart' with the correct path to your EmergencySupportHome class

class Options extends StatelessWidget {
  const Options({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Options'),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            // Navigate back to the EmergencySupportHome UI when the back arrow is pressed
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              // Greetings row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hi, Jame!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Notification
                  Icon(Icons.notifications),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              // Search bar
              //

              Container(
                width: 350,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Shadow color
                      spreadRadius: 5, // The spread radius of the shadow
                      blurRadius: 7, // The blur radius of the shadow
                      offset: Offset(0,
                          3), // The position of the shadow offset from the widget
                    ),
                  ],
                ),
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Icon(Icons.location_pin),
                    SizedBox(width: 15),
                    Text(
                      'Thalapathpitiya Road,Galle',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Emergency Help Needed?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SOS_Confirmed()),
                  );
                },
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/img/megaphone.png',
                        width: 50,
                        height: 50,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'S.O.S.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),

              // InkWell(
              //   onTap: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //           builder: (context) => const SOS_Confirmed()),
              //     );
              //   },
              //   borderRadius: BorderRadius.circular(20),
              //   child: Container(
              //     padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              //     decoration: BoxDecoration(
              //       color: Colors.grey,
              //       borderRadius: BorderRadius.circular(40),
              //     ),
              //     child: Row(
              //       mainAxisSize: MainAxisSize.min,
              //       children: [
              //         // Icon(Icons.phone),
              //         Image.asset(
              //           'assets/img/phone-call.png',
              //           width: 50,
              //           height: 50,
              //         ),
              //         SizedBox(width: 8),
              //         Text(
              //           '119 Police Emergency',
              //           style: TextStyle(
              //             color: Colors.white,
              //             fontSize: 20,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),

              Container(
                width: 350,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Shadow color
                      spreadRadius: 5, // The spread radius of the shadow
                      blurRadius: 7, // The blur radius of the shadow
                      offset: Offset(0,
                          3), // The position of the shadow offset from the widget
                    ),
                  ],
                ),
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Icon(Icons.phone),
                    SizedBox(width: 40),
                    Text(
                      '119 Police Emergency',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 350,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Shadow color
                      spreadRadius: 5, // The spread radius of the shadow
                      blurRadius: 7, // The blur radius of the shadow
                      offset: Offset(0,
                          3), // The position of the shadow offset from the widget
                    ),
                  ],
                ),
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Icon(Icons.phone),
                    SizedBox(width: 40),
                    Text(
                      '1919 Suwa Seriya',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 350,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Shadow color
                      spreadRadius: 5, // The spread radius of the shadow
                      blurRadius: 7, // The blur radius of the shadow
                      offset: Offset(0,
                          3), // The position of the shadow offset from the widget
                    ),
                  ],
                ),
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Icon(Icons.phone),
                    SizedBox(width: 40),
                    Text(
                      '118 National Help Desk',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              // Emergency support container

              // Text(
              //   'Pick the Support',
              //   style: TextStyle(
              //     fontWeight: FontWeight.bold,
              //     fontSize: 20,
              //   ),
              // ),

              // Row of cards 1 (Phone Call Icon and 1990 Suwa Seriya)
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Container(
              //       width: 200, // Adjust the width as needed
              //       height: 120, // Adjust the height as needed
              //       child: SupportCard(
              //         icon: Icons.phone,
              //         label: '1990 Suwa Seriya',
              //         onTap: () {
              //           // Handle onTap action for this card
              //         },
              //       ),
              //     ),
              //     SizedBox(width: 8), // Adjust the spacing between cards
              //   ],
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Container(
              //       width: 120, // Adjust the width as needed
              //       height: 120, // Adjust the height as needed
              //       child: SupportCard(
              //         icon: Icons.phone,
              //         label: '1990 Suwa Seriya',
              //         onTap: () {
              //           // Handle onTap action for this card
              //         },
              //       ),
              //     ),
              //     SizedBox(width: 8), // Adjust the spacing between cards
              //   ],
              // ),

              SizedBox(height: 16), // Adjust the spacing between rows

              // // Row of cards 2 (Placeholder for additional cards if needed)
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     // Add your third card here
              //     SupportCard(
              //       icon: Icons.phone,
              //       label: 'Third Card',
              //       onTap: () {
              //         // Handle onTap action for this card
              //       },
              //     ),
              //     SizedBox(width: 8), // Adjust the spacing between cards
              //     // Add your fourth card here
              //     SupportCard(
              //       icon: Icons.phone,
              //       label: 'Fourth Card',
              //       onTap: () {
              //         // Handle onTap action for this card
              //       },
              //     ),
              //   ],
              // ),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors
                                      .white, // Change this to the desired background color
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const Contacts(),
                                        ),
                                      );
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(16),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.record_voice_over_sharp,
                                            size: 36,
                                            color: Colors
                                                .black, // Customize the icon color
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            'Contacts',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors
                                                  .black, // Customize the text color
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors
                                      .white, // Change this to the desired background color
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Guidelines(),
                                        ),
                                      );
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(16),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.info_sharp,
                                            size: 36,
                                            color: Colors
                                                .black, // Customize the icon color
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            'Guide',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors
                                                  .black, // Customize the text color
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors
                                      .white, // Change this to the desired background color
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.emergency_recording_sharp,
                                        size: 36,
                                        color: Colors
                                            .black, // Customize the icon color
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        'Record',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors
                                              .black, // Customize the text color
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SupportCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const SupportCard({required this.icon, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 40),
              SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
