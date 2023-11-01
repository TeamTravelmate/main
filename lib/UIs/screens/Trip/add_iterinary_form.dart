import 'dart:io';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main/UIs/screens/Trip/tripView_page.dart';
import 'package:main/UIs/screens/addCard/paycard.dart';
import 'package:main/UIs/widgets/button_widget.dart';
import '../../themes/colors.dart';
import '../../widgets/inputField_widget.dart';

class AddIterinaryForm extends StatefulWidget {
  @override
  _AddIterinaryFormState createState() => _AddIterinaryFormState();
}

class _AddIterinaryFormState extends State<AddIterinaryForm> {
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
          'Add Iterinary',
          style: TextStyle(color: Colors.black),
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
                    Text('Add destinations to your trip',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: ColorsTravelMate.primary)),
                    const SizedBox(
                      height: 20,
                    ),
                    DropDownTextField(
                      initialValue: "Day 1",
                      // controller: _cnt,
                      clearOption: true,
                      validator: (value) {
                        if (value == null) {
                          return "Required field";
                        } else {
                          return null;
                        }
                      },
                      dropDownItemCount: 3,

                      dropDownList: const [
                        DropDownValueModel(name: 'Day 1', value: "Day 1"),
                        DropDownValueModel(name: 'Day 2', value: "Day 2"),
                        DropDownValueModel(name: 'Day 3', value: "Day 3"),
                      ],
                      onChanged: (val) {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldWidget(
                      labelText: 'Destination',
                      hintText: 'Eg. Unawatuna Beach',
                      prefixIcon: const Icon(Icons.location_on_rounded),
                      validator: (val) {
                        if (val!.isBlank) {
                          return 'field cannot be empty';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldWidget(
                      labelText: 'Activity',
                      hintText: 'Eg. hiking, surfing, etc',
                      prefixIcon: const Icon(Icons.hiking),
                      validator: (val) {
                        if (val!.isBlank) {
                          return 'field cannot be empty';
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    buttonWidget(
                        width: double.infinity,
                        labelText: 'Add Iterinary',
                        path: joinedTripView(
                          tripId: 1,
                        ))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
