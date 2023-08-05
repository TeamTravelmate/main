import 'package:flutter/material.dart';

class MedicalSupportGuidelines extends StatelessWidget {
  const MedicalSupportGuidelines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medical Support Guidelines'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildGuidelineItem(
            'Stay Calm',
            'Take a deep breath and try to remain as calm as possible. Assess the situation before taking action.',
          ),
          _buildGuidelineItem(
            'Call for Help',
            'Dial emergency services in your location (e.g., 911) and provide clear details about the medical emergency. Stay on the line until help arrives.',
          ),
          _buildGuidelineItem(
            'Check for Breathing and Pulse',
            'If the person is unresponsive, check for breathing and a pulse. If absent, begin CPR if you\'re trained to do so.',
          ),
          _buildGuidelineItem(
            'Control Bleeding',
            'Apply pressure to any wounds to control bleeding. Use a clean cloth or clothing to cover the wound.',
          ),
          _buildGuidelineItem(
            'Don\'t Give Food or Drink',
            'Avoid giving food or drink to an unconscious person as it may cause choking.',
          ),
          _buildGuidelineItem(
            'Keep the Person Comfortable',
            'Loosen tight clothing and keep the person warm and comfortable until help arrives.',
          ),
        ],
      ),
    );
  }

  Widget _buildGuidelineItem(String title, String description) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(
          Icons.circle,
          size: 12,
          color: Colors.red, // Customize the bullet point color here
        ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
      ),
    );
  }
}
