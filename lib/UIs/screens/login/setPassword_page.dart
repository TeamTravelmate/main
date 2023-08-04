import 'package:flutter/material.dart';
import 'package:main/UIs/screens/login/passwordReset_page.dart';
import 'package:main/UIs/themes/colors.dart';
import 'package:main/UIs/widgets/button_widget.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 100,
          bottom: 100,
          left: 50,
          right: 50,
        ),
        child: Column(
          children: [
            Image.asset(
              'assets/logo-travelmate.png',
              height: 200,
              width: 240,
            ),
            const Text(
              'Set New Password?',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Must be at least 8 characters',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: ColorsTravelMate.primary.withOpacity(0.6)),
            ),
            const SizedBox(
              height: 50,
            ),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                hintText: '********',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Confirm Password',
                hintText: '********',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const buttonWidget(
              width: double.infinity,
              labelText: 'Reset Password',
              path: PasswordReset(),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Back to Login',
                  style: TextStyle(
                      color: ColorsTravelMate.primary.withOpacity(0.6)),
                )),
          ],
        ),
      ),
    );
  }
}
