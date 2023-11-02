import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:main/Data/env/apikeys.dart';

class PlaceServices {
  final String key = mapApi; //specify this in lib\Data\env\apiKeys.dart
  late String? searchedLocation; //like 333.33, 444.44
  String?
      filterType; //restaurant, atm, etc. Check https://developers.google.com/maps/documentation/places/web-service/supported_types

  PlaceServices({this.searchedLocation, this.filterType});

  Future<List<dynamic>> getPlaces() async {
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
    if (photoReference == "") {
      return Image.asset('assets/icons.png');
    }
    String url =
        "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=$photoReference&key=$key";
    return Image.network(url);
  }

  /**
   * https://maps.googleapis.com/maps/api/geocode/json?address=Toledo&region=es&key=YOUR_API_KEY
   * {
   "results" : [
      {
         "address_components" : [
            {
               "long_name" : "Toledo",
               "short_name" : "Toledo",
               "types" : [ "locality", "political" ]
            },
            {
               "long_name" : "Toledo",
               "short_name" : "TO",
               "types" : [ "administrative_area_level_2", "political" ]
            },
            {
               "long_name" : "Castile-La Mancha",
               "short_name" : "CM",
               "types" : [ "administrative_area_level_1", "political" ]
            },
            {
               "long_name" : "Spain",
               "short_name" : "ES",
               "types" : [ "country", "political" ]
            }
         ],
         "formatted_address" : "Toledo, Spain",
         "geometry" : {
            "bounds" : {
               "northeast" : {
                  "lat" : 39.88605099999999,
                  "lng" : -3.9192423
               },
               "southwest" : {
                  "lat" : 39.8383676,
                  "lng" : -4.0796176
               }
            },
            "location" : {
               "lat" : 39.8628316,
               "lng" : -4.027323099999999
            },
            "location_type" : "APPROXIMATE",
            "viewport" : {
               "northeast" : {
                  "lat" : 39.88605099999999,
                  "lng" : -3.9192423
               },
               "southwest" : {
                  "lat" : 39.8383676,
                  "lng" : -4.0796176
               }
            }
         },
         "place_id" : "ChIJ8f21C60Lag0R_q11auhbf8Y",
         "types" : [ "locality", "political" ]
      }
   ],
   "status" : "OK"
}
   */
  //get lat and lng from address
  Future<Map<String, dynamic>> getLatLngFromAddress(String address) async {
    if(address == ""){
      return {'lat': 69, 'lng': 0, 'address': ""};
    }
    String urlEncodedAddress = Uri.encodeComponent(address);
    String url =
        "https://maps.googleapis.com/maps/api/geocode/json?address=$urlEncodedAddress&key=$key";
    Uri uri = Uri.parse(url);

    var response = await http.get(Uri.parse(url));
    //return lat and lng along with the address
    Map<String, dynamic> latLng = {};
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      latLng['lat'] = json['results'][0]['geometry']['location']['lat'];
      latLng['lng'] = json['results'][0]['geometry']['location']['lng'];
      latLng['address'] = json['results'][0]['formatted_address'];
    } else {
      throw Exception('Failed to load places');
    }

    return latLng;
  }

  //get multiple lat and lng from address
  Future<List<Map<String, dynamic>>> getLatLngFromAddresses(
      List<String> addresses) async {
    List<Map<String, dynamic>> latLngList = [];
    for (String address in addresses) {
      latLngList.add(await getLatLngFromAddress(address));
    }
    return latLngList;
  }
}
