import 'package:flutter/material.dart';
import 'package:main/UIs/screens/login/setPassword_page.dart';
import '../../themes/colors.dart';
import '../../widgets/button_widget.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'login_page.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({super.key});

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  @override
  Widget build(BuildContext context) {
    Text text;
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
              'Password Reset',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            text = Text.rich(
              TextSpan(
                text: 'We send a code to ',
                style:
                    TextStyle(color: ColorsTravelMate.primary.withOpacity(0.6)),
                children: <TextSpan>[
                  TextSpan(
                      text: 'abc@gmail.com',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorsTravelMate.primary.withOpacity(0.6))),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            OtpTextField(
              numberOfFields: 5,
              borderColor: ColorsTravelMate.primary,
              enabledBorderColor: ColorsTravelMate.primary.withOpacity(0.6),
              focusedBorderColor: ColorsTravelMate.primary.withOpacity(0.8),
              showFieldAsBox: true,
              fieldWidth: 54,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Verification Code"),
                        content: Text('Code entered is $verificationCode'),
                      );
                    });
              }, // end onSubmit
            ),
            const SizedBox(
              height: 20,
            ),
            const buttonWidget(
              width: double.infinity,
              labelText: 'Continue',
              path: NewPassword(),
            ),
            TextButton(
              onPressed: () {
                
              },
              child: text = Text.rich(
                TextSpan(
                  text: 'Didn\'t receive the code? ',
                  style: TextStyle(
                      color: ColorsTravelMate.primary.withOpacity(0.6)),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Resend',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ColorsTravelMate.primary.withOpacity(0.6))),
                  ],
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
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
