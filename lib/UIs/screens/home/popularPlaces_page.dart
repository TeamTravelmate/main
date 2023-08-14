import 'package:flutter/material.dart';
import 'package:main/UIs/widgets/tripCard_widget.dart';
import '../../themes/colors.dart';
import '../profile/profile.dart';

// ignore: camel_case_types
class popularDestinations extends StatelessWidget {
  const popularDestinations({super.key, 
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
              'Popular Places',
            ),
        actions: [
          FloatingActionButton.small(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Profile(),
                  ),
                );
              },
              backgroundColor: ColorsTravelMate.secundary,
              child: Image.asset('assets/profile.png', height: 40, width: 40),
            ),
        ],
        backgroundColor: ColorsTravelMate.tertiary,
        foregroundColor: ColorsTravelMate.primary,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Text(
              'Nuwara Eliya',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20,
                color: ColorsTravelMate.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const <Widget>[
                  popularPlaces(
                    title: 'Gregory Lake',
                    imagePath: 'assets/gregory.jpg',
                  ),
                  popularPlaces(
                    title: 'Gregory Lake',
                    imagePath: 'assets/gregory lake.png',
                  ),
                  popularPlaces(
                    title: 'Gregory Lake',
                    imagePath: 'assets/gregoryLake.jpg',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Popular places in Nuwara Eliya',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 18,
                color: ColorsTravelMate.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    PlaceTag(placeName: 'Gregory Lake'),
                    SizedBox(width: 10),
                    PlaceTag(placeName: 'Little England'),
                    SizedBox(width: 10),
                    PlaceTag(placeName: 'Horton Plains'),
                    SizedBox(width: 10),
                    PlaceTag(placeName: 'Hakgala Botanical Garden'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Public Trips to Nuwara Eliya',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 18,
                color: ColorsTravelMate.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(
                left: 10.0,
                right: 10.0,
              ),
              child: SizedBox(
                height: 350,
                child: Column(
                  children: [
                    tripCard(
                        tripLocationTitle: 'Colombo - Nuwara Eliya\n',
                        location: '  Gregory Lake, Horton Plains',
                        tripDuration: '  August 20, 2023 - August 22, 2023',
                        tripmates: '  Kumar & 10 others'),
                    SizedBox(height: 10),
                    tripCard(
                        tripLocationTitle: 'Galle - Nuwara Eliya\n',
                        location: '  Gregory Lake, Little England',
                        tripDuration: '  August 27, 2023 - August 29, 2023',
                        tripmates: '  Kumar & 5 others'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class popularPlaces extends StatelessWidget {
  const popularPlaces({
    super.key,
    required this.title,
    required this.imagePath,
  });

  final String title;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        height: 250,
        child: Column(
          children: [
            Image.asset(imagePath, height: 200, width: 280,
            fit: BoxFit.cover,
            ),
            Text(title,
                style: const TextStyle(
                    fontSize: 14, color: ColorsTravelMate.primary)),
          ],
        ),
      ),
    );
  }
}

class PlaceTag extends StatelessWidget {
  const PlaceTag({
    super.key,
    required this.placeName,
  });

  final String placeName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsTravelMate.secundary,
          foregroundColor: ColorsTravelMate.tertiary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Text(
          placeName,
        ),
      ),
    );
  }
}
