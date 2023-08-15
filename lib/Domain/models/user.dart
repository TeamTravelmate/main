import 'dart:convert';
import 'package:http/http.dart' as http;
part '../services/response_friends.dart';

class User {
  //avatar, name, email
  final String avatar;
  final String name;
  final String email;
  List<User> friends = [];
  List<User> followers = [];
  List<User> following = [];

  User({
    required this.avatar,
    required this.name,
    required this.email,
  });

  User.withFriends({
    required this.avatar,
    required this.name,
    required this.email,
  }) {
    getFriends('example_token');
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      avatar: json['picture']['thumbnail'],
      name:
          '${_capitalize(json['name']['first'])} ${_capitalize(json['name']['last'])}',
      email: json['email'],
    );
  }

  Future<void> getFriends(String userToken) async {
    friends = await getFriendsResponse(userToken);
  }

  Future<void> getFollowers(String userToken) async {
    followers = await getFollowersResponse(userToken);
  }

  Future<void> getFollowing(String userToken) async {
    following = await getFollowingResponse(userToken);
  }

  List<User> getFriendsList() {
    return friends;
  }

  List<User> getFollowersList() {
    return followers;
  }

  List<User> getFollowingList() {
    return following;
  }

  List<User> filterFriends(String query) {
    List<User> filteredFriends = [];
    for (int i = 0; i < friends.length; i++) {
      if (friends[i].name.toLowerCase().contains(query.toLowerCase())) {
        filteredFriends.add(friends[i]);
      }
    }
    return filteredFriends;
  }

  static String _capitalize(String input) {
    return input.substring(0, 1).toUpperCase() + input.substring(1);
  }
}

//"gender":"female",
//"name":{"title":"Mrs","first":"Annabell","last":"Stiller"},
//"location":{"street":{"number":4850,"name":"Jahnstraße"},"city":"Straelen","state":"Bremen","country":"Germany","postcode":32616,"coordinates":{"latitude":"-51.4261","longitude":"29.1552"},
//"timezone":{"offset":"+2:00","description":"Kaliningrad, South Africa"}},
//"email":"annabell.stiller@example.com",
//"login":{"uuid":"0d8877d4-48ac-4242-89d7-c8cc7b5127bb","username":"lazyrabbit601","password":"softail","salt":"FPXipiaK","md5":"6a73bf13fa59ca91ea499af0feffc70e","sha1":"b991e5a5582c6331c824db9ca434e6108cef0926","sha256":"90d59bb3d42984748a8039369acc5026afd83a7bb75ffd73bcc38104231ca5c8"},
//"dob":{"date":"1989-11-30T12:44:43.371Z","age":33},
//"registered":{"date":"2017-10-05T02:13:53.309Z","age":5},
//"phone":"0731-1477141","cell":"0174-8519861",
//"id":{"name":"SVNR","value":"80 301189 S 510"},
//"picture":{"large":"https://randomuser.me/api/portraits/women/43.jpg","medium":"https://randomuser.me/api/portraits/med/women/43.jpg","thumbnail":"https://randomuser.me/api/portraits/thumb/women/43.jpg"},
//"nat":"DE"
