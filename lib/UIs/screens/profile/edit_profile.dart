import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'change_password.dart';


class EditProfile extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF0C1C33)),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text('Edit Profile', style: TextStyle(color: Color(0xFF0C1C33)),),

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
                  ImageProfile(),

                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text('Sheromi Zoysa', style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Text('@sheromi99', style: TextStyle(fontSize: 15)),
                  ),
                ],
              ),

            ),

            EditProfileForm(),
          ],
        ),


      ),
    );
  }
}


class ImageProfile extends StatefulWidget {
  @override
  _ImageProfileState createState() => _ImageProfileState();
}


class _ImageProfileState extends State<ImageProfile> {
  // late PickedFile _imageFile;
  // final ImagePicker _picker = ImagePicker();


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          CircleAvatar(
              radius: 70.0,
              backgroundImage:
              // _imageFile == null?
              AssetImage('assets/profile_pic.jpeg')
            // : FileImage(File(_imageFile.path)),

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


  PickedFile? _imageFile;

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
            width: MediaQuery
                .of(context)
                .size
                .width,
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
                            fixedSize: Size(150, 50)
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
                            fixedSize: Size(150, 50)
                        ),
                        label: Text("Gallery"),
                      ),
                    ])
              ],
            )
        );
      },
    );


  }

}







class EditProfileForm extends StatefulWidget {
  @override
  EditProfileFormState createState() {
    return EditProfileFormState();
  }
}

class EditProfileFormState extends State<EditProfileForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  late String name;
  late String phone;
  late String email;

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
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
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Sheromi Zoysa",
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
                    name= text!;
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
                    labelText: "sheromi@gmail.com",
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
                    labelText: "0719628544",
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
                  children:[
                    Padding(
                      padding: EdgeInsets.only(bottom: 15.0),
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
                        child: Text('Save', style: TextStyle(fontSize: 18.0),),
                      ),
                    ),

                    FilledButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_){
                          return ChangePassword();
                        }));
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
                  ]
              ),
            )
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


