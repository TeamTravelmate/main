import 'package:flutter/material.dart';
import 'package:main/Domain/models/user.dart';
import 'package:main/UIs/widgets/list_tile.dart';
import 'package:main/UIs/widgets/text_custom.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({Key? key}) : super(key: key);
  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  List<User> _friends = [];
  String _userToken = '';
  User _user = User(avatar: '', name: '', email: '');

  //get friends list
  @override
  void initState() {
    super.initState();
    _userToken = 'example_token';
    _user.getFriends(_userToken).then((data) {
      setState(() {
        _friends = _user.getFriendsList();
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
            text: "Chat", fontWeight: FontWeight.bold, color: Colors.black),
      ),
      body: ListView.builder(
        itemCount: _friends.length,
        itemBuilder: (context, index) {
          return buildChatTile(context, _friends[index]);
        },
      ),
    );
  }
}
