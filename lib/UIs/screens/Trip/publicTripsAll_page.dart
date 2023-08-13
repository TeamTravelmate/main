import 'package:flutter/material.dart';
import '../../themes/colors.dart';
import '../../widgets/popular_widget.dart';
import 'publicTrip_page.dart';

// ignore: camel_case_types
class publicTripsAll extends StatelessWidget {
  const publicTripsAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
      ),
      child: Column(
        children: [
          const SizedBox(height: 30),
          const Text(
            'Popular Trips',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 16,
              color: ColorsTravelMate.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            height: 180,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const <Widget>[
                popularTrips(
                  path: publicTripView(),
                  title: 'Galle',
                  imagePath: 'assets/galleFort.png',
                ),
                popularTrips(
                  path: publicTripView(),
                  title: 'Yala',
                  imagePath: 'assets/yala.png',
                ),
                popularTrips(
                  path: publicTripView(),
                  title: 'Nuwara Eliya',
                  imagePath: 'assets/nuwara eliya.jpg',
                ),
                popularTrips(
                  path: publicTripView(),
                  title: 'Unawatuna',
                  imagePath: 'assets/unawatuna beach.jpg',
                ),
                popularTrips(
                  path: publicTripView(),
                  title: 'Colombo',
                  imagePath: 'assets/colombo.jpg',
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
