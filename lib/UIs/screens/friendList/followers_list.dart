import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main/UIs/themes/colors.dart';
import 'package:main/UIs/widgets/side_drawer.dart';
import 'package:main/Domain/models/friends.dart';
import 'package:main/UIs/widgets/list_tile.dart';
import 'package:main/UIs/widgets/text_custom.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../Data/env/env.dart';
import '../../widgets/button_widget.dart';

class FollowersController extends GetxController {
  var followers = <User>[].obs;

  void getFollowers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    // response to get following
    var followersResponse = await http.get(
      Uri.parse('$backendUrl/follower/followers/'),
      headers: {
        "Authorization": "Bearer $token",
      },
    );

    if (followersResponse.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      var jsonResponse = jsonDecode(followersResponse.body);
      print('JSON Response: $jsonResponse');

      List<dynamic> jsonList = jsonResponse['follower'] ?? [];
      followers.value = User.fromJsonList(jsonList);
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to load data');
    }
  }
}
class FollowersList extends StatefulWidget {
  const FollowersList({super.key});

  @override
  _FollowersState createState() => _FollowersState();
}

class _FollowersState extends State<FollowersList> {
  final FollowersController controller = Get.put(FollowersController());

  @override
  void initState() {
    super.initState();
    controller.getFollowers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: const TextCustom(
          text: 'Followers',
          fontWeight: FontWeight.bold,
          color: Colors.black,
          // textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.followers.length,
          itemBuilder: (context, index) {
            return ListTile(
                leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://i.pravatar.cc/150?u=${controller.followers[index].email ?? 'default'}'),
                    radius: 20),
                title: Text(controller.followers[index].name ?? 'N/A'),
                subtitle: Text(controller.followers[index].email ?? 'N/A'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buttonWidget(
                      labelText: 'follow',
                      onPressed: () {
                        // controller
                        //     .unfollow(controller.following[index].id ?? 0);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const FollowingList()),
                        // );
                      },
                      width: 95,
                      height: 30,
                      fontSize: 11,
                      path: const FollowersList(),
                    ),
                  ],
                ));
          },
        ),
      ),
    );
  }
}
