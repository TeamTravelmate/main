import 'dart:convert';

import 'package:main/Data/env/env.dart';
import 'package:main/Domain/models/trip.dart';
import 'package:http/http.dart' as http;

class TripServices {
  //fetch trip currently planning
  Future<Trip> getTrip(String token) async {
    var url = Uri.parse('$backendUrl/trip/currentTrips');
    var response;
    try {
      response = await http.get(url,
          headers: {'Content-Type': 'application/json', 'Authorization': token});

    } on Exception catch (e) {
      print(e);
      throw Exception('Failed to load trip');
    }
    if (response.statusCode == 200) {
      return Trip.fromJson(
          (jsonDecode(response.body) as Map<String, dynamic>));
    }
    if (response.statusCode == 401) {
      throw Exception('Please login to view your trip');
    }
    if (response.statusCode == 500) {
      throw Exception("Server error. It's not you, it's us");
    }
    if (response.statusCode == 404) {
      //return a blank trip
      return Trip();
    }
    throw Exception('Network Error');
  }
  //create trip
  Future<Trip> createTrip(Map<String, dynamic> trip, String token) async {
    var url = Uri.parse('$backendUrl/trip');
    var response;
    try {
      response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          },
          body: jsonEncode(trip));
    } on Exception catch (e) {
      print(e);
      throw Exception('Network Error');
    }
    if (response.statusCode == 201) {
      return Trip.fromJson(
          (jsonDecode(response.body) as Map<String, dynamic>)['trip']);
    }
    if (response.statusCode == 401) {
      throw Exception('Please login to create a trip');
    }
    if (response.statusCode == 500 || response.statusCode == 404) {
      throw Exception("Server error. It's not you, it's us");
    }
    throw Exception('Network Error');
  }

//trip from id
  Future<List<Trip>> getMyTrips(String token) async {
    var url = Uri.parse('$backendUrl/trip/myTrips');
    var response;
    try {
      response =
          await http.get(url, headers: {'Authorization': 'Bearer $token'});

    } on Exception catch (e) {
      print(e);
      throw Exception('Failed to load your trips');
    }
    if (response.statusCode == 200) {
      var rawResponseData = json.decode(response.body) as List<dynamic>;
      List<Trip> trips = rawResponseData
          .map((data) => Trip(
                tripId: data['id'],
                destination: data['destination'],
                startDate: data['starting_date'],
                numberOfDays: data['no_of_days'],
              ))
          .toList();
      return trips;
    }
    if (response.statusCode == 401) {
      throw Exception('Please login to view your trips');
    }
    if (response.statusCode == 500 || response.statusCode == 404) {
      throw Exception("Server error. It's not you, it's us");
    }
    throw Exception('Network Error');
  }

  //get public trips
  Future<List<Trip>> getPublicTrips() async {
    var url = Uri.parse('$backendUrl/trip/s');
    var response;
    try {
      response = await http.get(url);
    } on Exception catch (e) {
      print(e);
      throw Exception('Failed to load public trips');
    }
    if (response.statusCode == 200) {
      var rawResponseData = json.decode(response.body) as List<dynamic>;
      List<Trip> trips = rawResponseData
          .map((data) => Trip(
                tripId: data['id'],
                destination: data['destination'],
                startDate: data['starting_date'],
                numberOfDays: data['no_of_days'],
                childrenCount: data['children_count'],
                adultCount: data['adult_count'],
              ))
          .toList();
      return trips;
    }
    if (response.statusCode == 401) {
      throw Exception('Please login to view public trips');
    }
    if (response.statusCode == 500 || response.statusCode == 404) {
      throw Exception("Server error. It's not you, it's us");
    }
    throw Exception('Network Error');
  }

  //update trip details
  Future<Trip> updateTrip(Map<String, dynamic> trip, String token) async {
    var url = Uri.parse('$backendUrl/trip');
    var response;
    try {
      response = await http.put(url,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          },
          body: jsonEncode(trip));
    } on Exception catch (e) {
      print(e);
      throw Exception('Network Error');
    }
    if (response.statusCode == 200) {
      //its just a message so return a blank trip
      return Trip();
    }
    if (response.statusCode == 401) {
      throw Exception('Please login to update your trip');
    }
    if (response.statusCode == 500 || response.statusCode == 404) {
      throw Exception("Server error. It's not you, it's us");
    }
    throw Exception('Network Error');
  }
}
