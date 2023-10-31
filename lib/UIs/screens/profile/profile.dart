import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:galleryimage/galleryimage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'edit_profile.dart';
import 'upgrade_profile.dart';
import 'view_destinations.dart';
import '../../widgets/feed_widget.dart';
import 'create_newpost.dart';
import '../friendList/followers_list.dart';
import '../friendList/following_list.dart';

class Profile extends StatefulWidget {
  final token;
  const Profile({super.key, this.token});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late int userId;
  late String firstName;
  late String lastName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(widget.token);
    userId = jwtDecodedToken['userId'];
    firstName = "Kaleel";
    lastName = "Sheromi";

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
          ),
          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/profile_pic.jpeg'),
                      radius: 50,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Susan Perera',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 3.0),
                      child: Text('@sheromi99', style: TextStyle(fontSize: 15)),
                    ),
                    Row(
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            const Padding(
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
                              child: const Padding(
                                padding: EdgeInsets.only(top: 5.0, bottom: 12.0),
                                
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5.0, bottom: 12.0),
                              child: Text('Following',
                                  style: TextStyle(fontSize: 15)),
                            )
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
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (_) {
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
                          child: const Text('Upgrade Profile',
                              style: TextStyle(fontSize: 15.0)),
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

  // Widget Tab1(BuildContext context){
  //
  //   List<String> posts=[
  //     'assets/3.jpeg',
  //     'assets/4.jpeg',
  //     'assets/5.jpeg',
  //     'assets/download.jpeg',
  //     'assets/beach.jpg',
  //     'assets/jungle.jpg',
  //     'assets/tiger.jpeg',
  //     'assets/river.jpg',
  //     'assets/sigiriya.jpg',
  //     'assets/travellers.jpg',
  //     'assets/elephant.jpg',
  //     'assets/fam.jpg',
  //     'assets/ella.jpg',
  //     'assets/beach2.jpeg',
  //     'assets/3.jpeg',
  //     'assets/4.jpeg',
  //     'assets/5.jpeg',
  //     'assets/download.jpeg',
  //     'assets/beach.jpg',
  //     'assets/jungle.jpg',
  //     'assets/tiger.jpeg',
  //
  //   ];
  //
  //
  //   return Container(
  //     margin: EdgeInsets.all(3.0),
  //     child: Stack(
  //       children: [
  //         GridView.builder(
  //           itemCount: posts.length,
  //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //             crossAxisCount: 3,
  //             crossAxisSpacing: 1.0,
  //             mainAxisSpacing: 1.0,
  //           ),
  //           itemBuilder: (BuildContext context, int index) {
  //             return SizedBox(
  //               width: 100,
  //               height: 100,
  //               child: Image.asset(posts[index], fit: BoxFit.cover),
  //             );
  //           },
  //         ),
  //         Align(
  //           alignment: Alignment.bottomRight,
  //           child: Padding(
  //             padding: EdgeInsets.all(16.0),
  //             child: FloatingActionButton(
  //               onPressed: () {
  //                 Navigator.of(context).push(MaterialPageRoute(builder: (_) {
  //                   return NewPost();
  //                 }));
  //               },
  //               child: Icon(Icons.post_add, size:30),
  //               backgroundColor: Color(0xFF0C1C33),
  //               foregroundColor: Colors.white,
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

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
            backgroundColor: const Color(0xFF0C1C33),
            foregroundColor:
                Colors.white,
            child: const Icon(Icons.next_plan_outlined, size: 30), // Replace this with your desired icon
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

  Widget Tab1(BuildContext context) {
    return Stack(
      children: [
        const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              feedCard(
                profile: 'assets/profile.png',
                title: 'Nimesh Jayasinha',
                subtitle: 'Colombo, Sri Lanka',
                post: 'Can anyone recommend some place to travel on weekens???',
                imagePath: 'assets/post.png',
                likes: '100',
                comments: '12',
              ),
              SizedBox(
                height: 10,
              ),
              feedCard(
                profile: 'assets/profile.png',
                title: 'Nimesh Jayasinha',
                subtitle: 'Colombo, Sri Lanka',
                post: 'Can anyone recommend some place to travel on weekens???',
                imagePath: 'assets/post.png',
                likes: '100',
                comments: '12',
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return NewPost();
                }));
              },
              backgroundColor: const Color(0xFF0C1C33),
              foregroundColor: Colors.white,
              child: const Icon(Icons.post_add, size: 30),
            ),
          ),
        ),
      ],
    );
  }
}
