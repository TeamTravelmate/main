import 'package:flutter/material.dart';
import 'package:main/Domain/models/user.dart';
import 'package:main/UIs/widgets/list_tile.dart';
import 'package:main/UIs/widgets/text_custom.dart';

class FollowersList extends StatefulWidget {
  const FollowersList({super.key});

  @override
  _FollowersState createState() => _FollowersState();
}

class _FollowersState extends State<FollowersList> {
  List<User> _followers = [];
  String _userToken = '';
  User _user = User(avatar: '', name: '', email: '');

  @override
  void initState() {
    super.initState();
    _userToken = 'example_token';
    _user.getFollowers(_userToken).then((data) {
      setState(() {
        _followers = _user.getFollowersList();
      });
    });
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
      body: Flex(
        direction: Axis.vertical,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _followers.length,
              itemBuilder: (context, index) {
                return buildFollowerTile(context, _followers[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
