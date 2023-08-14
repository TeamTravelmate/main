import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:main/Domain/models/trip.dart';
import 'package:http/http.dart' as http;

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

  Future<List<Trip>> fetchTrips() async {
  final response = await http.get(
    Uri.parse('http://192.168.198.1:3000/trip/:id'), 
  );

  if (response.statusCode == 200) {
    final List<dynamic> responseData = json.decode(response.body);
    List<Trip> trips = responseData.map((data) => Trip(
      userId: data['userId'],
      destination: data['destination'],
      startDate: data['startDate'],
      numberOfDays: data['numberOfDays'],
    )).toList();
    return trips;
  } else {
    throw Exception('Failed to fetch trips');
  }
}


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Trip>>(
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
              return ListTile(
                title: Text(snapshot.data![index].destination),
                subtitle: Text(snapshot.data![index].startDate),
                // Add more information as needed
              );
            },
          );
        } else {
          return const Text('No trips found.');
        }
      },
    );
  }
}
