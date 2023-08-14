import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Import image_picker package

// Define FilledButton and ImageSource here

class Uploadpic extends StatefulWidget { // Change to StatefulWidget
  @override
  _UploadpicState createState() => _UploadpicState();
}

class _UploadpicState extends State<Uploadpic> { // Add State
  PickedFile? _imageFile;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Color(0xFF0C1C33)),
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text('Upload Photo', style: TextStyle(color: Color(0xFF0C1C33)),),
          ),
          body: Center(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Wish to be on top of the Leader board?",
                    style: TextStyle(
                    fontSize: 20.0, // Adjust the font size
                    fontWeight: FontWeight.bold, // Make the text bold
                    color: Colors.black, // Change the text color
                  ),),

                  Text("Take a photo and Upload ",
                    style: TextStyle(
                      fontSize: 18.0, // Adjust the font size
                      color: Colors.black, // Change the text color
                    ),
                  ),

                  SizedBox(
                    height:20.0
                  ),

                  Image.asset(
                    'assets/upload.png',
                    width: 350,
                    height: 350,
                    fit: BoxFit.cover,
                  ),

                  SizedBox(
                    height:20.0,
                  ),
                  FilledButton(
                    child: Text('Upload Photo', style: TextStyle(fontSize: 18.0)),
                    onPressed: () {
                      _showBottomSheet(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF0C1C33),
                      minimumSize: Size(180.0, 60.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Rest of your code

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = PickedFile(pickedFile.path);
      });
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
                  "Upload picture using camera",
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
                            fixedSize: Size(150, 50)
                        ),
                        label: Text("Camera"),
                      ),

                    ])
              ],
            )
        );
      },
    );
  }
}
