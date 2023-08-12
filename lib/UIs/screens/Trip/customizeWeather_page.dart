import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:main/Data/controller/global_controller.dart';
import 'package:main/UIs/widgets/weather/header_widget.dart';
import '../../themes/colors.dart';
import 'package:main/Data/weather_data.dart';
import 'package:main/Domain/models/weather_model.dart';

class CustomizeWeather extends StatefulWidget {
  const CustomizeWeather({Key? key}) : super(key: key);

  @override
  State<CustomizeWeather> createState() => _CustomizeWeatherState();
}

class _CustomizeWeatherState extends State<CustomizeWeather> {
  
  var client = weatherData();
  var data;

  info() async {
    // var position = await globalController.getLocation();
    double latitude = globalController.getLattitude().value;
    double longitude = globalController.getLongitude().value;
    data = await client.getData(latitude, longitude);
    return data;
  }

  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: FutureBuilder(future: info(),
        builder: (context, snapshot) {
          return Container(
      child: Column(
        children: [
          Container(
            height: size.height * 0.75,
            width: size.width,
            margin: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                gradient: const LinearGradient(
                  colors: [ColorsTravelMate.tertiary, ColorsTravelMate.primary],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
            child: Column(
              children: [
                const HeaderWidget(),
                Image.network('https:${data?.icon}',
                width: size.width * 0.4,
                fit: BoxFit.fill,),
                Text(
                  '${data?.condition}',
                  // 'Sunny',
                  style:
                      TextStyle(fontSize: 25, color: ColorsTravelMate.tertiary),
                ),
                Text(
                  '${data?.temp_c} °C',
                  // '30 °C',
                  style: TextStyle(
                      fontSize: 50, color: ColorsTravelMate.tertiary),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/icons/windspeed.png',
                            width: size.width * 0.10,
                          ),
                          Text(
                            '${data?.wind_kph} km/h',
                            // '10 km/h',
                            style: TextStyle(
                                fontSize: 15,
                                color: ColorsTravelMate.tertiary,
                                fontWeight: FontWeight.bold),
                          ),
                          const Text('Wind',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: ColorsTravelMate.tertiary)),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/icons/humidity.png',
                            width: size.width * 0.15,
                          ),
                          Text(
                            '${data?.humidity}',
                            // '81',
                            style: TextStyle(
                                fontSize: 15,
                                color: ColorsTravelMate.tertiary,
                                fontWeight: FontWeight.bold),
                          ),
                          const Text('Humidity',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: ColorsTravelMate.tertiary)),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/icons/windDirection.png',
                            width: size.width * 0.15,
                          ),
                          Text(
                            '${data?.wind_dir}',
                            // 'SE',
                            style: TextStyle(
                                fontSize: 15,
                                color: ColorsTravelMate.tertiary,
                                fontWeight: FontWeight.bold),
                          ),
                          const Text('Wind Direction',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: ColorsTravelMate.tertiary)),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Gust',
                      style: TextStyle(
                          fontSize: 15, color: ColorsTravelMate.primary),
                    ),
                    Text(
                      '${data?.gust_kph} kp/h',
                      // '32.0 kp/h',
                        style: TextStyle(
                            fontSize: 18,
                            color: ColorsTravelMate.primary,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'UV',
                      style: TextStyle(
                          fontSize: 15, color: ColorsTravelMate.primary),
                    ),
                    Text(
                      '${data?.uv}',
                      // '1.0',
                        style: TextStyle(
                            fontSize: 18,
                            color: ColorsTravelMate.primary,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Pressure',
                      style: TextStyle(
                          fontSize: 15, color: ColorsTravelMate.primary),
                    ),
                    Text(
                      '${data?.pressure_mb} hPa',
                      // '1025.0 hPa',
                        style: TextStyle(
                            fontSize: 18,
                            color: ColorsTravelMate.primary,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Cloud',
                      style: TextStyle(
                          fontSize: 15, color: ColorsTravelMate.primary),
                    ),
                    Text(
                      '${data?.cloud}',
                      // '32.0 kp/h',
                        style: TextStyle(
                            fontSize: 18,
                            color: ColorsTravelMate.primary,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Feelslike',
                      style: TextStyle(
                          fontSize: 15, color: ColorsTravelMate.primary),
                    ),
                    Text(
                      '${data?.feelslike_c}',
                      // '1.0',
                        style: TextStyle(
                            fontSize: 18,
                            color: ColorsTravelMate.primary,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Wind degree',
                      style: TextStyle(
                          fontSize: 15, color: ColorsTravelMate.primary),
                    ),
                    Text(
                      '${data?.wind_degree}',
                      // '1025.0 hPa',
                        style: TextStyle(
                            fontSize: 18,
                            color: ColorsTravelMate.primary,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
        },));
  }
}
