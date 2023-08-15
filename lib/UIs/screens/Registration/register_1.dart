import 'package:flutter/material.dart';

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Form'),
      ),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(labelText: 'First name'),
            onChanged: (value) {
              firstName = value;
            },
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Last name'),
            onChanged: (value) {
              lastName = value;
            },
          ),
          ElevatedButton(
            child: const Text('Next'),
            onPressed: () {
              // Go to the next page.
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondPage(
                    firstName: firstName,
                    lastName: lastName,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final String firstName;
  final String lastName;

  SecondPage({
    super.key,
    required this.firstName,
    required this.lastName,
  });

  set password(String password) {}

  set email(String email) {
    email = email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Form'),
      ),
      body: Column(
        children: [
          Text('First name: $firstName'),
          Text('Last name: $lastName'),
          TextField(
            decoration: const InputDecoration(labelText: 'Email'),
            onChanged: (value) {
              email = value;
            },
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Password'),
            onChanged: (value) {
              password = value;
            },
          ),
          ElevatedButton(
            child: const Text('Submit'),
            onPressed: () {
              // TODO: Submit the form data to a backend server.
            },
          ),
        ],
      ),
    );
  }
}
