import 'package:flutter/material.dart';
import 'package:main/UIs/themes/colors.dart';
import 'package:main/UIs/widgets/field_widget.dart';
import 'package:main/UIs/widgets/button_widget.dart';


void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //text editing controller
  TextEditingController controller = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //remove debug banner
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      //theme colours
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          accentColor: ColorsTravelMate.secundary,
          cardColor: ColorsTravelMate.tertiary,
          brightness: Brightness.light,
        ),
      ),
      home: 
      Scaffold(
        appBar: AppBar(
          title: const Text('Travel Mate'),
        ),
        body: Flex(
          direction: Axis.vertical,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: ColorsTravelMate.tertiary,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextField(
                      controller: controller,
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      controller: controller,
                      hintText: 'Password',
                      isPassword: true,
                    ),
                    const SizedBox(height: 20),
                    const buttonWidget(
                      width: 200,
                      height: 50,
                      labelText: 'Login',
                      path: null,
                    ),
                    const SizedBox(height: 20),
                    const buttonWidget(
                      width: 200,
                      height: 50,
                      labelText: 'Register',
                      path: null,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )

    );
  }
}