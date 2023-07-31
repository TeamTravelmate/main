import 'package:flutter/material.dart';
import 'package:main/UIs/themes/colors.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // cover image
            Image.asset(
              "assets/img/cover.jpg",
              height: MediaQuery.of(context).size.height * 0.55,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),

            // logo
            Image.asset(
              "assets/img/logo-travelmate.png",
              width: 300,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 15),
            // login
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 10,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: ColorsTravelMate.primary,
                      onPressed: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // register
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 10,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: ColorsTravelMate.primary),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onPressed: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          "Register",
                          style: TextStyle(
                              color: ColorsTravelMate.primary, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Spacer(),
            Spacer(),      

            GestureDetector(
              onTap: () {},
              child: const Text(
                "Continue as guest",
                style: TextStyle(
                  color: ColorsTravelMate.secundary,
                  fontWeight: FontWeight.w500,
                  
                ),
              ),
            ),

            Spacer(),
          ],
        ),
      ),
    );
  }
}
