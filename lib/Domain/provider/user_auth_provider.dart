import 'dart:convert';
import 'package:http/http.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Data/env/env.dart';

part 'user_auth_provider.g.dart';

@Riverpod(keepAlive: true)
class UserAuthNotifier extends _$UserAuthNotifier {
  @override
  build() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    if (token != null && token.isNotEmpty) {
      if (JwtDecoder.isExpired(token) == false) {
        return token;
      }
    }
    return '';
  }

  Future<void> login(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final Map<String, String> requestBody = {
      'email': email,
      'password': password,
    };
    final url = Uri.parse('$backendUrl/user/login');
    final response;
    try {
      response = await post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestBody),
      );
    } on Exception catch (e) {
      throw Exception('Network Error');
    }

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      state = AsyncValue.data(responseBody['token']);

      //set the shared preference token value to the token
      prefs.setString('token', responseBody['token']);
    }
    if (response.statusCode == 401) {
      throw Exception('Invalid Email or Password');
    }
    if (response.statusCode == 500 || response.statusCode == 404) {
      throw Exception("Server error. It's not you, it's us");
    }
  }

//logout function
  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', '');
  }
}
