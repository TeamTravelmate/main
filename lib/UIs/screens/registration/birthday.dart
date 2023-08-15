// ignore_for_file: unnecessary_const

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:main/Domain/provider/register_form_provider.dart';
import 'package:provider/provider.dart';
import 'gender.dart';

class Birthday extends StatefulWidget {
  const Birthday({super.key});

  @override
  State<Birthday> createState() => _BirthdayState();
}

class _BirthdayState extends State<Birthday> {
  final _formKey = GlobalKey<FormState>();
  
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime currentDate = DateTime.now();
    final DateTime minDate =
        currentDate.subtract(const Duration(days: 365 * 13));


    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900, 8),
      lastDate: currentDate,
      selectableDayPredicate: (DateTime date) {
        return date.isBefore(currentDate);
      },
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        print("state changed to ");
      });

      // Calculate age
      int age = currentDate.year - picked.year;
      if (currentDate.month < picked.month ||
          (currentDate.month == picked.month && currentDate.day < picked.day)) {
        age--;
      }

      if (age < 13) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("You must be at least 13 years old."),
          ),
        );
        return;
      }

      print(selectedDate);

    } else {
      print("Date not selected");
    }
  }

  void _nextButtonPressed() {
    _formKey.currentState!.save();

    final modal = context.read<RegistrationFormProvider>();
    print("THis os");

    // if (modal.birthday == DateTime.now()) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(
    //       content: Text("Please select a date of birth."),
    //     ),
    //   );
    // }

    // final DateTime currentDate = DateTime.now();
    // int age = currentDate.year - modal.birthday.year;
    // if (currentDate.month < modal.birthday.month ||
    //     (currentDate.month == modal.birthday.month &&
    //         currentDate.day < modal.birthday.day)) {
    //   age--;
    // }

    // if (age < 13) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(
    //       content: Text("You must be at least 13 years old."),
    //     ),
    //   );
    //   return;
    // }

    // Navigate to the next screen (replace 'NextScreen' with the actual screen you want to navigate to)
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Gender()), // Replace with actual screen
    );
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
                            'When is your birthday?',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Choose your date of birth. Don’t worry this will not be public. You have to become at least 16 years old.',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Consumer<RegistrationFormProvider>(
                              builder: (context, modal, child) {
                            return GestureDetector(
                              onTap: () => _selectDate(context),
                              child: AbsorbPointer(
                                child: TextFormField(
                                  onChanged: (value) {
                                    modal.updateBirthday(value as DateTime);
                                    print(modal.birthday);
                                  },
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                  decoration: const InputDecoration(
                                      filled: true,
                                      fillColor: Color(0xffffffff),
                                      hintText: 'Birthday',
                                      hintStyle: TextStyle(color: Colors.black),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      prefixIcon: Icon(Icons.calendar_today)),
                                  controller: TextEditingController(
                                    text: DateFormat('yyyy-MM-dd')
                                        .format(selectedDate),
                                  ),
                                ),
                              ),
                            );
                          }),
                          const SizedBox(height: 20),
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
