import 'package:flutter/material.dart';
import 'package:main/Domain/models/user.dart';
import 'package:main/UIs/widgets/list_tile.dart';
import 'package:main/UIs/widgets/textCustom.dart';

class FollowingList extends StatefulWidget {
  const FollowingList({super.key});

  @override
  _FollowingListState createState() => _FollowingListState();
}

class _FollowingListState extends State<FollowingList>{
  List<User> _following = [];
  String _userToken = '';
  User _user = User(avatar: '', name: '', email: '');

  @override
  void initState() {
    super.initState();
    _userToken = 'example_token';
    _user.getFollowing(_userToken).then((data) {
      setState(() {
        _following = _user.getFollowingList();
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
          text: 'Following',
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
              itemCount: _following.length,
              itemBuilder: (context, index) {
                return buildFollowingTile(context, _following[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}