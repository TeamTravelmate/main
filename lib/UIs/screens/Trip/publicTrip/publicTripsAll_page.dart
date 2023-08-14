import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:main/UIs/screens/Trip/publicTrip/publicTripViewPage.dart';
import 'package:main/UIs/widgets/tripCard_widget.dart';
import '../../../themes/colors.dart';
import '../../../widgets/popular_widget.dart';
import '../publicTripViewPage.dart';
import 'publicTrip_page.dart';

// ignore: camel_case_types
class publicTripsAll extends StatelessWidget {
  const publicTripsAll({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              const Text(
                'Popular Trips',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                  color: ColorsTravelMate.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Join with us to explore Sri Lanka! \nTravelMate Discover! Explore! Connect!',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 14,
                  color: ColorsTravelMate.primary,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 220,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
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
              Container(
                width: size.width * 0.9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: ColorsTravelMate.secundary.withOpacity(0.2)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Text(
                        'Explore with TravelMate!\n',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: ColorsTravelMate.secundary,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const Text(
                        'TravelMate facilitates you everything in a single platform!',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: ColorsTravelMate.secundary,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        width: size.width * 0.9,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor:
                                      ColorsTravelMate.secundary.withOpacity(0.2),
                                  child: const Icon(
                                    Icons.location_on_rounded,
                                    color: ColorsTravelMate.secundary,
                                    size: 30,
                                  ),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor:
                                      ColorsTravelMate.secundary.withOpacity(0.2),
                                  child: const Icon(
                                    Icons.hotel_rounded,
                                    color: ColorsTravelMate.secundary,
                                    size: 30,
                                  ),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor:
                                      ColorsTravelMate.secundary.withOpacity(0.2),
                                  child: const Icon(
                                    Icons.restaurant_menu_rounded,
                                    color: ColorsTravelMate.secundary,
                                    size: 30,
                                  ),  
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor:
                                      ColorsTravelMate.secundary.withOpacity(0.2),
                                  child: const Icon(
                                    Icons.local_taxi_rounded,
                                    color: ColorsTravelMate.secundary,
                                    size: 30,
                                  ),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor:
                                      ColorsTravelMate.secundary.withOpacity(0.2),
                                  child: const Icon(
                                    Icons.shopping_bag_rounded,
                                    color: ColorsTravelMate.secundary,
                                    size: 30,
                                  ),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor:
                                      ColorsTravelMate.secundary.withOpacity(0.2),
                                  child: const Icon(
                                    Icons.hiking_rounded,
                                    color: ColorsTravelMate.secundary,
                                    size: 30,
                                  ),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor:
                                      ColorsTravelMate.secundary.withOpacity(0.2),
                                  child: const Icon(
                                    Icons.wallet,
                                    color: ColorsTravelMate.secundary,
                                    size: 30,
                                  ),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor:
                                      ColorsTravelMate.secundary.withOpacity(0.2),
                                  child: const Icon(
                                    Icons.list_alt_rounded,
                                    color: ColorsTravelMate.secundary,
                                    size: 30,
                                  ),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor:
                                      ColorsTravelMate.secundary.withOpacity(0.2),
                                  child: const Icon(
                                    Icons.cloud,
                                    color: ColorsTravelMate.secundary,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: size.width * 0.9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color.fromARGB(255, 210, 128, 155).withOpacity(0.3)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      const Column(
                        children: [
                          Text(
                            'How has travel transformed \nyour perspective?',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 210, 128, 155),
                            ),
                          ),
                          Text(
                            'Share your most enlightening\nmoment with the TravelMate\ncommunity!',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 210, 128, 155),
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/blog.png',
                        height: 120,
                        width: 100,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
