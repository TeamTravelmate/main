import 'package:flutter/material.dart';
import 'package:main/UIs/screens/emergency_support/contacts.dart';
import 'package:main/UIs/screens/emergency_support/guidelines.dart';
import 'package:main/UIs/screens/emergency_support/sos_confirmed.dart';
import 'package:main/UIs/screens/emergency_support/emergency_support_home.dart'; 
import 'package:url_launcher/url_launcher.dart';

class Options extends StatelessWidget {
  const Options({Key? key}) : super(key: key);

  Future<void> _makePhoneCall(String number) async {
    if (await canLaunch(number)) {
      await launch(number);
    } else {
      throw 'Could not launch $number';
    }
  }

  Future<void> _showSOSConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm SOS Request'),
          content: Text('Are you sure you want to send an SOS request?'),
          actions: <Widget>[
            TextButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
            ),
            TextButton(
              child: Text('Yes'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SOS_Confirmed(),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
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
                  Icon(Icons.notifications),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: 350,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
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
                      'Thalapathpitiya Road, Galle',
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
              // Replace your InkWell widget with this one to show the confirmation dialog
              InkWell(
                onTap: () {
                  _showSOSConfirmationDialog(context);
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
              // First Row of Support Cards

              Row(
                children: [
                  Expanded(
                    child: SupportCard(
                      icon: Icons.phone,
                      label: '119 Police Emergency',
                      onTap: () {
                        _makePhoneCall('tel:119');
                      },
                    ),
                  ),
                  Expanded(
                    child: SupportCard(
                      icon: Icons.phone,
                      label: '1919 Suwa Seriya',
                      onTap: () {
                        _makePhoneCall('tel:1919');
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              // Second Row of Support Cards
              Row(
                children: [
                  Expanded(
                    child: SupportCard(
                      icon: Icons.phone,
                      label: '118 Help Desk',
                      onTap: () {
                        _makePhoneCall('tel:118');
                      },
                    ),
                  ),
                  Expanded(
                    child: SupportCard(
                      icon: Icons.phone,
                      label: '110 Fire and Rescue',
                      onTap: () {
                        _makePhoneCall('tel:110');
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
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
                                  color: Colors.white,
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
                                          builder: (context) =>  Contacts(),
                                        ),
                                      );
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(16),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.record_voice_over_sharp,
                                            size: 36,
                                            color: Colors.black,
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            'Contacts',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
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
                                  color: Colors.white,
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
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.info_sharp,
                                            size: 36,
                                            color: Colors.black,
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            'Guide',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
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
