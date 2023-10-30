import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:main/Data/env/env.dart';

class NewPost extends StatefulWidget {
  @override
  _NewPost createState() => _NewPost();
}

class _NewPost extends State<NewPost> {
  File? _imageFile;
  late String _selectedDropdownValue;
  late String _experience;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Add a GlobalKey for the form

  Future<void> _createpost(File? imageFile, String content) async {
    if (imageFile == null) {
      // Handle the case when no image is selected
      print('No image selected.');
      return;
    }

    try {
      final Uri profileUri = Uri.parse('$backendUrl/user/createPost');
      var request = http.MultipartRequest('POST', profileUri);
      request.headers['Authorization'] = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImZpcnN0TmFtZSI6ImFtYXNoaSIsImxhc3ROYW1lIjoiYWJleSIsImVtYWlsIjoiYW1hc2hpQGdtYWlsLmNvbSIsImlhdCI6MTY5ODU4ODk5NSwiZXhwIjoxNzAxMTgwOTk1fQ.xbi0oNYGQG3V2b8OsREpiOpfFmgCt2DFxThwn7kJxdE';
      request.files.add(await http.MultipartFile.fromPath('file', imageFile.path));

      request.fields['content'] = _experience;
      print(_experience);

      print(await http.MultipartFile.fromPath('file', imageFile.path));
      print(request);
      var response = await request.send();
      print("sachini");

      if (response.statusCode == 200) {
        print('Upload successful');
      } else {
        print('Error uploading image: ${response.statusCode}');
      }
    } catch (error) {
      print('Error uploading image: $error');
    }
  }

  void onImageSelected(File? imageFile) {
    setState(() {
      _imageFile = imageFile;
    });
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      onImageSelected(File(pickedFile.path));
    }
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
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF0C1C33)),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Create New Post',
          style: TextStyle(color: Color(0xFF0C1C33)),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top:20.0, left:15.0, bottom:15.0),
        padding: EdgeInsets.all(5.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundColor: Colors.grey[200],
                  backgroundImage: AssetImage('assets/profile_pic.jpeg'),
                ),
                SizedBox(width: 8.0),
                Text(
                  'Sheromi Zoyza',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(width: 30.0),

                // Expanded(
                //   child: Container(
                //     width:30.0,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(30),
                //       border: Border.all(color: Colors.black, width: 2),
                //     ),
                //     child: DropdownButton<String>(
                //       isExpanded: true,
                //       value: _selectedDropdownValue ?? 'EveryOne',
                //       onChanged: (String? newValue) {
                //         setState(() {
                //           _selectedDropdownValue = newValue;
                //         });
                //       },
                //       items: <String>['EveryOne', 'Onlyme', 'Friends']
                //           .map<DropdownMenuItem<String>>((String value) {
                //         return DropdownMenuItem<String>(
                //           value: value,
                //           child: Padding(
                //             padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                //             child: Text(value),
                //           ),
                //         );
                //       }).toList(),
                //       icon: Icon(Icons.arrow_downward),
                //       iconSize: 24,
                //       style: TextStyle(color: Colors.black, fontSize: 16),
                //       hint: Text('Select an option'),
                //       isDense: true,
                //       itemHeight: 50,
                //       elevation: 8,
                //       underline: Container(
                //         height: 0,
                //         width: 5.0,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),

            SizedBox(height:10.0),

            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Divider(
                height: 1,
                color: Colors.grey,
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Form( // Wrap the form around the input fields
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          height: 70.0,
                          width: double.infinity,
                          child: TextFormField( // Change TextField to TextFormField
                            decoration: InputDecoration.collapsed(hintText: "What's your travel experience"),
                            onChanged: (enteredText) {
                              setState(() {
                                _experience = enteredText;
                              });
                            },
                          ),
                        ),
                        Container(
                          width: 300.0,
                          height: 300.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.grey[200],
                          ),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              if (_imageFile != null)
                                Image.file(_imageFile!, fit: BoxFit.cover),
                              if (_imageFile == null)
                                Center(
                                  child: Text(
                                    "No Photo",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          children:[
                            Container(
                              margin: EdgeInsets.only(left:5.0, top:16.0),
                              child: Transform.scale(
                                scale: 0.8,
                                child: FloatingActionButton(
                                  onPressed: () {
                                    _showBottomSheet(context);
                                  },
                                  child: Icon(Icons.photo, size:30),
                                  backgroundColor: Color(0xFF0C1C33),
                                  foregroundColor: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left:5.0, top:16.0),
                              child: Transform.scale(
                                scale: 0.8,
                                child: FloatingActionButton(
                                  onPressed: () {
                                    // Your button's onPressed function here...
                                  },
                                  child: Icon(Icons.location_pin, size:30),
                                  backgroundColor: Color(0xFF0C1C33),
                                  foregroundColor: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left:5.0, top:16.0),
                              child: Transform.scale(
                                scale: 0.8,
                                child: FloatingActionButton(
                                  onPressed: () {
                                    // Your button's onPressed function here...
                                  },
                                  child: Icon(Icons.emoji_emotions_outlined, size:30),
                                  backgroundColor: Color(0xFF0C1C33),
                                  foregroundColor: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left:5.0, top:16.0),
                              child: FilledButton(
                                child: Text('Post', style: TextStyle(fontSize: 15.0)),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState?.save();
                                    if (_imageFile != null) {
                                      await _createpost(
                                        _imageFile,
                                        _experience,
                                      );
                                    } else {
                                      // Handle the case when no image is selected
                                    }
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF0C1C33),
                                  minimumSize: Size(100.0, 40.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
