import 'package:http/http.dart' as http;
import 'dart:convert';

String apiKey = 'your_api_key';

class BookingService {
  static Future<List<Hotel>> getHotels(String location) async {
  // The base URL of the Booking.com API.
  //https://distribution-xml.booking.com/2.0/hotels?location
  const String baseUrl = 'https://api.booking.com/v1/properties/search';

  // The parameters to pass to the API.
  final Map<String, dynamic> params = {
    'destination': location,
    'adults': '2',
    'children': '0',
  };

  // Make the API call.
  final response = await http.get(Uri.parse('$baseUrl?${Uri.encodeFull(location)}&api_key=$apiKey'));

  // Check if the response was successful.
  if (response.statusCode == 200) {
    // Parse the JSON response.
    final json = jsonDecode(response.body);

    // Get the list of hotels.
    final List<Hotel> hotels = [];
    for (var hotel in json['results']) {
      hotels.add(Hotel.fromJson(hotel));
    }

    // Return the list of hotels.
    return hotels;
    
  } else {
    // Throw an error.
    throw Exception('An error occurred while fetching the hotels.');
  }
  }
}

class Hotel {
  final String id;
  final String name;
  final String imageUrl;
  final double price;

  Hotel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['images']['url'],
      price: json['price']['current'],
    );
  }
}