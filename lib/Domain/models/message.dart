
class Message {
  String idFrom;
  String idTo;
  String timestamp;
  String content;
  int type;
  String? userImage; // Add userImage property
  String? username; // Add username property
  bool isMe; // Add isMe property

  Message({
    required this.idFrom,
    required this.idTo,
    required this.timestamp,
    required this.content,
    required this.type,
    this.userImage,
    this.username,
    this.isMe = true,
  });
}
