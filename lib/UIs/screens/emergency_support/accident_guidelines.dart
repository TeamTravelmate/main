import 'package:flutter/material.dart';

class AccidentGuidelines extends StatelessWidget {
  const AccidentGuidelines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accident Guidelines'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildGuidelineItem(
            'Ensure Safety',
            'First, ensure your safety and the safety of others at the scene. Move to a safe location if necessary.',
          ),
          _buildGuidelineItem(
            'Call for Help',
            'Dial emergency services and report the accident. Provide clear details about the location and the number of injured persons.',
          ),
          _buildGuidelineItem(
            'Do Not Move Seriously Injured People',
            'If someone is seriously injured, do not move them unless they are in immediate danger (e.g., fire).',
          ),
          _buildGuidelineItem(
            'Render First Aid',
            'If you have first aid knowledge, provide necessary assistance to injured individuals without jeopardizing your own safety.',
          ),
          _buildGuidelineItem(
            'Preserve the Scene',
            'If possible, avoid moving or altering the accident scene until the authorities arrive.',
          ),
          _buildGuidelineItem(
            'Exchange Information',
            'Exchange contact and insurance information with other involved parties. If possible, take photos of the scene for documentation.',
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
