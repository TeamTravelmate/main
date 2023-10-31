import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main/UIs/themes/colors.dart';
import 'package:main/UIs/widgets/side_drawer.dart';
import 'package:main/Domain/models/friends.dart';
import 'package:main/UIs/widgets/text_custom.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../Data/env/env.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/list_tile.dart';

class FollowingController extends GetxController {
  var following = <User>[].obs;

  void getFollowing() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    // response to get following
    var followingResponse = await http.get(
      Uri.parse('$backendUrl/follower/following/'),
      headers: {
        "Authorization": "Bearer $token",
      },
    );

    if (followingResponse.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      var jsonResponse = jsonDecode(followingResponse.body);
      print('JSON Response: $jsonResponse');

      List<dynamic> jsonList = jsonResponse['following'] ?? [];
      following.value = User.fromJsonList(jsonList);
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to load data');
    }
  }

  void unfollow(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    // response for unfollow
    var unfollowResponse = await http.delete(
      Uri.parse('$backendUrl/follower/unfollow/$id'),
      headers: {
        "Authorization": "Bearer $token",
      },
    );

    if (unfollowResponse.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      var jsonResponse = jsonDecode(unfollowResponse.body);
      print('JSON Response: $jsonResponse');

      // Remove the unfollowed user from the following list and update the state
      following.removeWhere((user) => user.id == id);
      update();
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to remove user from following');
    }
  }
}

class FollowingList extends StatefulWidget {
  const FollowingList({super.key});

  @override
  _FollowingListState createState() => _FollowingListState();
}

class _FollowingListState extends State<FollowingList> {
  final FollowingController controller = Get.put(FollowingController());

  @override
  void initState() {
    super.initState();
    controller.getFollowing();
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
          text: 'Following',
          fontWeight: FontWeight.bold,
          color: Colors.black,
          // textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.following.length,
          itemBuilder: (context, index) {
            return ListTile(
                leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://i.pravatar.cc/150?u=${controller.following[index].email ?? 'default'}'),
                    radius: 20),
                title: Text(controller.following[index].name ?? 'N/A'),
                subtitle: Text(controller.following[index].email ?? 'N/A'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buttonWidget(
                      labelText: 'Unfollow',
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
                      path: const FollowingList(),
                    ),
                  ],
                ));
          },
        ),
      ),
    );
  }
}
