import 'package:flutter/material.dart';

class Getting_Started extends StatelessWidget {
  const Getting_Started({Key? key});

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Getting Started',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Have you ever traveled in Sri Lanka?',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            SizedBox(width: 10),
                            RoundedOptionWidget(
                              text: 'Yes',
                              onTap: () {
                                // Handle 'Yes' option tap here
                              },
                            ),
                            SizedBox(width: 20),
                            RoundedOptionWidget(
                              text: 'No',
                              onTap: () {
                                // Handle 'No' option tap here
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Text(
                          'What do you wish to experience in Sri Lanka?',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  RoundedOptionWidget(
                                    text: 'Wildlife',
                                    onTap: () {
                                      // Handle 'Wildlife' option tap here
                                    },
                                  ),
                                  SizedBox(height: 10),
                                  RoundedOptionWidget(
                                    text: 'Beach',
                                    onTap: () {
                                      // Handle 'Beach' option tap here
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  RoundedOptionWidget(
                                    text: 'Adventures',
                                    onTap: () {
                                      // Handle 'Adventures' option tap here
                                    },
                                  ),
                                  SizedBox(height: 10),
                                  RoundedOptionWidget(
                                    text: 'Culture',
                                    onTap: () {
                                      // Handle 'Cultural & Heritage' option tap here
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  RoundedOptionWidget(
                                    text: 'Mountains',
                                    onTap: () {
                                      // Handle 'Mountains' option tap here
                                    },
                                  ),
                                  SizedBox(height: 10),
                                  RoundedOptionWidget(
                                    text: 'Ayurveda ',
                                    onTap: () {
                                      // Handle 'Ayurveda Wellness' option tap here
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        // SizedBox(height: 10),
                        // Row(
                        //   children: [
                        //     Expanded(
                        //       child: Column(
                        //         children: [
                        //           RoundedOptionWidget(
                        //             text: 'Foods',
                        //             onTap: () {
                        //               // Handle 'Foods' option tap here
                        //             },
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        SizedBox(height: 30),
                        Text(
                          'Which kind of activities you like to do?',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  RoundedOptionWidget(
                                    text: 'Hiking',
                                    onTap: () {
                                      // Handle 'Wildlife' option tap here
                                    },
                                  ),
                                  SizedBox(height: 10),
                                  RoundedOptionWidget(
                                    text: 'Surfing',
                                    onTap: () {
                                      // Handle 'Beach' option tap here
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  RoundedOptionWidget(
                                    text: 'Diving',
                                    onTap: () {
                                      // Handle 'Adventures' option tap here
                                    },
                                  ),
                                  SizedBox(height: 10),
                                  RoundedOptionWidget(
                                    text: 'Camping',
                                    onTap: () {
                                      // Handle 'Cultural & Heritage' option tap here
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  RoundedOptionWidget(
                                    text: 'Rowing',
                                    onTap: () {
                                      // Handle 'Mountains' option tap here
                                    },
                                  ),
                                  SizedBox(height: 10),
                                  RoundedOptionWidget(
                                    text: 'Cycling',
                                    onTap: () {
                                      // Handle 'Ayurveda Wellness' option tap here
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
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
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Getting_Started(),
                                ),
                              );
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                "Next",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account? ",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 12, 28, 51),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
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
        ],
      ),
    );
  }
}

class RoundedOptionWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  RoundedOptionWidget({
    required this.text,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100, // Set desired width for the option
        height: 50, // Set desired height for the option
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(10), // Set border radius for the option
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
      ),
    );
  }
}
