import 'package:flutter/material.dart';
import '../../themes/colors.dart';

class CustomizeResturants extends StatelessWidget {
  const CustomizeResturants({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resturants'),
        backgroundColor: ColorsTravelMate.tertiary,
        foregroundColor: ColorsTravelMate.primary,
      ),
      body: Container()
    );
  }
}
