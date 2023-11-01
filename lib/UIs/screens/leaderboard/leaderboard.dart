import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main/Domain/models/leaderboard.dart';
import 'package:main/UIs/screens/leaderboard/position.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../Data/env/env.dart';

class leaderboardController extends GetxController{
  var leaderboard = <Leaderboard>[].obs;

  void getPoints() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    // response to get following
    var leaderboardResponse = await http.get(
      Uri.parse('$backendUrl/users/getPoints/'),
      headers: {
        "Authorization": "Bearer $token",
      },
    );

    if (leaderboardResponse.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      var jsonResponse = jsonDecode(leaderboardResponse.body);
      print('JSON Response: $jsonResponse');

      List<dynamic> jsonList = jsonResponse['leaders'] ?? [];
      leaderboard.value = Leaderboard.fromJsonList(jsonList);
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to load data');
    }
  }
}

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({super.key});

  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  final leaderboardController controller = Get.put(leaderboardController());

  @override
  void initState() {
    super.initState();
    controller.getPoints();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Obx(
          () => Expanded(
            child: ListView.builder(
                itemCount: controller.leaderboard.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    trailing: Column(
                      children: [
                        Card(
                          margin: EdgeInsets.only(
                            top: 45.0,
                          ),
                          elevation: 5.0,
                          shadowColor: Colors.black,
                          child: Container(
                            padding: EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.menu),
                                SizedBox(width: 80.0,),
                                Text(
                                  'Leaderboard',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 195,
                          margin: EdgeInsets.only(
                              left: 20.0,
                              right: 20.0,
                              bottom: 10
                          ),
                          padding: EdgeInsets.only(
                              top: 20.0
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                top: 80,
                                left: 40,
                                child: CircleAvatar(
                                  radius: 40,
                                  backgroundColor: Color(0xFFC0C0C0),
                                  child: CircleAvatar(
                                    radius: 36,
                                    // backgroundImage: AssetImage('assets/img/man.jpg'),
                                    backgroundImage: AssetImage(controller.leaderboard[1].profile_pic ?? 'assets/img/man.jpg'),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 80,
                                left: 200,
                                child: CircleAvatar(
                                  radius: 40,
                                  backgroundColor: Color(0xFFCD7F32),
                                  child: CircleAvatar(
                                    radius: 36,
                                    backgroundImage: AssetImage(controller.leaderboard[0].profile_pic ?? 'assets/img/woman2.jpg'),
                                  ),
                                ),
                              ),
                              Container(
                                child: CircleAvatar(
                                  radius: 60,
                                  backgroundColor: Color(0xFFFFD700),
                                  child: CircleAvatar(
                                    radius: 55,
                                    backgroundImage: AssetImage(controller.leaderboard[2].profile_pic ?? 'assets/img/woman.jpg'),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: -1,
                                left: 180.0,
                                child: Image(
                                  image: AssetImage('assets/img/crown.png'),
                                ),
                              ),
                              Positioned(
                                top: 135,
                                left: 143,
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Color(0xCCFFD700),
                                  child: Text(
                                    '1',
                                    style: TextStyle(
                                        fontSize: 13.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 145,
                                left: 65,
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Color(0xCCC0C0C0),
                                  child: Text(
                                    '2',
                                    style: TextStyle(
                                        fontSize: 13.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 145,
                                left: 225,
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Color(0xCCCD7F32),
                                  child: Text(
                                    '3',
                                    style: TextStyle(
                                        fontSize: 13.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          elevation: 3.0,
                          margin: EdgeInsets.only(
                              left: 20.0,
                              right: 20.0,
                              bottom: 5.0
                          ),
                          shadowColor: Colors.black,
                          child: Container(
                            height: 60.0,
                            padding: EdgeInsets.only(
                                left: 10.0,
                                right: 10.0,
                                top: 6.0,
                                bottom: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 40.0,
                                        height: 40.0,
                                        margin: EdgeInsets.all(5.0),
                                        padding: EdgeInsets.all(5.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                              color: Color(0xFF0C1C33),
                                              image: DecorationImage(
                                                  image: AssetImage('assets/img/crown.png'),
                                                  fit: BoxFit.cover
                                              )
                                          ),
                                          // child: Center(
                                          //   child: Text(
                                          //     (index == 0) ? '👑' : (index + 1).toString(),
                                          //     style: TextStyle(
                                          //       fontSize: 20.0,
                                          //       fontWeight: FontWeight.bold,
                                          //       color: Colors.white,
                                          //     ),
                                          //   ),
                                          // ),
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                          color: Color(0xFF0C1C33),
                                        ),
                                      ),
                                      Container(
                                        width: 40.0,
                                        height: 40.0,
                                        margin: EdgeInsets.only(
                                            left: 5.0,
                                            right: 10.0),
                                        padding: EdgeInsets.all(2.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(50)),
                                          image: DecorationImage(
                                            image: AssetImage(controller.leaderboard[index].profile_pic ?? 'assets/img/woman.jpg'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Container(
                                            padding: EdgeInsets.only(
                                                top: 10.0
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  controller.leaderboard[index].name ?? 'N/A',
                                                  style: TextStyle(
                                                    fontSize: 13.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xFF0C1C33),
                                                  ),
                                                ),
                                                Text(
                                                  controller.leaderboard[index].count as String,
                                                  style: TextStyle(
                                                    fontSize: 11.0,
                                                    color: Color(0xFF0C1C33),
                                                  ),
                                                ),
                                              ],
                                            )
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 30.0,
                                        height: 30.0,
                                        margin: EdgeInsets.all(2.0),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(50)),
                                            image: DecorationImage(
                                                image: AssetImage('assets/img/hike.png'),
                                                fit: BoxFit.cover
                                            )
                                        ),
                                      ),
                                      Container(
                                        width: 30.0,
                                        height: 30.0,
                                        margin: EdgeInsets.all(2.0),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(50)),
                                            image: DecorationImage(
                                                image: AssetImage('assets/img/surf.png'),
                                                fit: BoxFit.cover
                                            )
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  );
                }
            ),
          )
        ),
      ),
    );
  }
}