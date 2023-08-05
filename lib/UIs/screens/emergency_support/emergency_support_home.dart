import 'package:flutter/material.dart';
import 'package:main/UIs/screens/emergency_support/options.dart';

class EmergencySupportHome extends StatefulWidget {
  const EmergencySupportHome({Key? key}) : super(key: key);

  @override
  _EmergencySupportHomeState createState() => _EmergencySupportHomeState();
}

class _EmergencySupportHomeState extends State<EmergencySupportHome> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                // Greetings row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 350,
                  height: 50,
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
                      Icon(Icons.search),
                      SizedBox(width: 40),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration.collapsed(
                            hintText: 'Search for a place...',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Map container takes up the remaining space
                // Expanded(
                //   child: Container(
                //     color: Colors.white,
                //     // Your map widget goes here
                //   ),
                // ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: isExpanded ? 500 : 250,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 40,
                        height: 4,
                        color: Colors.grey, // Grey line at the top
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Emergency Support',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: SupportCard(
                              icon: Icons.local_gas_station,
                              label: 'Gas Stations Near Me',
                            ),
                          ),
                          Expanded(
                            child: SupportCard(
                              icon: Icons.local_hospital,
                              label: 'Hospitals Near Me',
                            ),
                          ),
                          Expanded(
                            child: SupportCard(
                              icon: Icons.local_police,
                              label: 'Police Stations Near Me',
                            ),
                          ),
                        ],
                      ),
                      // Add some space between the support cards and "In Case of Emergency"
                      SizedBox(height: 40),
                      Text(
                        'In Case of Emergency',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 10),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigate to Guidelines page when the button is pressed
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Options()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            onPrimary: Colors.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                          ),
                          child: Text(
                            'Tap Here',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SupportCard extends StatelessWidget {
  final IconData icon;
  final String label;

  const SupportCard({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
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
    );
  }
}

// class Options extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Your UI for the options screen goes here
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Options'),
//       ),
//       body: Center(
//         child: Text('Options Screen'),
//       ),
//     );
//   }
// }
