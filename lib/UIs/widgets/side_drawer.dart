import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:main/UIs/screens/Welcome/welcome.dart';
import 'package:main/UIs/screens/profile/myTrips.dart';
import 'package:main/UIs/themes/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({super.key});  

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
   late String _loggedUserFullName = "Guest User";


  @override
  void initState() {
    super.initState();
    _loadLoggedInUserName;
  }
  
  Future<void> _loadLoggedInUserName() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var jwtToken = prefs.getString('token');
  if (jwtToken != null) {
    print("JWT Token: $jwtToken"); // Debugging line
    Map<String, dynamic> decodedToken = JwtDecoder.decode(jwtToken);
    print("Decoded Token: $decodedToken"); // Debugging line
    setState(() {
      _loggedUserFullName = decodedToken['firstName'] + " " + decodedToken['lastName'];
    });
  } else {
    print("No JWT Token found."); // Debugging line
  }
}

  void _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Remove the token from shared preferences to simulate logging out
    prefs.clear();

    // Navigate to the "Welcome" screen
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Welcome()));
  }



  @override
  Widget build(BuildContext context) {
    
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
           DrawerHeader(
            decoration: const BoxDecoration(
                color: ColorsTravelMate.secundary,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/img/cover2.jpg'))),
            child: Text(
              _loggedUserFullName,
              style: const TextStyle(color: ColorsTravelMate.primary, fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.input),
            title: const Text('Welcome'),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.verified_user),
            title: const Text('Profile'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('My Trips'),
            onTap: () => {Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MyTripsList()))},
          ),
          ListTile(
            leading: const Icon(Icons.border_color),
            title: const Text('Feedback'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: _logout
          ),
        ],
      ),
    );
  }
}