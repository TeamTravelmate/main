import 'package:main/Domain/models/itinerary.dart';
import 'package:http/http.dart' as http;
import 'package:main/Data/env/env.dart';
import 'dart:convert';

class ItineraryServices {
  Future<Itinerary> getItinerary(tripId, token) async {
    var url = Uri.parse('$backendUrl/trip/itinerary/$tripId');
    var response;
    try {
      response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Authorization': token
      });
    } on Exception catch (e) {
      print(e);
      throw Exception('Failed to load itinerary');
    }
    if (response.statusCode == 200) {
      return Itinerary.fromJson(
          (jsonDecode(response.body) as Map<String, dynamic>));
    }
    if (response.statusCode == 401) {
      throw Exception('Please login to view your itinerary');
    }
    if (response.statusCode == 500) {
      throw Exception("Server error. It's not you, it's us");
    }
    if (response.statusCode == 404) {
      //return a blank itinerary
      return Itinerary(itineraryElements: []);
    }
    throw Exception('Network Error');
  }
  /*
  POST http://localhost:3000/trip/itinerary/18 HTTP/1.1
Content-Type: application/json
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIsImZpcnN0TmFtZSI6IkFtYXNoaSIsImxhc3ROYW1lIjoiU2FuZHVuaSIsImVtYWlsIjoiYW1hc2hpQGdtYWlsLmNvbSIsImlzQWRtaW4iOmZhbHNlLCJpYXQiOjE2OTg3NDA2MjIsImV4cCI6MTcwMTMzMjYyMn0.ifmeCVyapr2wx18c9jiCYYYLYEJy4PPl92rSy_zK5u4

{
  "day": 1,
  "location": "Little England",
  "activity": "Picnic"
}
  */
  Future<Itinerary> addItinerary(
      int tripId, ItineraryElements element, String token) async {
    var url = Uri.parse('$backendUrl/trip/itinerary/$tripId');
    var response;
    try {
      response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': token
          },
          body: jsonEncode(element.toJson()));
    } on Exception catch (e) {
      print(e);
      throw Exception('Failed to add itinerary');
    }
    if (response.statusCode == 200) {
      return Itinerary.fromJson(
          (jsonDecode(response.body) as Map<String, dynamic>));
    }
    if (response.statusCode == 401) {
      throw Exception('Please login to add itinerary');
    }
    if (response.statusCode == 500) {
      throw Exception("Server error. It's not you, it's us");
    }
    throw Exception('Network Error');
  }
}
