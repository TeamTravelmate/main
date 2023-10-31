import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:main/Domain/provider/user_auth_provider.dart';
import 'package:main/UIs/screens/Ad%20Mate/ad_mate_res.dart';
import 'package:main/UIs/screens/Welcome/welcome.dart';
import 'package:main/UIs/screens/emergency_support/emergency_support_home.dart';
import 'package:main/UIs/screens/leaderboard/leaderboard.dart';
import 'package:main/UIs/screens/profile/myTrips.dart';
import 'package:main/UIs/screens/vendor/home_page.dart';
import 'package:main/UIs/themes/colors.dart';

class SideDrawer extends ConsumerStatefulWidget {
  const SideDrawer({super.key});

  @override
  ConsumerState<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends ConsumerState<SideDrawer> {
  late var tokenProvider;

  @override
  void initState() {
    super.initState();
    tokenProvider = ref.read(userAuthNotifierProvider.notifier);
  }

  void _logout() async {
    // Navigate to the "Welcome" screen
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Welcome()));
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
              switch (tokenProvider.state) {
                AsyncData(:final value) => JwtDecoder.decode(value)['firstName'] + ' ' + JwtDecoder.decode(value)['lastName'],
                _ => '',
              },
              style: const TextStyle(
                  color: ColorsTravelMate.primary,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.star_rounded),
            title: const Text('Leaderboard'),
            onTap: () => {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const LeaderBoard()))
            },
            
          ),
          ListTile(
            leading: const Icon(Icons.account_circle_rounded),
            title: const Text('Profile'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.travel_explore),
            title: const Text('My Trips'),
            onTap: () => {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const MyTripsList()))
            },
           
          ),
          ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: const Text('My Orders'),
            onTap: () => {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomePage()))
            },
            
          ),
          ListTile(
            leading: const Icon(Icons.emergency_share),
            title: const Text('Emergency Support'),
            onTap: () => {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const EmergencySupportHome()))
            },
          ),
           ListTile(
            leading: const Icon(Icons.ads_click),
            title: const Text('Ad Mate'),
            onTap: () => {Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AdMate2()))},
          ),
          ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Logout'),
              onTap: (){
                final logoutFuture = ref.read(userAuthNotifierProvider.notifier).logout();
                logoutFuture.then((value) => _logout());
              }),
        ],
      ),
    );
  }
}
