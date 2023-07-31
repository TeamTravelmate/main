import 'package:flutter/material.dart';

import 'GreetingScreen.dart';

class NameInputScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();

  NameInputScreen({super.key});

  void _submitName(BuildContext context) {
    String name = _nameController.text;
    if (name.trim().isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GreetingScreen(name: name),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Enter Your Name')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Your Name'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _submitName(context),
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
