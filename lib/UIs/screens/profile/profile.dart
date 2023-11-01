import 'dart:convert';
import 'package:file/file.dart';

import 'package:flutter/material.dart';
import 'package:galleryimage/galleryimage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:main/Data/storage/token.dart';
import 'package:main/Data/env/env.dart';
import 'package:http/http.dart' as http;
import 'edit_profile.dart';
import 'upgrade_profile.dart';
import 'view_destinations.dart';
import '../../widgets/feed_widget.dart';
import 'create_newpost.dart';
import '../friendList/followers_list.dart';
import '../friendList/following_list.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Profile extends StatefulWidget {
  final token;

  Profile({Key? key, this.token}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {



  late String firstName;
  late String lastName;
  late String username;
  late String phone_no;
  late String profile_pic;
  late String email;
  Map<String, dynamic>? jsonData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUsers();

  }


  Future<void> fetchUsers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');


    try {
      final Uri profileUri = Uri.parse('$backendUrl/user/myProfile');
      print(profileUri);

      final response = await http.get(
        profileUri,
        headers: {
          'Authorization': 'Bearer $token', // Add the token to the headers
        },

      );

      if (response.statusCode == 200) {
        final body = response.body;
        final jsonData = jsonDecode(body);

        setState(() {
          // Update the state with the fetched data
          firstName = jsonData?['firstName'] ?? "";
          lastName = jsonData?['lastName'] ?? "";
          username = jsonData?['username'] ?? "";
          profile_pic = jsonData?['profile_pic'] ?? "";
          phone_no = jsonData?['phone_no'] ?? "";
          email = jsonData?['email'] ?? "";
          print(profile_pic);
        });

        // Now you can use the jsonData as per your requirements
        print('User Profile Data: $jsonData');
      } else {
        print('Failed to fetch user profile data');
      }
    } catch (e) {
      print('Error occurred while fetching user profile data: $e');
    }
  }




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(color: Color(0xFF0C1C33)),
            title: const Text(
              'Profile',
              style: TextStyle(color: Color(0xFF0C1C33)),
            ),

            leading: const BackButton(
              color: Colors.black,
            ),


            // Remove the Container from the bottom property of AppBar
            // Add the Container above the TabBar
          ),


          body: Column(
            children: [
              Container(
                // Place the Container above the TabBar
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    CircleAvatar(
                      backgroundImage: NetworkImage('http://192.168.8.138:3000/' + profile_pic.replaceAll(r'\', '/')),
                      radius: 50.0,
                    ),





                    Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        '${firstName ?? "Unknown"} ${lastName ?? "Unknown"}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),


                    Padding(
                      padding: EdgeInsets.only(top: 3.0),
                      child: Text('${username ?? "Unknown"}',
                          style: TextStyle(fontSize: 15)),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 3.0),
                      child: Text('Traveller',
                          style: TextStyle(fontSize: 15)),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 12.0),
                              child: Text('100',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                                  return const FollowersList();
                                }));
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(top: 5.0, bottom: 12.0),
                                child: Text(
                                  'Followers',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 12.0),
                              child: Text('90',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                                    return const FollowingList();
                                  }));
                                },
                                child:
                                const Padding(
                                  padding: EdgeInsets.only(top: 5.0, bottom: 12.0),
                                  child: Text('Following',
                                      style: TextStyle(fontSize: 15)),
                                )),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FilledButton(
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (_) {
                              return EditProfile();
                            }));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF0C1C33),
                            minimumSize: const Size(150.0, 40.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: const Text('Edit Profile',
                              style: TextStyle(fontSize: 15.0)),
                        ),
                        FilledButton(
                          child: const Text('Upgrade Profile',
                              style: TextStyle(fontSize: 15.0)),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                              return UpgradeProfile();
                            }));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF0C1C33),
                            minimumSize: const Size(150.0, 40.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              // Place the TabBar below the Container
              const TabBar(
                indicatorWeight: 5.0,
                labelColor: Color(
                    0xFF0C1C33), // Set the color for the selected tab's label
                unselectedLabelColor: Color(0xFF2FACBB),
                indicatorColor: Color(0xFF2FACBB),
                tabs: [
                  Tab(text: 'Posts'),
                  Tab(text: 'My Trips'),
                  Tab(text: 'Activities'),
                ],
                labelStyle: TextStyle(color: Color(0xFF2FACBB)),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Tab1(context),
                    Tab2(),
                    Tab3(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



  Widget Tab2() {
    List<String> listOfUrls = [
      "https://cosmosmagazine.com/wp-content/uploads/2020/02/191010_nature.jpg",
      "https://scx2.b-cdn.net/gfx/news/hires/2019/2-nature.jpg",
      "https://cosmosmagazine.com/wp-content/uploads/2020/02/191010_nature.jpg",
      "https://scx2.b-cdn.net/gfx/news/hires/2019/2-nature.jpg",
      "https://cosmosmagazine.com/wp-content/uploads/2020/02/191010_nature.jpg",
      "https://scx2.b-cdn.net/gfx/news/hires/2019/2-nature.jpg",
      "https://cosmosmagazine.com/wp-content/uploads/2020/02/191010_nature.jpg",
    ];

    List<String> listOfUrls2 = [
      "https://upload.wikimedia.org/wikipedia/commons/7/77/Big_Nature_%28155420955%29.jpeg",
      "https://cosmosmagazine.com/wp-content/uploads/2020/02/191010_nature.jpg",
      "https://scx2.b-cdn.net/gfx/news/hires/2019/2-nature.jpg",
      "https://isha.sadhguru.org/blog/wp-content/uploads/2016/05/natures-temples.jpg",
      "https://s23574.pcdn.co/wp-content/uploads/Singular-1140x703.jpg",
      "https://www.expatica.com/app/uploads/sites/9/2017/06/Lake-Oeschinen-1200x675.jpg",
    ];

    List<String> listOfUrls3 = [
      "https://googleflutter.com/sample_image.jpg",
      "https://cosmosmagazine.com/wp-content/uploads/2020/02/191010_nature.jpg",
      "https://scx2.b-cdn.net/gfx/news/hires/2019/2-nature.jpg",
      "https://cosmosmagazine.com/wp-content/uploads/2020/02/191010_nature.jpg",
      "https://scx2.b-cdn.net/gfx/news/hires/2019/2-nature.jpg",
      "https://cosmosmagazine.com/wp-content/uploads/2020/02/191010_nature.jpg",
      "https://scx2.b-cdn.net/gfx/news/hires/2019/2-nature.jpg",
    ];

    return Stack(children: [
      SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              margin: const EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey
                        .withOpacity(0.5), // Shadow color and opacity
                    spreadRadius:
                    2, // How far the shadow spreads from the container
                    blurRadius: 5, // The intensity of the shadow blur
                    offset: const Offset(
                        0, 3), // The offset of the shadow from the container
                  ),
                ],
              ),
              padding: const EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Trip to Galle",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.map_outlined),
                        ) // Replace this with your desired icon
                      ]),
                  const SizedBox(height: 5.0),
                  SizedBox(
                    height: 100.0,
                    width: 280.0,
                    child: GalleryImage(
                      imageUrls: listOfUrls,
                      numOfShowImages: 3,
                      // Add any other properties that GalleryImage widget supports.
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Icon(Icons.location_pin),
                      Text("Galle Fort, Unawatuna Beach",
                          style: TextStyle(
                            fontSize: 15,
                          )),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Row(
                    children: [
                      Icon(Icons.calendar_month),
                      Text("July 3, 2023  - July 6, 2023 (3 days)",
                          style: TextStyle(
                            fontSize: 15,
                          )),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Row(
                    children: [
                      Icon(Icons.person),
                      Text("Kumar & 5 others",
                          style: TextStyle(
                            fontSize: 15,
                          )),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Row(
                    children: [
                      Icon(Icons.surfing),
                      Text("Surfing",
                          style: TextStyle(
                            fontSize: 15,
                          )),
                    ],
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              margin: const EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey
                        .withOpacity(0.5), // Shadow color and opacity
                    spreadRadius:
                    2, // How far the shadow spreads from the container
                    blurRadius: 5, // The intensity of the shadow blur
                    offset: const Offset(
                        0, 3), // The offset of the shadow from the container
                  ),
                ],
              ),
              padding: const EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Trip to Lipton's seat",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.map_outlined),
                        ) // Replace this with your desired icon
                      ]),
                  const SizedBox(height: 5.0),
                  SizedBox(
                    height: 100.0,
                    width: 280.0,
                    child: GalleryImage(
                      imageUrls: listOfUrls2,
                      numOfShowImages: 3,
                      // Add any other properties that GalleryImage widget supports.
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Icon(Icons.location_pin),
                      Text("Lipton's seat, Haputhale",
                          style: TextStyle(
                            fontSize: 15,
                          )),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Row(
                    children: [
                      Icon(Icons.calendar_month),
                      Text("Feb 5, 2022  - Feb 9, 2022 (4 days)",
                          style: TextStyle(
                            fontSize: 15,
                          )),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Row(
                    children: [
                      Icon(Icons.person),
                      Text("Sew & 8 others",
                          style: TextStyle(
                            fontSize: 15,
                          )),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Row(
                    children: [
                      Icon(Icons.hiking),
                      Text("Hiking",
                          style: TextStyle(
                            fontSize: 15,
                          )),
                    ],
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              margin: const EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey
                        .withOpacity(0.5), // Shadow color and opacity
                    spreadRadius:
                    2, // How far the shadow spreads from the container
                    blurRadius: 5, // The intensity of the shadow blur
                    offset: const Offset(
                        0, 3), // The offset of the shadow from the container
                  ),
                ],
              ),
              padding: const EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Trip to Nanuoya",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.map_outlined),
                        ) // Replace this with your desired icon
                      ]),
                  const SizedBox(height: 5.0),
                  SizedBox(
                    height: 100.0,
                    width: 280.0,
                    child: GalleryImage(
                      imageUrls: listOfUrls3,
                      numOfShowImages: 3,
                      // Add any other properties that GalleryImage widget supports.
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Icon(Icons.location_pin),
                      Text("Ella, Nanuoya",
                          style: TextStyle(
                            fontSize: 15,
                          )),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Row(
                    children: [
                      Icon(Icons.calendar_month),
                      Text("Jan 15, 2022  - Jan 17, 2023 (2 days)",
                          style: TextStyle(
                            fontSize: 15,
                          )),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Row(
                    children: [
                      Icon(Icons.person),
                      Text("Nima & 12 others",
                          style: TextStyle(
                            fontSize: 15,
                          )),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Row(
                    children: [
                      Icon(Icons.surfing),
                      Text("Swiminng",
                          style: TextStyle(
                            fontSize: 15,
                          )),
                    ],
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ),
        ]),
      ),
      Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FloatingActionButton(
            onPressed: () {
              // Your button's onPressed function here...
            },
            child: const Icon(Icons.next_plan_outlined, size: 30),
            backgroundColor: const Color(0xFF0C1C33),
            foregroundColor:
            Colors.white, // Replace this with your desired icon
          ),
        ),
      ),
    ]);
  }

  Widget Tab3(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              margin: const EdgeInsets.only(top: 1.0, left: 5.0, right: 5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey
                        .withOpacity(0.5), // Shadow color and opacity
                    spreadRadius:
                    2, // How far the shadow spreads from the container
                    blurRadius: 5, // The intensity of the shadow blur
                    offset: const Offset(
                        0, 3), // The offset of the shadow from the container
                  ),
                ],
              ),
              padding: const EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage('assets/hiking.jpeg'),
                        radius: 40,
                      ),
                      Container(
                        width: 260.0,
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Hiking",
                                  style: TextStyle(fontSize: 18.0)),
                              const Text("250 points"),
                              Align(
                                  alignment: Alignment.bottomRight,
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      color: Colors
                                          .transparent, // Make the link background transparent
                                      child: const Text(
                                        "View Destinations",
                                        style:
                                        TextStyle(color: Color(0xFF2FACBB)),
                                      ),
                                    ),
                                  )),
                            ]),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              margin: const EdgeInsets.only(top: 1.0, left: 5.0, right: 5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey
                        .withOpacity(0.5), // Shadow color and opacity
                    spreadRadius:
                    2, // How far the shadow spreads from the container
                    blurRadius: 5, // The intensity of the shadow blur
                    offset: const Offset(
                        0, 3), // The offset of the shadow from the container
                  ),
                ],
              ),
              padding: const EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage('assets/surfing.jpg'),
                        radius: 40,
                      ),
                      Container(
                        width: 260.0,
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Surfing",
                                  style: TextStyle(fontSize: 18.0)),
                              const Text("100 points"),
                              Align(
                                  alignment: Alignment.bottomRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(builder: (_) {
                                        return ViewDestinationSurfing();
                                      }));
                                    },
                                    child: Container(
                                      color: Colors
                                          .transparent, // Make the link background transparent
                                      child: const Text(
                                        "View Destinations",
                                        style:
                                        TextStyle(color: Color(0xFF2FACBB)),
                                      ),
                                    ),
                                  )),
                            ]),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              margin: const EdgeInsets.only(top: 1.0, left: 5.0, right: 5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey
                        .withOpacity(0.5), // Shadow color and opacity
                    spreadRadius:
                    2, // How far the shadow spreads from the container
                    blurRadius: 5, // The intensity of the shadow blur
                    offset: const Offset(
                        0, 3), // The offset of the shadow from the container
                  ),
                ],
              ),
              padding: const EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage('assets/snorkiln.png'),
                        radius: 40,
                      ),
                      Container(
                        width: 260.0,
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Snorkeling",
                                  style: TextStyle(fontSize: 18.0)),
                              const Text("80 points"),
                              Align(
                                  alignment: Alignment.bottomRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(builder: (_) {
                                        return ViewDestinationSnorkeling();
                                      }));
                                    },
                                    child: Container(
                                      color: Colors
                                          .transparent, // Make the link background transparent
                                      child: const Text(
                                        "View Destinations",
                                        style:
                                        TextStyle(color: Color(0xFF2FACBB)),
                                      ),
                                    ),
                                  )),
                            ]),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              margin: const EdgeInsets.only(top: 1.0, left: 5.0, right: 5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey
                        .withOpacity(0.5), // Shadow color and opacity
                    spreadRadius:
                    2, // How far the shadow spreads from the container
                    blurRadius: 5, // The intensity of the shadow blur
                    offset: const Offset(
                        0, 3), // The offset of the shadow from the container
                  ),
                ],
              ),
              padding: const EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage('assets/camping.png'),
                        radius: 40,
                      ),
                      Container(
                        width: 260.0,
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Camping",
                                  style: TextStyle(fontSize: 18.0)),
                              const Text("70 points"),
                              Align(
                                  alignment: Alignment.bottomRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(builder: (_) {
                                        return ViewDestinationSnorkeling();
                                      }));
                                    },
                                    child: Container(
                                      color: Colors
                                          .transparent, // Make the link background transparent
                                      child: const Text(
                                        "View Destinations",
                                        style:
                                        TextStyle(color: Color(0xFF2FACBB)),
                                      ),
                                    ),
                                  )),
                            ]),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }







  Future<List<dynamic>> fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    try {
      final Uri profileUri = Uri.parse('$backendUrl/user/myPosts');
      final response = await http.get(
        profileUri,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw 'Failed to fetch user profile data';
      }
    } catch (e) {
      throw 'Error occurred while fetching user profile data: $e';
    }
  }

  Widget Tab1(BuildContext context) {
    return Stack(
      children: [
        FutureBuilder<List<dynamic>>(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(); // Display a loading indicator while fetching data.
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              // Data has been fetched successfully, build your UI with the data.
              final jsonData = snapshot.data;
              print(jsonData);
              int index = 0;
              List<Widget> feedCards = [];

              if (jsonData != null) {
                for (var post in jsonData) {
                  feedCards.add(feedCard(
                    profile: post['User']['profile_pic'] ?? 'assets/profile.png',
                    title: (post['User']['firstName'] ?? '') + ' ' + (post['User']['lastName'] ?? ''),
                    subtitle: post['User']['username'] ?? '',
                    post: post['content'] ?? '',
                    imagePath: post['media'] ?? '',
                    likes: post['reactCount']?.toString() ?? '0',
                    comments: post['commentCount']?.toString() ?? '0',
                  ));
                  index++;
                }
              }

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: feedCards,
                ),
              );
            }
          },
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return NewPost();
                }));
              },
              child: const Icon(Icons.post_add, size: 30),
              backgroundColor: const Color(0xFF0C1C33),
              foregroundColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }



}
