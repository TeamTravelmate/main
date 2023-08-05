
import 'package:flutter/material.dart';
import 'package:main/UIs/screens/emergency_support/accident_guidelines.dart';
import 'package:main/UIs/screens/emergency_support/medical_support_guidelines.dart';
import 'package:main/UIs/screens/emergency_support/natural_disaster_guidelines.dart';
import 'options.dart'; // Import the Options class

class Guidelines extends StatelessWidget {
  const Guidelines({Key? key}) : super(key: key);

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
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              // Greetings row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Guidelines',
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
              Text(
                'Please choose the emergency',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    EmergencyCard(
                      emoji: '🚑',
                      title: 'Medical Support',
                      onPressed: () {
                        // Navigate to Medical Support Guidelines page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const MedicalSupportGuidelines(),
                          ),
                        );
                      },
                    ),
                    EmergencyCard(
                      emoji: '🚨',
                      title: 'Accident',
                      onPressed: () {
                        // Navigate to Accident Guidelines page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AccidentGuidelines(),
                          ),
                        );
                      },
                    ),
                    EmergencyCard(
                      emoji: String.fromCharCode(0x26A1), // Thunder emoji (⚡)
                      title: 'Natural Disaster',
                      onPressed: () {
                        // Navigate to Natural Disaster Guidelines page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NaturalDisasterGuidelines(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EmergencyCard extends StatelessWidget {
  final String emoji;
  final String title;
  final VoidCallback onPressed;

  const EmergencyCard({
    required this.emoji,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Text(
                emoji,
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Icon(Icons.arrow_forward),
            ],
          ),
        ),
      ),
    );
  }
}
