import 'package:flutter/material.dart';
import 'package:main/UIs/screens/profile/profile.dart';
import 'package:main/UIs/widgets/side_drawer.dart';
import '../../themes/colors.dart';
import '../../widgets/feed_widget.dart';
import '../../widgets/popular_widget.dart';
import '../Trip/tripPlanning_page.dart';
import 'popularPlaces_page.dart';
import '../profile/create_newpost.dart';

class home extends StatelessWidget {
  final token;
  const home({@required this.token, super.key});

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
                    builder: (context) => Profile(token: token),
                  ),
                );
              },
              
              child: const CircleAvatar(backgroundImage: AssetImage('assets/profile.png'),
               radius: 30, backgroundColor: Colors.transparent)
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
                    const feedCard(
                      profile: 'assets/man.jpg',
                      title: 'Kasun Jayaweera',
                      subtitle: 'Gampaha, Sri Lanka',
                      post:
                      'What destinations do you recommend for a relaxing weekend by the water, like lakes or beaches?',
                      imagePath: 'assets/post.png',
                      likes: '5',
                      comments: '4',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const feedCard(
                      profile: 'assets/woman.jpeg',
                      title: 'Nimesh Jayasinha',
                      subtitle: 'Colombo, Sri Lanka',
                      post:
                      'Can anyone recommend some place to travel on weekends???',
                      imagePath: 'assets/post.png',
                      likes: '100',
                      comments: '12',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const feedCard(
                      profile: 'assets/woman2.jpg',
                      title: 'Sachini Usha',
                      subtitle: 'Colombo, Sri Lanka',
                      post:
                      'Can you suggest some great weekend getaway destinations that are within a few hours drive?',
                      imagePath: 'assets/post.png',
                      likes: '100',
                      comments: '12',
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
