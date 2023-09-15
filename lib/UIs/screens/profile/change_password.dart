import 'package:flutter/material.dart';

class ChangePassword extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF0C1C33)),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text('Update Password', style: TextStyle(color: Color(0xFF0C1C33)),),

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
                  CircleAvatar(
                      radius: 70.0,
                      backgroundImage:
                      // _imageFile == null?
                      AssetImage('assets/profile_pic.jpeg')
                    // : FileImage(File(_imageFile.path)),

                  ),

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

            ChangePasswordForm(),
          ],
        ),


      ),
    );
  }
}

class ChangePasswordForm extends StatefulWidget {
  @override
  ChangePasswordFormState createState() {
    return ChangePasswordFormState();
  }
}

class ChangePasswordFormState extends State<ChangePasswordForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  late String current;
  late String new1;
  late String new2;

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
                  decoration: InputDecoration(
                    labelText: "Current Password",
                    prefixIcon: Icon(Icons.lock),
                    border: myinputborder(),
                    enabledBorder: myinputborder(),
                    focusedBorder: myfocusborder(),
                  ),

                  obscureText: true,


                  validator: (text){
                    if(text!.isEmpty){
                      return 'Current Password Cannot be Empty';
                    }
                    return null;
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
                    labelText: "New Password",
                    prefixIcon: Icon(Icons.lock),
                    border: myinputborder(),
                    enabledBorder: myinputborder(),
                    focusedBorder: myfocusborder(),
                  ),

                  obscureText: true,

                  validator: (text){
                    if(text!.isEmpty){
                      return 'New Password Cannot be Empty';
                    }
                    return null;
                  },

                  onSaved: (text){
                    new1= text!;
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
                    labelText: "Re-enter Current Password",
                    prefixIcon: Icon(Icons.lock),
                    border: myinputborder(),
                    enabledBorder: myinputborder(),
                    focusedBorder: myfocusborder(),
                  ),

                  obscureText: true,


                  validator: (text){
                    if(text!.isEmpty){
                      return 'Re-enter Password Cannot be Empty';
                    } else {
                      onSaved: (text){
                        new2= text!;
                      };

                      if(new1!= new2){
                        return 'not matched';
                      }
                      else{
                        return null;
                      }
                    }

                  },


                ),
              ),
            ),



            // Padding(
            //   padding: EdgeInsets.only(bottom: 20.0),
            //   child: SizedBox(
            //     width: 340.0,
            //     height: 55.0,
            //
            //     child: TextFormField(
            //       obscureText: true,
            //       decoration: InputDecoration(
            //         labelText: "Password",
            //         prefixIcon: Icon(Icons.lock),
            //         border: myinputborder(),
            //         enabledBorder: myinputborder(),
            //         focusedBorder: myfocusborder(),
            //       ),
            //
            //       validator: (text){
            //         if(text!.isEmpty){
            //           return 'Password Cannot be Empty';
            //         }
            //         return null;
            //       },
            //
            //
            //     ),
            //   ),
            // ),

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
                        child: Text('Update Password', style: TextStyle(fontSize: 18.0),),
                      ),
                    ),

                    // FilledButton(
                    //   onPressed: (){},
                    //   style: ElevatedButton.styleFrom(
                    //     primary: Color(0xFF0C1C33),
                    //     minimumSize: Size(300.0,50.0),
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(10.0), // Change the radius here
                    //     ),
                    //   ),
                    //   child: Text('Update Password', style: TextStyle(fontSize: 18.0),),
                    // )
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