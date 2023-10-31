import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:galleryimage/galleryimage.dart';
import 'package:main/Data/env/env.dart';
import 'package:main/Domain/models/trip.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod/riverpod.dart';


class MyTripsList extends StatefulWidget {
  const MyTripsList({super.key});

  @override
  _MyTripsListState createState() => _MyTripsListState();
}

class _MyTripsListState extends State<MyTripsList> {
  late Future<List<Trip>> trips;

  @override
  void initState() {
    super.initState();
    trips = fetchTrips();
  }

  List<String> listOfUrls3 = [
      "https://googleflutter.com/sample_image.jpg",
      "https://cosmosmagazine.com/wp-content/uploads/2020/02/191010_nature.jpg",
      "https://scx2.b-cdn.net/gfx/news/hires/2019/2-nature.jpg",
      "https://cosmosmagazine.com/wp-content/uploads/2020/02/191010_nature.jpg",
      "https://scx2.b-cdn.net/gfx/news/hires/2019/2-nature.jpg",
      "https://cosmosmagazine.com/wp-content/uploads/2020/02/191010_nature.jpg",
      "https://scx2.b-cdn.net/gfx/news/hires/2019/2-nature.jpg",


    ];

Future<List<Trip>> fetchTrips() async {
  final Map<String, String> headers = {
    'Authorization': 'Bearer token', // Include your bearer token
  };

  final response = await http.get(
    Uri.parse('$backendUrl/trip/myTrips'),
    headers: headers, // Include the headers with the bearer token
  );

  if (response.statusCode == 200) {
    var rawResponseData = json.decode(response.body) as Map<String, dynamic>;
    var responseData = rawResponseData["trips"] as List<dynamic>;
    List<Trip> trips = responseData
        .map((data) => Trip(
              tripId: data['userId'],
              destination: data['destination'],
              startDate: data['startDate'],
              numberOfDays: data['numberOfDays'],
            ))
        .toList();
    return trips;
  } else {
    throw Exception('Failed to fetch trips');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<List<Trip>>(
          future: trips,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final trip = snapshot.data![index];

                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      margin: const EdgeInsets.only(
                          top: 5.0, left: 5.0, right: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.only(
                          left: 15.0, top: 5.0, bottom: 5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                trip.destination!,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  // Handle map icon button press
                                },
                                icon: const Icon(Icons.map_outlined),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5.0),
                          SizedBox(
                            height: 100.0,
                            width: 280.0,
                            child: GalleryImage(
                              imageUrls: listOfUrls3, // Replace with your image URLs
                              numOfShowImages: 3,
                              // Add any other properties that GalleryImage widget supports.
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.location_pin),
                              Text(
                                trip.destination!,
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const Icon(Icons.calendar_month),
                              Text(
                                "${trip.startDate} - ${trip.numberOfDays} days",
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          const Row(
                            children: [
                              Icon(Icons.person),
                              Text(
                                "Nima & 12 others", 
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          const Row(
                            children: [
                              Icon(Icons.surfing),
                              Text(
                                "Swimming", 
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Text('No trips found.');
            }
          },
        ),
      ),
    );
  }
}
