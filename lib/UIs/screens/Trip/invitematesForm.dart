import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main/UIs/screens/addCard/paycard.dart';
import '../../themes/colors.dart';
import '../../widgets/inputField_widget.dart';

class inviteMateForm extends StatefulWidget {
  @override
  _inviteMateFormState createState() => _inviteMateFormState();
}

class _inviteMateFormState extends State<inviteMateForm> {
  final formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
              Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Invite Tripmates',
          style: TextStyle(
              color: Colors.black
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Row(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: [
                    //           ElevatedButton(
                    //             onPressed: () {},
                    //             style: TextButton.styleFrom(
                    //               backgroundColor: Colors.grey.shade200,
                    //               foregroundColor:
                    //                   const Color.fromARGB(255, 69, 68, 68),
                    //             ),
                    //             child: const Text('Can Edit'),
                    //           ),
                    //           const SizedBox(
                    //             width: 20,
                    //           ),
                    //           ElevatedButton(
                    //             onPressed: () {},
                    //             style: TextButton.styleFrom(
                    //               backgroundColor: Colors.white,
                    //               foregroundColor:
                    //                   const Color.fromARGB(255, 69, 68, 68),
                    //             ),
                    //             child: const Text('View Only'),
                    //           )
                    //         ],
                    //       ),
                    Text('Invite tripmates By Email Address',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: ColorsTravelMate.primary)),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFieldWidget(
                            labelText: 'Invite By Email Address',
                            hintText: 'Email Address',
                            prefixIcon: const Icon(Icons.email),
                            validator: (val) {
                              if (val!.isBlank && !val.isValidEmail) return 'Enter valid email';
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  FloatingActionButton(
                                    onPressed: () {},
                                    backgroundColor: const Color(0xffE0E0E0),
                                    foregroundColor:
                                        const Color.fromARGB(255, 69, 68, 68),
                                    child: const Icon(Icons.link),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 5),
                                  ),
                                  const Text(
                                    'Copy Link',
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Color.fromARGB(255, 69, 68, 68)),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Column(
                                children: [
                                  FloatingActionButton(
                                    onPressed: () {},
                                    backgroundColor: const Color(0xffE0E0E0),
                                    foregroundColor:
                                        const Color.fromARGB(255, 69, 68, 68),
                                    child: const Icon(Icons.message),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 5),
                                  ),
                                  const Text(
                                    'Text',
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Color.fromARGB(255, 69, 68, 68)),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Column(
                                children: [
                                  FloatingActionButton(
                                    onPressed: () {},
                                    backgroundColor: const Color(0xffE0E0E0),
                                    foregroundColor:
                                        const Color.fromARGB(255, 69, 68, 68),
                                    child: const Icon(Icons.upload),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 5),
                                  ),
                                  const Text(
                                    'Other',
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Color.fromARGB(255, 69, 68, 68)),
                                  ),
                                ],
                              ),
                            ],
                          ),  
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}