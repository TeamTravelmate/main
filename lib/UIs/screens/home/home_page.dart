import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:main/UIs/screens/profile/profile.dart';
import 'package:main/UIs/widgets/side_drawer.dart';
import '../../themes/colors.dart';
import '../../widgets/feed_widget.dart';
import '../../widgets/popular_widget.dart';
import '../Trip/tripPlanning_page.dart';
import 'popularPlaces_page.dart';
import '../profile/create_newpost.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:main/Data/env/env.dart';
import 'package:shared_preferences/shared_preferences.dart';

class home extends StatefulWidget {
  final token;

  const home({@required this.token, super.key});

  @override
  _homeState createState() => _homeState();
}






class _homeState extends State<home> {
  List<Widget> feedCards = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    try {
      final Uri profileUri = Uri.parse('$backendUrl/user/posts');
      final response = await http.get(
        profileUri,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body) as List<dynamic>;
        updateFeedCards(jsonData);
      } else {
        throw 'Failed to fetch user profile data';
      }
    } catch (e) {
      throw 'Error occurred while fetching user profile data: $e';
    }
  }

  void updateFeedCards(List<dynamic> jsonData) {
    if (jsonData != null) {
      for (var post in jsonData) {
        feedCards.add(
          feedCard(
            profile: post['User']['profile_pic'] ?? 'assets/profile.png',
            title: (post['User']['firstName'] ?? '') +
                ' ' +
                (post['User']['lastName'] ?? ''),
            subtitle: post['User']['username'] ?? '',
            post: post['content'] ?? '',
            imagePath: post['media'] ?? '',
            likes: post['reactCount']?.toString() ?? '0',
            comments: post['commentCount']?.toString() ?? '0',
          ),
        );
      }
      setState(() {}); // Trigger a UI update to display the feedCards
    }
  }

  @override
  Widget build(BuildContext context) {
    const shape = StadiumBorder();
    return Scaffold(
      drawer: const SideDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/logo-travelmate.png',
          width: 200,
        ),
        actions: [
          FloatingActionButton.small(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Profile(),
                ),
              );
            },

            child: Image.asset('assets/profile.png', height: 30, width: 30),
          ),
        ],
        backgroundColor: ColorsTravelMate.tertiary,
        foregroundColor: ColorsTravelMate.primary,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 20.0,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    const Text(
                      'Popular Destinations',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        color: ColorsTravelMate.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 180,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: const <Widget>[
                          popularTrips(
                            path: popularDestinations(),
                            title: 'Nuwara Eliya',
                            imagePath: 'assets/nuwara eliya.jpg',
                          ),
                          popularTrips(
                            path: popularDestinations(),
                            title: 'Galle',
                            imagePath: 'assets/galleFort.png',
                          ),
                          popularTrips(
                            path: popularDestinations(),
                            title: 'Yala',
                            imagePath: 'assets/yala.png',
                          ),
                          popularTrips(
                            path: popularDestinations(),
                            title: 'Unawatuna',
                            imagePath: 'assets/unawatuna beach.jpg',
                          ),
                          popularTrips(
                            path: popularDestinations(),
                            title: 'Colombo',
                            imagePath: 'assets/colombo.jpg',
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: const ShapeDecoration(
                          shape: shape,
                          gradient: LinearGradient(colors: [
                            ColorsTravelMate.secundary,
                            ColorsTravelMate.tertiary,
                          ])),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => trip(),
                            ),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                          padding:
                          MaterialStateProperty.all(const EdgeInsets.all(10)),
                          foregroundColor:
                          MaterialStateProperty.all(ColorsTravelMate.tertiary),
                        ),
                        child: Container(
                          width: 350,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '  Plan your vacation with us  ',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                Icons.arrow_circle_right_rounded,
                                color: ColorsTravelMate.secundary,
                                size: 30,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: feedCards, // Display the feedCards
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: FloatingActionButton(
              onPressed: () {

                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return NewPost();
                }));},
              child: Icon(Icons.post_add, size: 30),
              backgroundColor: Color(0xFF0C1C33),
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
