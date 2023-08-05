import 'package:flutter/material.dart';

class NaturalDisasterGuidelines extends StatelessWidget {
  const NaturalDisasterGuidelines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Natural Disaster Guidelines'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildGuidelineItem(
            'Earthquake',
            [
              'Drop, Cover, and Hold On: When indoors, seek cover under a sturdy piece of furniture and hold on until shaking stops.',
              'Stay Indoors: If outside, move to an open area away from buildings, trees, streetlights, and utility wires.',
              'Be Prepared for Aftershocks: Aftershocks may follow the main earthquake, so be ready to take cover again.',
            ],
          ),
          _buildGuidelineItem(
            'Hurricane/Typhoon',
            [
              'Evacuate if Instructed: Follow evacuation orders and move to designated shelters or safer areas.',
              'Secure Property: Board up windows and secure loose objects that may become projectiles in strong winds.',
              'Avoid Flooded Areas: Stay away from floodwaters, as they can be dangerous and carry debris.',
            ],
          ),
          _buildGuidelineItem(
            'Wildfire',
            [
              'Evacuate Early: If you\'re in an area threatened by wildfire, evacuate early to a safer location.',
              'Cover Face and Nose: If caught in smoke, cover your face and nose with a cloth to avoid inhaling harmful smoke.',
              'Do Not Return Prematurely: Wait for authorities to announce it\'s safe to return home after a wildfire.',
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGuidelineItem(String title, List<String> steps) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ExpansionTile(
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: steps
                  .map(
                    (step) => _buildBulletPoint(step),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.circle,
            size: 8,
            color: Colors.red, // Customize the bullet point color here
          ),
          SizedBox(width: 8),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}
