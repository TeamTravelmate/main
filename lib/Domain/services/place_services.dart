import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:main/Data/env/apiKeys.dart';
import 'package:http/http.dart' as http;

class PlaceServices {
  final String key = mapApi; //specify this in lib\Data\env\apiKeys.dart
  late String? searchedLocation; //like 333.33, 444.44
  String?
      filterType; //restaurant, atm, etc. Check https://developers.google.com/maps/documentation/places/web-service/supported_types

  PlaceServices({this.searchedLocation, this.filterType});


  Future<List<dynamic>> getPlaces() async {
    if(searchedLocation == null || filterType == null){
      throw Exception('Searched location or filter type is null');
    }
    String urlEncodedLocation = Uri.encodeComponent(searchedLocation!);
    String url =
        "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$urlEncodedLocation&radius=1000&type=$filterType&key=$key";
    Uri uri = Uri.parse(url);

    var response = await http.get(Uri.parse(url));
    var results = [];
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      results = json['results'] as List;
    } else {
      throw Exception('Failed to load places');
    }
    return results;
  }

  Image getPlaceImage(String photoReference) {
    if(photoReference == ""){
      return Image.asset('assets/icons.png');
    }
    String url =
        "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=$photoReference&key=$key";
    return Image.network(url);
  }
}
