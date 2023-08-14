import 'dart:convert';

import 'package:main/Domain/models/user.dart';
import 'package:http/http.dart' as http;

class Trip {
  int tripId;
  String name;
  String description;
  String image;
  List<TripDay> tripDays = [];
  List<User> tripMates = [];
  User creator = User(avatar: '', name: '', email: '');

  Trip({
    required this.tripId,
    required this.name,
    required this.description,
    required this.image,
  });

  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      tripId: json['trip_id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
    );
  }

  List<User> getTripmates() {
    List<User> friends = [];
    creator.getFriends("").then((data) => friends = creator.getFriendsList());
    return friends;
  }

  Future<void> getDays() async {
    tripDays = await getTripDays();
  }

  List<TripDay> getDaysList() {
    return tripDays;
  }

  Future<void> getTripMates(String tripId) async {
    tripMates = await getTripMatesResponse(tripId);
  }

  List<User> getTripMatesList() {
    tripMates.add(creator);
    return tripMates;
  }
}

class TripDay {
  String date;
  String places;
  String budget;
  String weather;

  TripDay(this.date, this.places, this.budget, this.weather);

  factory TripDay.fromJson(Map<String, dynamic> json) {
    return TripDay(
      json['day_id'],
      json['places'],
      json['budget'],
      json['weather'],
    );
  }
}

Future<List<TripDay>> getTripDays() async {
  Uri parse = Uri.https('64d64f85754d3e0f1361ed5e.mockapi.io', '/tripDays');
  try {
    final response = await http.get(parse);
    if (response.statusCode == 200) {
      var decodedJson = json.decode(response.body) as List<dynamic>;
      return decodedJson
          .map((obj) => TripDay.fromJson(obj as Map<String, dynamic>))
          .toList();
    }
    return [];
  } catch (e) {
    throw Exception('Failed to load TripDay');
  }
}

Future<List<User>> getTripMatesResponse(String tripId) async {
  Uri url = Uri.https('randomuser.me', '/api', {'results': '5'});
  http.Response response = await http.get(url);

  if (response.statusCode == 200) {
    var decodedJson = json.decode(response.body) as Map<String, dynamic>;
    return (decodedJson['results'] as List<dynamic>)
        .map((obj) => User.fromJson(obj as Map<String, dynamic>))
        .toList();
  } else {
    print('Request failed with status: ${response.statusCode}.');
    return [];
  }
}
