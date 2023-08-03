import 'package:flutter/material.dart';
import 'UIs/screens/profile/profile.dart';

main(){
  runApp(MyApptest());
}

class MyApptest extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,        //remove the debug lable
      home: Profile(),
    );
  }
}