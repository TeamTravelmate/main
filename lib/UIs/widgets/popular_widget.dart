import 'package:flutter/material.dart';
import '../themes/colors.dart';
// // ignore: camel_case_types
class popularTrips extends StatelessWidget {
  const popularTrips({
    super.key,
    required this.title,
    required this.imagePath,
    required this.path,
  });

  final String title;
  final String imagePath;
  final Widget path;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0, right: 10.0),
      child: Column(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              border: Border.all(width: 4, color: ColorsTravelMate.secundary),
              borderRadius: BorderRadius.circular(100),
            ),
            child: FloatingActionButton.large(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => path,
                  ),
                );
              },
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(
                  imagePath,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(title,
              style: const TextStyle(
                  fontSize: 12, color: ColorsTravelMate.primary)),
        ],
      ),
    );
  }
}
