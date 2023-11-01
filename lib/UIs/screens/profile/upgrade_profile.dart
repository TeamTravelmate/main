import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:main/Data/env/env.dart';
import 'profile.dart';
import 'dart:io';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class UpgradeProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Color(0xFF0C1C33)),
            title: Text('Upgrade Profile', style: TextStyle(color: Color(0xFF0C1C33)),),
            bottom: TabBar(
              indicatorWeight: 5.0,
              labelColor: Color(0xFF0C1C33), // Set the color for the selected tab's label
              unselectedLabelColor: Color(0xFF2FACBB),
              indicatorColor: Color(0xFF2FACBB),
              tabs: [
                Tab(text: 'Experience Provider'),
                Tab(text: 'Tour Guide'),
                Tab(text: 'Vendor'),
              ],

              labelStyle: TextStyle(color: Color(0xFF2FACBB)),
            ),
          ),
          body: TabBarView(
            children: [
              Tab1(),
              Tab2(),
              Tab3()
            ],
          ),
        ),
      ),
    );
  }
}

class Tab1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExperienceProviderForm(); // Just return the MyCustomForm widget here
  }
}

// MyCustomForm class should be defined outside the tab1() function
class ExperienceProviderForm extends StatefulWidget {
  @override
  ExperienceProviderFormState createState() {
    return ExperienceProviderFormState();
  }
}

class ExperienceProviderFormState extends State<ExperienceProviderForm> {
  final _formKey = GlobalKey<FormState>();
  late File? _imageFile1;
  late File? _imageFile2;
  String? _imageFileName1;  // For the first image
  String? _imageFileName2;  // For the second image
  List<String> filed = ['Hiking', 'Camping', 'Adventure'];
  late String NIC;
  late String experienceField = 'Hiking';
  late String address;
  late String price;
  late String phone;
  late String num_of_experiences;

  List<String> selectedItems = [];
  final List<String> items = ['English', 'Sinhala', 'Tamil'];

  void _handleCheckboxChange(bool? value, String item) {
    setState(() {
      if (value == true) {
        selectedItems.add(item);
      } else {
        selectedItems.remove(item);
      }
    });
  }

  Future<void> _upgradeToServiceProvider(


      File? imageFile1,
      File? imageFile2,
      String NIC,
      String experienceField,
      String address,
      String price,
      String phone,
      String num_of_experiences) async {
    if (imageFile1 == null || imageFile2 == null) {
      print("Image files not selected.");
      return;
    }

    // Replace 'backendUrl' with your actual backend URL
    final Uri profileUri = Uri.parse('$backendUrl/user/upgrade_service_provider');

    // Create a multipart request
    final request = http.MultipartRequest('POST', profileUri);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    // Set your authorization token
    request.headers['Authorization'] =
    'Bearer $token';

    // Add the image files
    // request.files.add(
    //   await http.MultipartFile.fromPath('file', imageFile1.path),
    // );
    request.files.add(
      await http.MultipartFile.fromPath('file', imageFile2.path),
    );


    // Add other form fields
    request.fields['nic'] = NIC;
    request.fields['num_of_years'] = num_of_experiences;
    request.fields['field'] = experienceField;
    request.fields['price_per_hour'] = price;
    request.fields['address'] = address;
    request.fields['tel_no'] = phone;
    request.fields['language'] = selectedItems.join(',');
    print(request.fields);
    print(request.files);
    try {
      final response = await request.send();
      print('Response status code: ${response.statusCode}');
      final responseBody = await response.stream.bytesToString();
      print('Response body: $responseBody');
    } catch (error) {
      print('Error uploading data: $error');
    }
  }

  Future<void> _pickImage(ImageSource source, int index) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        if (index == 1) {
          _imageFile1 = File(pickedFile.path);
          _imageFileName1 = pickedFile.name;
        } else if (index == 2) {
          _imageFile2 = File(pickedFile.path);
          _imageFileName2 = pickedFile.name;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              'Become an Experience Provider', // Your desired title here
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: SizedBox(
                      width: 340.0,
                      height: 55.0,
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "NIC",
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                        ),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'NIC cannot be empty';
                          }
                          // return null;
                        },
                        onChanged: (text) {
                          setState(() {
                            NIC = text;
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: SizedBox(
                      width: 340.0,
                      height: 55.0,
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          TextFormField(
                            enabled: false,
                            decoration: InputDecoration(
                              labelText: _imageFileName1 ?? "Upload NIC copy",
                              prefixIcon: Icon(Icons.file_copy),
                              border: OutlineInputBorder(),
                            ),
                            validator: (text) {
                              if (_imageFileName1 == null) {
                                return 'NIC copy cannot be empty';
                              }
                              return null;
                            },
                          ),
                          Positioned(
                            right: 0,
                            child: ElevatedButton(
                              onPressed: () async {
                                await _pickImage(ImageSource.gallery, 1);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                elevation: 0,
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                  side: BorderSide(color: Colors.transparent),
                                ),
                              ),
                              child: Icon(
                                Icons.upload,
                                color: Color(0xFF0C1C33),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: SizedBox(
                      width: 340.0,
                      height: 55.0,
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          TextFormField(
                            enabled: false,
                            decoration: InputDecoration(
                              labelText: _imageFileName2 ?? "Upload SLTDA copy",
                              prefixIcon: Icon(Icons.file_copy),
                              border: OutlineInputBorder(),
                            ),
                            validator: (text) {
                              if (_imageFileName2 == null) {
                                return 'SLTDA license copy cannot be empty';
                              }
                              return null;
                            },
                          ),
                          Positioned(
                            right: 0,
                            child: ElevatedButton(
                              onPressed: () async {
                                await _pickImage(ImageSource.gallery, 2);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                elevation: 0,
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                  side: BorderSide(color: Colors.transparent),
                                ),
                              ),
                              child: Icon(
                                Icons.upload,
                                color: Color(0xFF0C1C33),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Select languages that you can', // Your desired title here
                      style: TextStyle(
                        fontSize: 18.0,
                        // Set text alignment to left
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Column(
                    children: items.map((item) {
                      return CheckboxListTile(
                        title: Text(item),
                        value: selectedItems.contains(item),
                        onChanged: (bool? value) {
                          _handleCheckboxChange(value, item);
                        },
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: SizedBox(
                      width: 340.0,
                      height: 55.0,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "No of years experience",
                          prefixIcon: Icon(Icons.book),
                          border: OutlineInputBorder(),
                        ),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'No of years experience cannot be empty';
                          }
                          return null;
                        },
                        onChanged: (text) {
                          setState(() {
                            num_of_experiences = text;
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: SizedBox(
                      width: 340.0,
                      height: 55.0,
                      child: DropdownButtonFormField<String>(
                        value: experienceField,
                        decoration: InputDecoration(
                          labelText: "Experience Field",
                          prefixIcon: Icon(Icons.hail_outlined),
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (newValue) {
                          setState(() {
                            experienceField = newValue!;
                          });
                        },
                        items: filed.map((file) {
                          return DropdownMenuItem<String>(
                            value: file,
                            child: Text(file),
                          );
                        }).toList(),
                        onSaved: (value) {
                          setState(() {
                            experienceField = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: SizedBox(
                      width: 340.0,
                      height: 55.0,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Price per Hour",
                          prefixIcon: Icon(Icons.money),
                          border: OutlineInputBorder(),
                        ),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Price per hour cannot be empty';
                          }
                          return null;
                        },
                        onChanged: (text) {
                          setState(() {
                            price = text;
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: SizedBox(
                      width: 340.0,
                      height: 55.0,
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Address",
                          prefixIcon: Icon(Icons.house),
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (text) {
                          setState(() {
                            address = text;
                          });
                        },
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: SizedBox(
                      width: 340.0,
                      height: 55.0,

                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: "Phone number",
                          prefixIcon: Icon(Icons.phone),
                          border: OutlineInputBorder(),
                        ),


                        validator: (text){
                          if(text!.isEmpty){
                            return 'Phone no Cannot be Empty';
                          }

                          if (text.length < 10) {
                            return 'Value must be at least 10 characters long.';
                          }
                          return null;
                        },

                        onChanged: (text) {
                          setState(() {
                            phone = text;
                          });
                        },

                      ),
                    ),
                  ),

                  Center(
                    child: Container(
                      child: ElevatedButton(
                        onPressed: () async {
                          print('Button Clicked');
                          print(NIC);
                          try {
                            await _upgradeToServiceProvider(_imageFile1, _imageFile2, NIC, experienceField, address,price, phone, num_of_experiences);
                          } catch (e) {
                            print('Error in _upgradeToServiceProvider: $e');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF0C1C33),
                          minimumSize: Size(300.0, 50.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Text('Upgrade Profile', style: TextStyle(fontSize: 18.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}




class Tab2 extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    return TourGuideForm(); // Just return the MyCustomForm widget here
  }
}

// MyCustomForm class should be defined outside the tab1() function
class TourGuideForm extends StatefulWidget {
  @override
  TourGuideFormState createState() {
    return TourGuideFormState();
  }
}

class TourGuideFormState extends State<TourGuideForm> {
  final _formKey = GlobalKey<FormState>();
  late File? _imageFile1;
  late File? _imageFile2;
  String? _imageFileName1;  // For the first image
  String? _imageFileName2;  // For the second image
  // List<String> filed = ['Hiking', 'Camping', 'Adventure'];
  late String NIC;
  // late String experienceField = 'Hiking';
  late String price;
  late String num_of_experiences;

  List<String> selectedItems = [];
  final List<String> items = ['English', 'Sinhala', 'Tamil'];

  void _handleCheckboxChange(bool? value, String item) {
    setState(() {
      if (value == true) {
        selectedItems.add(item);
      } else {
        selectedItems.remove(item);
      }
    });
  }

  Future<void> _upgradeToTourGuide(
      File? imageFile1,
      File? imageFile2,
      String NIC,
      // String experienceField,
      String price,
      String num_of_experiences) async {
    if (imageFile1 == null || imageFile2 == null) {
      print("Image files not selected.");
      return;
    }

    // Replace 'backendUrl' with your actual backend URL
    final Uri profileUri = Uri.parse('$backendUrl/user/upgrade_travelguide');

    // Create a multipart request
    final request = http.MultipartRequest('POST', profileUri);

    // Set your authorization token
    request.headers['Authorization'] =
    'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImZpcnN0TmFtZSI6IkFtYXNoaSIsImxhc3ROYW1lIjoiU2FuZHVuaSIsImVtYWlsIjoiYW1hc2hpQGdtYWlsLmNvbSIsImlhdCI6MTY5ODUyNjAyNywiZXhwIjoxNzAxMTE4MDI3fQ.o33iAm4TldDV-x1Q8AL7UDq3ymLbee_cBX4Sw4C_oW8';

    // Add the image files
    // request.files.add(
    //   await http.MultipartFile.fromPath('file', imageFile1.path),
    // );
    request.files.add(
      await http.MultipartFile.fromPath('file', imageFile2.path),
    );


    // Add other form fields
    request.fields['nic'] = NIC;
    request.fields['num_of_experiences'] = num_of_experiences;
    // request.fields['field'] = experienceField;
    request.fields['price_per_day'] = price;
    // request.fields['tel_no'] = phone;
    request.fields['language'] = selectedItems.join(',');
    print(request.fields);
    print(request.files);
    try {
      final response = await request.send();
      print('Response status code: ${response.statusCode}');
      final responseBody = await response.stream.bytesToString();
      print('Response body: $responseBody');

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Profile Upgrade submitted Successfully'),
            content: Text('Your details has been uploaded successfully.'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the alert dialog
                  // Navigate to the profile screen
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return Profile(); // Replace with your Profile screen widget
                  }));
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } catch (error) {
      print('Error uploading data: $error');
    }
  }

  Future<void> _pickImage(ImageSource source, int index) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        if (index == 1) {
          _imageFile1 = File(pickedFile.path);
          _imageFileName1 = pickedFile.name;
        } else if (index == 2) {
          _imageFile2 = File(pickedFile.path);
          _imageFileName2 = pickedFile.name;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              'Become a Tour Guide', // Your desired title here
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: SizedBox(
                      width: 340.0,
                      height: 55.0,
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "NIC",
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                        ),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'NIC cannot be empty';
                          }
                          // return null;
                        },
                        onChanged: (text) {
                          setState(() {
                            NIC = text;
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: SizedBox(
                      width: 340.0,
                      height: 55.0,
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          TextFormField(
                            enabled: false,
                            decoration: InputDecoration(
                              labelText: _imageFileName1 ?? "Upload NIC copy",
                              prefixIcon: Icon(Icons.file_copy),
                              border: OutlineInputBorder(),
                            ),
                            validator: (text) {
                              if (_imageFileName1 == null) {
                                return 'NIC copy cannot be empty';
                              }
                              return null;
                            },
                          ),
                          Positioned(
                            right: 0,
                            child: ElevatedButton(
                              onPressed: () async {
                                await _pickImage(ImageSource.gallery, 1);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                elevation: 0,
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                  side: BorderSide(color: Colors.transparent),
                                ),
                              ),
                              child: Icon(
                                Icons.upload,
                                color: Color(0xFF0C1C33),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: SizedBox(
                      width: 340.0,
                      height: 55.0,
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          TextFormField(
                            enabled: false,
                            decoration: InputDecoration(
                              labelText: _imageFileName2 ?? "Upload SLTDA copy",
                              prefixIcon: Icon(Icons.file_copy),
                              border: OutlineInputBorder(),
                            ),
                            validator: (text) {
                              if (_imageFileName2 == null) {
                                return 'SLTDA license copy cannot be empty';
                              }
                              return null;
                            },
                          ),
                          Positioned(
                            right: 0,
                            child: ElevatedButton(
                              onPressed: () async {
                                await _pickImage(ImageSource.gallery, 2);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                elevation: 0,
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                  side: BorderSide(color: Colors.transparent),
                                ),
                              ),
                              child: Icon(
                                Icons.upload,
                                color: Color(0xFF0C1C33),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Select languages that you can', // Your desired title here
                      style: TextStyle(
                        fontSize: 18.0,
                        // Set text alignment to left
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Column(
                    children: items.map((item) {
                      return CheckboxListTile(
                        title: Text(item),
                        value: selectedItems.contains(item),
                        onChanged: (bool? value) {
                          _handleCheckboxChange(value, item);
                        },
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: SizedBox(
                      width: 340.0,
                      height: 55.0,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "No of years experience",
                          prefixIcon: Icon(Icons.book),
                          border: OutlineInputBorder(),
                        ),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'No of years experience cannot be empty';
                          }
                          return null;
                        },
                        onChanged: (text) {
                          setState(() {
                            num_of_experiences = text;
                          });
                        },
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(bottom: 20.0),
                  //   child: SizedBox(
                  //     width: 340.0,
                  //     height: 55.0,
                  //     child: DropdownButtonFormField<String>(
                  //       value: experienceField,
                  //       decoration: InputDecoration(
                  //         labelText: "Experience Field",
                  //         prefixIcon: Icon(Icons.hail_outlined),
                  //         border: OutlineInputBorder(),
                  //       ),
                  //       onChanged: (newValue) {
                  //         setState(() {
                  //           experienceField = newValue!;
                  //         });
                  //       },
                  //       items: filed.map((file) {
                  //         return DropdownMenuItem<String>(
                  //           value: file,
                  //           child: Text(file),
                  //         );
                  //       }).toList(),
                  //       onSaved: (value) {
                  //         setState(() {
                  //           experienceField = value!;
                  //         });
                  //       },
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: SizedBox(
                      width: 340.0,
                      height: 55.0,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Price per day",
                          prefixIcon: Icon(Icons.money),
                          border: OutlineInputBorder(),
                        ),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Price per day cannot be empty';
                          }
                          return null;
                        },
                        onChanged: (text) {
                          setState(() {
                            price = text;
                          });
                        },
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(bottom: 20.0),
                  //   child: SizedBox(
                  //     width: 340.0,
                  //     height: 55.0,
                  //     child: TextFormField(
                  //       decoration: InputDecoration(
                  //         labelText: "Address",
                  //         prefixIcon: Icon(Icons.house),
                  //         border: OutlineInputBorder(),
                  //       ),
                  //       onChanged: (text) {
                  //         setState(() {
                  //           address = text;
                  //         });
                  //       },
                  //     ),
                  //   ),
                  // ),

                  // Padding(
                  //   padding: EdgeInsets.only(bottom: 20.0),
                  //   child: SizedBox(
                  //     width: 340.0,
                  //     height: 55.0,
                  //
                  //     child: TextFormField(
                  //       keyboardType: TextInputType.phone,
                  //       decoration: InputDecoration(
                  //         labelText: "Phone number",
                  //         prefixIcon: Icon(Icons.phone),
                  //         border: OutlineInputBorder(),
                  //       ),
                  //
                  //
                  //       validator: (text){
                  //         if(text!.isEmpty){
                  //           return 'Phone no Cannot be Empty';
                  //         }
                  //
                  //         if (text.length < 10) {
                  //           return 'Value must be at least 10 characters long.';
                  //         }
                  //         return null;
                  //       },
                  //
                  //       onChanged: (text) {
                  //         setState(() {
                  //           phone = text;
                  //         });
                  //       },
                  //
                  //     ),
                  //   ),
                  // ),

                  Center(
                    child: Container(
                      child: ElevatedButton(
                        onPressed: () async {
                          print('Button Clicked');
                          print(NIC);
                          try {
                            await _upgradeToTourGuide(_imageFile1, _imageFile2, NIC, price, num_of_experiences);
                          } catch (e) {
                            print('Error in _upgradeToTourGuide: $e');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF0C1C33),
                          minimumSize: Size(300.0, 50.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Text('Upgrade Profile', style: TextStyle(fontSize: 18.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



class Tab3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VendorForm(); // Just return the MyCustomForm widget here
  }
}

// MyCustomForm class should be defined outside the tab1() function
class VendorForm extends StatefulWidget {
  @override
  VendorFormState createState() {
    return VendorFormState();
  }
}

class VendorFormState extends State<VendorForm> {
  final _formKey = GlobalKey<FormState>();
  late File? _imageFile1;
  String? _imageFileName1;  // For the first image
  late String bussiness_reg_no;
  late String phone;
  late String address;



  Future<void> _upgradeToVendor(

      File? imageFile1,
      String bussiness_reg_no,
      String address,
      String phone) async {
    if (imageFile1 == null) {
      print("Image files not selected.");
      return;
    }

    // Replace 'backendUrl' with your actual backend URL
    final Uri profileUri = Uri.parse('$backendUrl/user/upgrade_vendor');

    // Create a multipart request
    final request = http.MultipartRequest('POST', profileUri);

    // Set your authorization token
    request.headers['Authorization'] =
    'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImZpcnN0TmFtZSI6IkFtYXNoaSIsImxhc3ROYW1lIjoiU2FuZHVuaSIsImVtYWlsIjoiYW1hc2hpQGdtYWlsLmNvbSIsImlhdCI6MTY5ODUyNjAyNywiZXhwIjoxNzAxMTE4MDI3fQ.o33iAm4TldDV-x1Q8AL7UDq3ymLbee_cBX4Sw4C_oW8';


    request.files.add(
      await http.MultipartFile.fromPath('file', imageFile1.path),
    );


    // Add other form fields
    request.fields['bussiness_reg_no'] = bussiness_reg_no;
    request.fields['address'] = address;
    request.fields['tel_no'] = phone;

    try {
      final response = await request.send();
      print('Response status code: ${response.statusCode}');
      final responseBody = await response.stream.bytesToString();
      print('Response body: $responseBody');

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('Profile has been successfully updated.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return Profile();
                  }));
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } catch (error) {
      print('Error uploading data: $error');


      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return UpgradeProfile();
                  }));
                },
                child: Text('Retry'),
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> _pickImage(ImageSource source, int index) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        if (index == 1) {
          _imageFile1 = File(pickedFile.path);
          _imageFileName1 = pickedFile.name;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              'Become a Vendor', // Your desired title here
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: SizedBox(
                      width: 340.0,
                      height: 55.0,
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Bussiness register no",
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                        ),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Bussiness no cannot be empty';
                          }
                          // return null;
                        },
                        onChanged: (text) {
                          setState(() {
                            bussiness_reg_no = text;
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: SizedBox(
                      width: 340.0,
                      height: 55.0,
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          TextFormField(
                            enabled: false,
                            decoration: InputDecoration(
                              labelText: _imageFileName1 ?? "Upload license copy",
                              prefixIcon: Icon(Icons.file_copy),
                              border: OutlineInputBorder(),
                            ),
                            validator: (text) {
                              if (_imageFileName1 == null) {
                                return 'License copy cannot be empty';
                              }
                              return null;
                            },
                          ),
                          Positioned(
                            right: 0,
                            child: ElevatedButton(
                              onPressed: () async {
                                await _pickImage(ImageSource.gallery, 1);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                elevation: 0,
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                  side: BorderSide(color: Colors.transparent),
                                ),
                              ),
                              child: Icon(
                                Icons.upload,
                                color: Color(0xFF0C1C33),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: SizedBox(
                      width: 340.0,
                      height: 55.0,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Address",
                          prefixIcon: Icon(Icons.book),
                          border: OutlineInputBorder(),
                        ),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'No of years experience cannot be empty';
                          }
                          return null;
                        },
                        onChanged: (text) {
                          setState(() {
                            address = text;
                          });
                        },
                      ),
                    ),
                  ),




                  Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: SizedBox(
                      width: 340.0,
                      height: 55.0,

                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: "Phone number",
                          prefixIcon: Icon(Icons.phone),
                          border: OutlineInputBorder(),
                        ),


                        validator: (text){
                          if(text!.isEmpty){
                            return 'Phone no Cannot be Empty';
                          }

                          if (text.length < 10) {
                            return 'Value must be at least 10 characters long.';
                          }
                          return null;
                        },

                        onChanged: (text) {
                          setState(() {
                            phone = text;
                          });
                        },

                      ),
                    ),
                  ),

                  Center(
                    child: Container(
                      child: ElevatedButton(
                        onPressed: () async {
                          try {
                            await _upgradeToVendor(_imageFile1, bussiness_reg_no, phone, address);
                          } catch (e) {
                            print('Error in _upgradeToVendor: $e');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF0C1C33),
                          minimumSize: Size(300.0, 50.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Text('Upgrade Profile', style: TextStyle(fontSize: 18.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


OutlineInputBorder myinputborder(){ //return type is OutlineInputBorder
  return OutlineInputBorder( //Outline border type for TextFeild
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
        color: Color(0xFF0C1C33),
        width: 2,
      )
  );
}

OutlineInputBorder myfocusborder(){
  return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
        color:Colors.black26,
        width: 1,
      )
  );
}
