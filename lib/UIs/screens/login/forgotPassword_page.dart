import 'package:flutter/material.dart';
import 'package:main/UIs/screens/login/passwordReset_page.dart';
import 'package:main/UIs/themes/colors.dart';
import 'package:main/UIs/widgets/button_widget.dart';

import 'login_page.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
              'Forgot Password?',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'No worries, we\'ll send you the reset instructions',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: ColorsTravelMate.primary.withOpacity(0.6)),
            ),
            const SizedBox(
              height: 50,
            ),
            TextField(
              controller: TextEditingController(),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                hintText: 'abc@gmail.com',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const buttonWidget(
              width: double.infinity,
              labelText: 'Next',
              path: PasswordReset(),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
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
