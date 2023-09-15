import 'package:flutter/material.dart';
import 'package:main/Domain/models/user.dart';
import 'package:main/UIs/widgets/list_tile.dart';
import 'package:main/UIs/widgets/text_custom.dart';
import 'package:main/UIs/widgets/search_bar.dart';

class FriendsList extends StatefulWidget {
  const FriendsList({super.key});

  @override
  _FriendsListState createState() => _FriendsListState();
}

class _FriendsListState extends State<FriendsList> {
  //a list of friends
  List<User> _friends = [];
  String _userToken = '';
  User _user = User(avatar: '', name: '', email: '');

  //search bar controller
  final TextEditingController _searchController = TextEditingController();

  //search bar function
  void _filterFriends(value) {
    if (value.isEmpty) {
      setState(() {
        _friends = _user.getFriendsList();
      });
    } else {
      setState(() {
        _friends = _user.filterFriends(value);
      });
    }
  }

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
          text: 'Friends',
          fontWeight: FontWeight.bold,
          color: Colors.black,
          // textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Flex(
        direction: Axis.vertical,
        children: [
          buildSearchBar(context, _searchController, _filterFriends),
          Expanded(
            child: ListView.builder(
              itemCount: _friends.length,
              itemBuilder: (context, index) {
                return buildListTile(context, _friends[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
