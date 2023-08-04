// import 'package:emergency_support/pages/options.dart';
import 'package:flutter/material.dart';

class Contacts extends StatelessWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to the Options screen when the back arrow is pressed
            Navigator.pop(context);
          },
        ),
        title: Text('Emergency Contacts'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Implement the "Add" functionality here
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              // Search bar
              Container(
                width: 350,
                height: 50,
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
                    Icon(Icons.search),
                    SizedBox(width: 40),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration.collapsed(
                          hintText: 'Search',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Contacts cards
              Expanded(
                child: ListView.builder(
                  itemCount: 5, // Replace with your actual number of contacts
                  itemBuilder: (context, index) {
                    return ContactCard(
                      name: 'Aruni Shanthini', // Replace with contact name
                      imagePath:
                          'assets/img/water.png', // Replace with contact image path
                      phoneNumber:
                          '123456789', // Replace with contact phone number
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  final String name;
  final String imagePath;
  final String phoneNumber;

  const ContactCard({
    required this.name,
    required this.imagePath,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(12),
      child: Row(
        children: [
          IconButton(
            icon: Image.asset(
              imagePath,
              width: 50,
              height: 50,
            ),
            onPressed: () {
              // Implement contact button functionality here
              // You can add more details or actions for the contact
            },
          ),
          SizedBox(width: 20),
          Text(
            name,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 60),
          IconButton(
            icon: Image.asset(
              'assets/img/phone.png',
              width: 20,
              height: 20,
            ),
            onPressed: () {
              // Implement phone button functionality here
              // You can add actions like making a phone call
            },
          ),
          IconButton(
            icon: Image.asset(
              'assets/img/comment.png',
              width: 20,
              height: 20,
            ),
            onPressed: () {
              // Implement comment button functionality here
              // You can add actions for sending messages, etc.
            },
          ),
        ],
      ),
    );
  }
}
