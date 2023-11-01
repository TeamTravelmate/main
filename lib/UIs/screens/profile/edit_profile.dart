import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:main/Data/env/env.dart';
import 'profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';




void main() {
  runApp(MaterialApp(home: EditProfile()));
}

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? _imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF0C1C33)),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text('Edit Profile', style: TextStyle(color: Color(0xFF0C1C33)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 50.0),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageProfile(_imageFile, (file) {
                    setState(() {
                      _imageFile = file;
                    });
                  }),
                  // ... Rest of your UI
                ],
              ),
            ),
            EditProfileForm(_imageFile),
          ],
        ),
      ),
    );
  }
}

class ImageProfile extends StatefulWidget {
  final File? imageFile;
  final Function(File?) onImageSelected;

  ImageProfile(this.imageFile, this.onImageSelected);

  @override
  _ImageProfileState createState() => _ImageProfileState();
}

class _ImageProfileState extends State<ImageProfile> {
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      widget.onImageSelected(File(pickedFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          CircleAvatar(
            radius: 70.0,
            backgroundImage: widget.imageFile != null
                ? FileImage(widget.imageFile!)
                : AssetImage('assets/profile_pic.jpeg') as ImageProvider,
          ),
          Positioned(
            bottom: 5.0,
            right: 2.0,
            child: InkWell(
              onTap: () {
                _showBottomSheet(context);
              },
              child: Icon(
                Icons.camera_alt,
                color: Colors.grey,
                size: 28.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 120.0,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            children: <Widget>[
              Text(
                "Choose Profile Photo",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FilledButton.icon(
                    icon: Icon(Icons.camera),
                    onPressed: () {
                      _pickImage(ImageSource.camera);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF0C1C33),
                      fixedSize: Size(150, 50),
                    ),
                    label: Text("Camera"),
                  ),
                  FilledButton.icon(
                    icon: Icon(Icons.image),
                    onPressed: () {
                      _pickImage(ImageSource.gallery);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF0C1C33),
                      fixedSize: Size(150, 50),
                    ),
                    label: Text("Gallery"),
                  ),
                ],
              ),
            ],),
        );
      },
    );
  }
}

class EditProfileForm extends StatefulWidget {
  final File? imageFile;

  EditProfileForm(this.imageFile);

  @override
  EditProfileFormState createState() {
    return EditProfileFormState();
  }
}

class EditProfileFormState extends State<EditProfileForm> {
  final _formKey = GlobalKey<FormState>();
  late String firstname;
  late String lastname;
  late String username;
  late String phone;

  late String email;
  late String pro;

  Future<void> _loadUserProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token'); // Replace with your token storage key

    if (token != null && JwtDecoder.isExpired(token) == false) {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      setState(() {

        email = decodedToken['email'];


      });
    } else {
      // Handle the case when the token is missing or expired
      print('Token is missing or expired.');
    }
  }

  @override
  void initState() {
    super.initState();
    _loadUserProfileData();
  }

  Future<void> _uploadImage(File? imageFile, String firstname, String lastname, String username, String phone) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');



    print('sew');
    if (imageFile == null) {
      // Handle the case when no image is selected
      print('No image selected.');
      return;
    }

    try {
      final Uri profileUri = Uri.parse('$backendUrl/user/editProfile');
      print(backendUrl);
      print(profileUri);
      var request = http.MultipartRequest('PUT', profileUri);
      request.headers['Authorization'] = 'Bearer $token'; // Replace with your authentication token
      request.files.add(await http.MultipartFile.fromPath('file', imageFile.path));

      request.fields['firstName'] = firstname;
      request.fields['lastName'] = lastname;
      request.fields['userName'] = username;
      request.fields['phoneNo'] = phone;
      print(await http.MultipartFile.fromPath('file', imageFile.path));
      print(request);
      request.fields.forEach((key, value) {
        print('$key: $value');
      });
      var response = await request.send();
      print("sachini");


      if (response.statusCode == 200) {
        print('Upload successful');
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Edit Profile Successfully'),
              content: Text('Your profile has been updated successfully.'),
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
      } else {
        print('Error uploading image: ${response.statusCode}');
      }
    } catch (error) {
      print('Error uploading image: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        margin: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: SizedBox(
                width: 340.0,
                height: 55.0,

                //edit firstname
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "First name",
                    prefixIcon: Icon(Icons.people),
                    border: myinputborder(),
                    enabledBorder: myinputborder(),
                    focusedBorder: myfocusborder(),
                  ),

                  validator: (text){
                    if(text!.isEmpty){
                      return 'Name Cannot be Empty';
                    }
                    return null;
                  },

                  onSaved: (text){
                    firstname= text!;
                  },
                ),
              ),
            ),



            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: SizedBox(
                width: 340.0,
                height: 55.0,

                //edit lastname
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Last name",
                    prefixIcon: Icon(Icons.people),
                    border: myinputborder(),
                    enabledBorder: myinputborder(),
                    focusedBorder: myfocusborder(),
                  ),

                  validator: (text){
                    if(text!.isEmpty){
                      return 'Last Name Cannot be Empty';
                    }
                    return null;
                  },

                  onSaved: (text){
                    lastname= text!;
                  },

                ),
              ),
            ),



            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: SizedBox(
                width: 340.0,
                height: 55.0,

                //edit username
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Nick name",
                    prefixIcon: Icon(Icons.people),
                    border: myinputborder(),
                    enabledBorder: myinputborder(),
                    focusedBorder: myfocusborder(),
                  ),

                  validator: (text){
                    if(text!.isEmpty){
                      return 'Username Cannot be Empty';
                    }
                    return null;
                  },

                  onSaved: (text){
                    username= text!;
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
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: email,
                    prefixIcon: Icon(Icons.lock),
                    border: myinputborder(),
                    enabledBorder: myinputborder(),
                    focusedBorder: myfocusborder(),
                  ),
                  enabled : false,

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
                    border: myinputborder(),
                    enabledBorder: myinputborder(),
                    focusedBorder: myfocusborder(),
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

                  onSaved: (text){
                    phone= text!;
                  },

                ),
              ),
            ),

            SizedBox(
              height: 50,
            ),
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 15.0),
                    child: FilledButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState?.save();
                          if (widget.imageFile != null) {
                            await _uploadImage(
                              widget.imageFile,
                              firstname,
                              lastname,
                              username,
                              phone,

                            );
                          } else {
                            // Handle the case when no image is selected
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF0C1C33),
                        minimumSize: Size(300.0,50.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text('Save', style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ),

                  FilledButton(
                    onPressed: () {
                      // Navigator.of(context).push(MaterialPageRoute(builder: (_){
                      //   return ChangePassword();
                      // }));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF0C1C33),
                      minimumSize: Size(300.0,50.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0), // Change the radius here
                      ),
                    ),
                    child: Text('Update Password', style: TextStyle(fontSize: 18.0),),
                  )
                ],
              ),
            ),
          ],
        ),
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