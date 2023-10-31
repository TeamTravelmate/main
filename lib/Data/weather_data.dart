import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:main/Domain/models/weather_model.dart';
import 'package:main/Data/controller/global_controller.dart';

class weatherData {
  // static const apiKey = "a961b455b3d595559ce543a1aa59e15b";
  // static const apiKey = "62b87d197e1744da92e03731231208";
  static const apiKey = "9e054e6b593a4761a0f163352233110";

  // procecssing the data from response -> to json
  Future<weather> getData(var lat, var lon) async {
    // var uriCall = Uri.parse(
    //     "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=$apiKey&units=metric&exclude=minutely");
    var uriCall = Uri.parse(
        "http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$lat,$lon&aqi=no");
    var response = await http.get(uriCall);
    var body = jsonDecode(response.body);
    return weather.fromJson(body);
  }
}
