import 'package:flutter/material.dart';
import 'package:main/UIs/screens/profile/profile.dart';
import 'package:main/UIs/widgets/side_drawer.dart';
import '../../themes/colors.dart';
import '../../widgets/feed_widget.dart';
import '../../widgets/popular_widget.dart';
import '../Trip/tripPlanning_page.dart';
import 'popularPlaces_page.dart';

// ignore: camel_case_types
class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    const shape = StadiumBorder();
    return Scaffold(
      drawer: const SideDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/logo-travelmate.png',
          width: 200,
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
              
              child: Image.asset('assets/profile.png', height: 30, width: 30),
            ),
        ],
        backgroundColor: ColorsTravelMate.tertiary,
        foregroundColor: ColorsTravelMate.primary,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
            ),
            child: Column(
              children: [
                const SizedBox(height: 30),
                const Text(
                  'Popular Destinations',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    color: ColorsTravelMate.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const <Widget>[
                      popularTrips(
                        path: popularDestinations(),
                        title: 'Nuwara Eliya',
                        imagePath: 'assets/nuwara eliya.jpg',
                      ),
                      popularTrips(
                        path: popularDestinations(),
                        title: 'Galle',
                        imagePath: 'assets/galleFort.png',
                      ),
                      popularTrips(
                        path: popularDestinations(),
                        title: 'Yala',
                        imagePath: 'assets/yala.png',
                      ),
                      popularTrips(
                        path: popularDestinations(),
                        title: 'Unawatuna',
                        imagePath: 'assets/unawatuna beach.jpg',
                      ),
                      popularTrips(
                        path: popularDestinations(),
                        title: 'Colombo',
                        imagePath: 'assets/colombo.jpg',
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: const ShapeDecoration(
                      shape: shape,
                      gradient: LinearGradient(
                          colors: 
                          [
                            ColorsTravelMate.secundary,
                            ColorsTravelMate.tertiary,
                          ])),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => trip(),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                      padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                      foregroundColor:
                          MaterialStateProperty.all(ColorsTravelMate.tertiary),
                    ),
                    child: Container(
                      width: 350,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '  Plan your vacation with us  ',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.arrow_circle_right_rounded,
                            color: ColorsTravelMate.secundary,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const feedCard(
                  profile: 'assets/profile.png',
                  title: 'Nimesh Jayasinha',
                  subtitle: 'Colombo, Sri Lanka',
                  post:
                      'Can anyone recommend some place to travel on weekens???',
                  imagePath: 'assets/post.png',
                  likes: '100',
                  comments: '12',
                ),
                const SizedBox(
                  height: 10,
                ),
                const feedCard(
                  profile: 'assets/profile.png',
                  title: 'Nimesh Jayasinha',
                  subtitle: 'Colombo, Sri Lanka',
                  post:
                      'Can anyone recommend some place to travel on weekens???',
                  imagePath: 'assets/post.png',
                  likes: '100',
                  comments: '12',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


