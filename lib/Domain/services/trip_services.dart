import 'dart:convert';

import 'package:main/Data/env/env.dart';
import 'package:main/Domain/models/trip.dart';
import 'package:http/http.dart' as http;

class TripServices{
  Future<Trip> createTrip(Map<String, dynamic> trip, String token) async {
    var url = Uri.parse('$backendUrl/trip');
    var response;
    response = await http.post(url, headers: {'Content-Type': 'application/json', 'Authorization' : 'Bearer $token'}, body: jsonEncode(trip));
    if (response.statusCode == 201) {

      return Trip.fromJson((jsonDecode(response.body) as Map<String, dynamic>)['trip']);
    }
    if (response.statusCode == 401) {
      throw Exception('Please login to create a trip');
    }
    if (response.statusCode == 500 || response.statusCode == 404) {
      throw Exception("Server error. It's not you, it's us");
    }
    throw Exception('Network Error');
  }
}