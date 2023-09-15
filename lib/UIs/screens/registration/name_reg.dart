// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:main/Domain/provider/register_form_provider.dart';
import 'package:provider/provider.dart';
import 'birthday.dart'; // Import the birthday.dart file

class NameReg extends StatefulWidget {
  const NameReg({super.key});

  @override
  State<NameReg> createState() => _NameRegState();
}

class _NameRegState extends State<NameReg> {
  final _formKey = GlobalKey<FormState>();

  void _nextButtonPressed() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      String firstName =
          Provider.of<RegistrationFormProvider>(context, listen: false)
              .firstName;
      String lastName =
          Provider.of<RegistrationFormProvider>(context, listen: false)
              .lastName;

              print(firstName);
              print(lastName);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Birthday(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 12, 28, 51),
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 12, 28, 51), // Starting color
                  Color.fromARGB(255, 47, 173, 187), // Ending color
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'What’s your Name?',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Enter the name you use in real life.',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Consumer<RegistrationFormProvider>(
                            builder: (context, modal, child) {
                              return TextFormField(
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0)),
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xffffffff),
                                  hintText: 'First Name',
                                  hintStyle: TextStyle(color: Colors.black),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your first name';
                                  }
                                  if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                                    return 'Please enter only alphabet characters';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  modal.updateFirstName(value.trim());
                                },
                              );
                            },
                          ),
                          const SizedBox(height: 20),
                          Consumer<RegistrationFormProvider>(
                            builder: (context, modal, child) {
                              return TextFormField(
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0)),
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xffffffff),
                                  hintText: 'Last Name',
                                  hintStyle: TextStyle(color: Colors.black),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your last name';
                                  }
                                  if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                                    return 'Please enter only alphabet characters';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                 modal.updateLastName(value.trim());
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 90),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 5,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              color: const Color.fromARGB(255, 12, 28, 51),
                              onPressed: _nextButtonPressed,
                              child: const Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Text(
                                  "Next",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account? ",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 12, 28, 51),
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Add your onPressed code here!
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 12, 28, 51),
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
