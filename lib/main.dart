import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:flutter/material.dart';
import 'package:main/UIs/screens/Registration/register_1.dart';
import 'package:main/UIs/screens/home/home_page.dart';
import 'package:main/UIs/widgets/side_menu.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';


const List<TabItem> items = [
  TabItem(
    icon: Icons.home,
    title: 'Home',
  ),
  TabItem(
    icon: Icons.search_sharp,
    title: 'Shop',
  ),
  TabItem(
    icon: Icons.favorite_border,
    title: 'Wishlist',
  ),
  TabItem(
    icon: Icons.shopping_cart_outlined,
    title: 'Cart',
  ),
  TabItem(
    icon: Icons.account_box,
    title: 'profile',
  ),
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimatedSplashScreen(
        duration: 3000,
        splash: Center(
          child: Container(
            width: 200,
            height: double.infinity,
            child : Image.asset('assets/img/TravelMate_Logo.png'),
          ),
        ),
        nextScreen: const Register(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}


class MyApp2 extends StatelessWidget {
  const MyApp2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'My App',
      home: Register(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int visit = 0;
  double height = 30;
  Color colorSelect =const Color(0XFF0686F8);
  Color color = const Color(0XFF7AC0FF);
  Color color2 = const Color(0XFF96B1FD);
  Color bgColor = const  Color(0XFF1752FE);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: BottomBarDivider(
              items: items,
              backgroundColor: Colors.white,
              color: Colors.grey,
              colorSelected: Colors.blue,
              indexSelected: visit,
              onTap: (index) => setState(() {
                visit = index;
              }),
              styleDivider: StyleDivider.top,
              countStyle:const CountStyle(
                background: Colors.white,
                color: Colors.purple,
              ),
            ),
     body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Center(
          child: Text('Welcome to my app!'),
        ),
      ),
    );
  }
}
