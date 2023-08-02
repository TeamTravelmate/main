import 'package:flutter/material.dart';
import '../../themes/colors.dart';

class CustomizeWeather extends StatelessWidget {
  const CustomizeWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
        backgroundColor: ColorsTravelMate.tertiary,
        foregroundColor: ColorsTravelMate.primary,
      ),
      body: Container(
        width: double.infinity,
        child: Image.asset('assets/weather.png', fit: BoxFit.cover),
      )
    );
  }
}