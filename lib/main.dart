import 'package:flutter/material.dart';
import 'package:main/UIs/widgets/side_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    const HomeScreen(),
    SearchScreen(),
    TripPlanningScreen(),
    MarketplaceScreen(),
    ChatScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: SideMenu(),
      // Scaffold(
      //   appBar: AppBar(
      //     title: const Text('TravelMate'),
      //   ),
      //   body: _tabs[_currentIndex],
      //   bottomNavigationBar: BottomNavigationBar(
      //     currentIndex: _currentIndex,
      //     onTap: (index) {
      //       setState(() {
      //         _currentIndex = index;
      //       });
      //     },
      //     items: const [
      //       BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.home,
      //           color: Colors.blue,
      //         ),
      //         label: 'Home',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.search,
      //           color: Colors.blue,
      //         ),
      //         label: 'Search',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.directions, color: Colors.blue),
      //         label: 'Trip Planning',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.store, color: Colors.blue),
      //         label: 'Marketplace',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.chat,
      //           color: Colors.blue,
      //         ),
      //         label: 'Chat',
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Home Screen'),
    );
  }
}

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Search Screen'),
    );
  }
}

class TripPlanningScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Trip Planning Screen'),
    );
  }
}

class MarketplaceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Marketplace Screen'),
    );
  }
}

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Chat Screen'),
    );
  }
}
