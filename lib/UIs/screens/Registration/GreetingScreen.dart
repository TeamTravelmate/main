import 'package:flutter/material.dart';

class GreetingScreen extends StatelessWidget {
  final String name;

  const GreetingScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Greetings')),
      body: Center(
        child: Text(
          'Hi $name!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
