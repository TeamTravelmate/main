//send an http request to the randomuser.me API
//parse the response into a list of Friend objects
part of '../models/user.dart';

Future<List<User>> getFriendsResponse(String userToken) async {
  Uri url = Uri.https('randomuser.me', '/api', {'results': '15'});
  http.Response response = await http.get(url);

  if (response.statusCode == 200) {
    var decodedJson = json.decode(response.body) as Map<String, dynamic>;
    return (decodedJson['results'] as List<dynamic>)
        .map((obj) => User.fromJson(obj as Map<String, dynamic>))
        .toList();
  } else {
    print('Request failed with status: ${response.statusCode}.');
    return [];
  }
}

Future<List<User>> getFollowersResponse(String userToken) async {
  Uri url = Uri.https('randomuser.me', '/api', {'results': '10'});
  http.Response response = await http.get(url);

  if (response.statusCode == 200) {
    var decodedJson = json.decode(response.body) as Map<String, dynamic>;
    return (decodedJson['results'] as List<dynamic>)
        .map((obj) => User.fromJson(obj as Map<String, dynamic>))
        .toList();
  } else {
    print('Request failed with status: ${response.statusCode}.');
    return [];
  }
}