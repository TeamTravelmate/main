import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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

  late PickedFile? _imageFile;



  List<String> selectedItems = []; // To store the selected items

  final List<String> items = [
    'English',
    'Sinhala',
    'Tamil',
  ];

  void _handleCheckboxChange(bool? value, String item) {
    setState(() {
      if (value == true) {
        selectedItems.add(item);
      } else {
        selectedItems.remove(item);
      }
    });
  }




  List<String> filed = [
    'Hiking',
    'Camping',
    'Adventure'
    // Add more languages as needed
  ];

  late String NIC;
  late FileImage SLTDA;
  String selectedLanguage ='English';
  late String experiences;
  String experience_filed = 'Hiking';
  late String address;
  late String price;
  late String name;


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( // Wrap the Column with SingleChildScrollView
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              'Become a Experience Provider', // Your desired title here
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
                          border: myinputborder(),
                          enabledBorder: myinputborder(),
                          focusedBorder: myfocusborder(),
                        ),

                        validator: (text){
                          if(text!.isEmpty){
                            return 'NIC Cannot be Empty';
                          }
                          return null;
                        },

                        onSaved: (text){
                          NIC= text!;
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
                              labelText: "Upload NIC copy",
                              prefixIcon: Icon(Icons.file_copy),
                              border: myinputborder(),
                              enabledBorder: myinputborder(),
                              focusedBorder: myfocusborder(),
                            ),
                            validator: (text) {
                              if (text!.isEmpty) {
                                return 'NIC Cannot be Empty';
                              }
                              return null;
                            },
                            onSaved: (text) {
                              NIC = text!;
                            },
                          ),
                          Positioned(
                            right: 0,
                            child: ElevatedButton(
                              onPressed: () async {
                                final pickedImage = await _pickImage(ImageSource.gallery);
                                if (pickedImage != null) {
                                  setState(() {
                                    _imageFile = pickedImage as PickedFile?;
                                  });
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                elevation: 0, // Set elevation to 0
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                  side: BorderSide(color: Colors.transparent),
                                ),
                              ),
                              child: Icon(
                                Icons.upload,
                                color: Color(0xFF0C1C33), // Change the color of the button icon
                              ),
                            ),
                          )
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

                  SizedBox(height:10.0),

                  // Padding(
                  //   padding: EdgeInsets.only(bottom: 20.0),
                  //   child: SizedBox(
                  //     width: 340.0,
                  //     height: 55.0,
                  //     child: DropdownButtonFormField<String>(
                  //       value: selectedLanguage,
                  //       decoration: InputDecoration(
                  //         labelText: "Languages",
                  //         prefixIcon: Icon(Icons.language),
                  //         border: myinputborder(),
                  //         enabledBorder: myinputborder(),
                  //         focusedBorder: myfocusborder(),
                  //       ),
                  //       onChanged: (newValue) {
                  //         setState(() {
                  //           selectedLanguage = newValue!;
                  //         });
                  //       },
                  //       items: languages.map((language) {
                  //         return DropdownMenuItem<String>(
                  //           value: language,
                  //           child: Text(language),
                  //         );
                  //       }).toList(),
                  //       // validator: (value) {
                  //       //   if (value == null || value.isEmpty) {
                  //       //     return 'Please select a language';
                  //       //   }
                  //       //   return null;
                  //       // },
                  //       onSaved: (value) {
                  //         selectedLanguage = value!; // Save the selected language to your variable.
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
                          labelText: "No of trips",
                          prefixIcon: Icon(Icons.book),
                          border: myinputborder(),
                          enabledBorder: myinputborder(),
                          focusedBorder: myfocusborder(),
                        ),

                        // validator: (text){
                        //   if(text!.isEmpty){
                        //     return 'Current Password Cannot be Empty';
                        //   }
                        //   return null;
                        // },

                        onSaved: (text){
                          experiences= text!;
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
                        value: experience_filed,
                        decoration: InputDecoration(
                          labelText: "Experience Filed",
                          prefixIcon: Icon(Icons.hail_outlined),
                          border: myinputborder(),
                          enabledBorder: myinputborder(),
                          focusedBorder: myfocusborder(),
                        ),
                        onChanged: (newValue) {
                          setState(() {
                            experience_filed = newValue!;
                          });
                        },
                        items: filed.map((file) {
                          return DropdownMenuItem<String>(
                            value: file,
                            child: Text(file),
                          );
                        }).toList(),
                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return 'Please select a language';
                        //   }
                        //   return null;
                        // },
                        onSaved: (value) {
                          experience_filed = value!; // Save the selected language to your variable.
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
                          border: myinputborder(),
                          enabledBorder: myinputborder(),
                          focusedBorder: myfocusborder(),
                        ),

                        validator: (text){
                          if(text!.isEmpty){
                            return 'Price per hour cannot be empty';
                          }
                          return null;
                        },

                        onSaved: (text){
                          price= text!;
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
                          border: myinputborder(),
                          enabledBorder: myinputborder(),
                          focusedBorder: myfocusborder(),
                        ),

                        // validator: (text){
                        //   if(text!.isEmpty){
                        //     return 'Address Cannot be Empty';
                        //   }
                        //   return null;
                        // },

                        onSaved: (text){
                          address= text!;
                        },

                      ),
                    ),
                  ),

                  Center(
                    child: Container(
                      child: FilledButton(
                        onPressed: () {
                          if(_formKey.currentState!.validate()){
                            _formKey.currentState?.save();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF0C1C33),
                          minimumSize: Size(300.0,50.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0), // Change the radius here
                          ),
                        ),
                        child: Text('Upgrade Profile', style: TextStyle(fontSize: 18.0),),
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

  Future<XFile?> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    return pickedFile;
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


  List<String> languages = [
    'English',
    'Sinhala',
    'Tamil'
    // Add more languages as needed
  ];


  late PickedFile? _imageFile;



  List<String> selectedItems = []; // To store the selected items

  final List<String> items = [
    'English',
    'Sinhala',
    'Tamil',
  ];

  void _handleCheckboxChange(bool? value, String item) {
    setState(() {
      if (value == true) {
        selectedItems.add(item);
      } else {
        selectedItems.remove(item);
      }
    });
  }



  late String NIC;
  late FileImage SLTDA;
  String selectedLanguage ='English';
  late String experiences;
  String experience_filed = 'Hiking';
  late String address;
  late String price;
  late String name;


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( // Wrap the Column with SingleChildScrollView
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
                        border: myinputborder(),
                        enabledBorder: myinputborder(),
                        focusedBorder: myfocusborder(),
                      ),

                      validator: (text){
                        if(text!.isEmpty){
                          return 'NIC Cannot be Empty';
                        }
                        return null;
                      },

                      onSaved: (text){
                        NIC= text!;
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
                            labelText: "Upload NIC copy",
                            prefixIcon: Icon(Icons.file_copy),
                            border: myinputborder(),
                            enabledBorder: myinputborder(),
                            focusedBorder: myfocusborder(),
                          ),
                          validator: (text) {
                            if (text!.isEmpty) {
                              return 'NIC Cannot be Empty';
                            }
                            return null;
                          },
                          onSaved: (text) {
                            NIC = text!;
                          },
                        ),
                        Positioned(
                          right: 0,
                          child: ElevatedButton(
                            onPressed: () async {
                              final pickedImage = await _pickImage(ImageSource.gallery);
                              if (pickedImage != null) {
                                setState(() {
                                  _imageFile = pickedImage as PickedFile?;
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              elevation: 0, // Set elevation to 0
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                                side: BorderSide(color: Colors.transparent),
                              ),
                            ),
                            child: Icon(
                              Icons.upload,
                              color: Color(0xFF0C1C33), // Change the color of the button icon
                            ),
                          ),
                        )
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
                            labelText: "Upload SLTDA License",
                            prefixIcon: Icon(Icons.file_copy),
                            border: myinputborder(),
                            enabledBorder: myinputborder(),
                            focusedBorder: myfocusborder(),
                          ),
                          validator: (text) {
                            if (text!.isEmpty) {
                              return 'NIC Cannot be Empty';
                            }
                            return null;
                          },
                          onSaved: (text) {
                            NIC = text!;
                          },
                        ),
                        Positioned(
                          right: 0,
                          child: ElevatedButton(
                            onPressed: () async {
                              final pickedImage = await _pickImage(ImageSource.gallery);
                              if (pickedImage != null) {
                                setState(() {
                                  _imageFile = pickedImage as PickedFile?;
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              elevation: 0, // Set elevation to 0
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                                side: BorderSide(color: Colors.transparent),
                              ),
                            ),
                            child: Icon(
                              Icons.upload,
                              color: Color(0xFF0C1C33), // Change the color of the button icon
                            ),
                          ),
                        )
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
                  mainAxisAlignment: MainAxisAlignment.center,
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

                SizedBox(height:10.0),

                Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: SizedBox(
                    width: 340.0,
                    height: 55.0,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "No of trips",
                        prefixIcon: Icon(Icons.book),
                        border: myinputborder(),
                        enabledBorder: myinputborder(),
                        focusedBorder: myfocusborder(),
                      ),

                      // validator: (text){
                      //   if(text!.isEmpty){
                      //     return 'Current Password Cannot be Empty';
                      //   }
                      //   return null;
                      // },

                      onSaved: (text){
                        experiences= text!;
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
                //       value: experience_filed,
                //       decoration: InputDecoration(
                //         labelText: "Experience Filed",
                //         prefixIcon: Icon(Icons.hail_outlined),
                //         border: myinputborder(),
                //         enabledBorder: myinputborder(),
                //         focusedBorder: myfocusborder(),
                //       ),
                //       onChanged: (newValue) {
                //         setState(() {
                //           experience_filed = newValue!;
                //         });
                //       },
                //       items: filed.map((file) {
                //         return DropdownMenuItem<String>(
                //           value: file,
                //           child: Text(file),
                //         );
                //       }).toList(),
                //       // validator: (value) {
                //       //   if (value == null || value.isEmpty) {
                //       //     return 'Please select a language';
                //       //   }
                //       //   return null;
                //       // },
                //       onSaved: (value) {
                //         experience_filed = value!; // Save the selected language to your variable.
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
                        labelText: "Price per Day",
                        prefixIcon: Icon(Icons.money),
                        border: myinputborder(),
                        enabledBorder: myinputborder(),
                        focusedBorder: myfocusborder(),
                      ),

                      validator: (text){
                        if(text!.isEmpty){
                          return 'Price per hour cannot be empty';
                        }
                        return null;
                      },

                      onSaved: (text){
                        price= text!;
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
                        border: myinputborder(),
                        enabledBorder: myinputborder(),
                        focusedBorder: myfocusborder(),
                      ),

                      // validator: (text){
                      //   if(text!.isEmpty){
                      //     return 'Address Cannot be Empty';
                      //   }
                      //   return null;
                      // },

                      onSaved: (text){
                        address= text!;
                      },

                    ),
                  ),
                ),

                Center(
                  child: Container(
                    child: FilledButton(
                      onPressed: () {
                        if(_formKey.currentState!.validate()){
                          _formKey.currentState?.save();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF0C1C33),
                        minimumSize: Size(300.0,50.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0), // Change the radius here
                        ),
                      ),
                      child: Text('Upgrade Profile', style: TextStyle(fontSize: 18.0),),
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


  Future<XFile?> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    return pickedFile;
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

  late PickedFile? _imageFile;


  List<String> cateogory = [
    'Tent',
    'Tools',
    // Add more languages as needed
  ];



  late String NIC;
  late FileImage SLTDA;
  String cat ='Tent';
  late String experiences;
  String experience_filed = 'Hiking';
  late String address;
  late String price;
  late String name;


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( // Wrap the Column with SingleChildScrollView
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
                        border: myinputborder(),
                        enabledBorder: myinputborder(),
                        focusedBorder: myfocusborder(),
                      ),

                      validator: (text){
                        if(text!.isEmpty){
                          return 'NIC Cannot be Empty';
                        }
                        return null;
                      },

                      onSaved: (text){
                        NIC= text!;
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
                            labelText: "Upload NIC copy",
                            prefixIcon: Icon(Icons.file_copy),
                            border: myinputborder(),
                            enabledBorder: myinputborder(),
                            focusedBorder: myfocusborder(),
                          ),
                          validator: (text) {
                            if (text!.isEmpty) {
                              return 'NIC Cannot be Empty';
                            }
                            return null;
                          },
                          onSaved: (text) {
                            NIC = text!;
                          },
                        ),
                        Positioned(
                          right: 0,
                          child: ElevatedButton(
                            onPressed: () async {
                              final pickedImage = await _pickImage(ImageSource.gallery);
                              if (pickedImage != null) {
                                setState(() {
                                  _imageFile = pickedImage as PickedFile?;
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              elevation: 0, // Set elevation to 0
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                                side: BorderSide(color: Colors.transparent),
                              ),
                            ),
                            child: Icon(
                              Icons.upload,
                              color: Color(0xFF0C1C33), // Change the color of the button icon
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),






                // Padding(
                //   padding: EdgeInsets.only(bottom: 20.0),
                //   child: SizedBox(
                //     width: 340.0,
                //     height: 55.0,
                //     child: DropdownButtonFormField<String>(
                //       value: cat,
                //       decoration: InputDecoration(
                //         labelText: "Category",
                //         prefixIcon: Icon(Icons.category),
                //         border: myinputborder(),
                //         enabledBorder: myinputborder(),
                //         focusedBorder: myfocusborder(),
                //       ),
                //       onChanged: (newValue) {
                //         setState(() {
                //           cat = newValue!;
                //         });
                //       },
                //       items: cateogory.map((language) {
                //         return DropdownMenuItem<String>(
                //           value: language,
                //           child: Text(language),
                //         );
                //       }).toList(),
                //       // validator: (value) {
                //       //   if (value == null || value.isEmpty) {
                //       //     return 'Please select a language';
                //       //   }
                //       //   return null;
                //       // },
                //       onSaved: (value) {
                //         cat = value!; // Save the selected language to your variable.
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
                      decoration: InputDecoration(
                        labelText: "Address",
                        prefixIcon: Icon(Icons.house),
                        border: myinputborder(),
                        enabledBorder: myinputborder(),
                        focusedBorder: myfocusborder(),
                      ),

                      // validator: (text){
                      //   if(text!.isEmpty){
                      //     return 'Address Cannot be Empty';
                      //   }
                      //   return null;
                      // },

                      onSaved: (text){
                        address= text!;
                      },

                    ),
                  ),
                ),

                Center(
                  child: Container(
                    child: FilledButton(
                      onPressed: () {
                        if(_formKey.currentState!.validate()){
                          _formKey.currentState?.save();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF0C1C33),
                        minimumSize: Size(300.0,50.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0), // Change the radius here
                        ),
                      ),
                      child: Text('Upgrade Profile', style: TextStyle(fontSize: 18.0),),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Future<XFile?> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    return pickedFile;
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
