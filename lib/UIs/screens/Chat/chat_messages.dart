import 'package:main/Domain/models/user.dart';

class Message {
  final User sender;
  final String content;
  final DateTime timestamp;

  Message({
    required this.sender,
    required this.content,
    required this.timestamp,
  });
}
