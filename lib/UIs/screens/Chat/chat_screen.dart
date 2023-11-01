import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:main/Domain/models/message.dart';
import 'package:main/Domain/models/user.dart';
import 'package:main/UIs/screens/Chat/message_bubble.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatScreen extends StatefulWidget {
  final User user;

  ChatScreen({required this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late User currentUser;
  List<Message> chatMessages = []; // Replace with your list of ChatMessages

  final TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchToken();
  }

  Future<void> fetchToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    

    // Assuming you have the token in a variable called 'token'
    final Map<String, dynamic> decodedToken = JwtDecoder.decode(token!);

// Extract first name and last name from the decoded token
    final String firstName = decodedToken['firstName'] ?? 'You';
    final String lastName = decodedToken['lastName'] ?? 'Doe';
    final String email = decodedToken['email'] ?? 'susan@gmail.com';

// Create the user object with the extracted information
    final user = User(
      avatar: 'https://gravatar.com/avatar/06090ecef1a38ecc8b17cc72c8b53bae?s=400&d=robohash&r=x', // Replace with the user's avatar URL
      name: '$firstName $lastName', // Combine first name and last name
      email: '$email', // Replace with the user's email
    );

    setState(() {      
      currentUser = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: chatMessages.length,
                itemBuilder: (context, index) {
                  final message = chatMessages[index];
      
                  if (index == 0) {
                    // If it's the first message or the sender has changed, use MessageBubble.first
                    return MessageBubble.first(
                      message: message.content,
                      isMe: message.isMe,
                      userImage: currentUser.avatar,
                      username: 'You',
                    );
                  } else {
                    // For subsequent messages from the same sender, use MessageBubble.next
                    return MessageBubble.next(
                      message: message.content,
                      isMe: message.isMe,
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: textController,
                      decoration: InputDecoration(hintText: 'Type a message'),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      sendMessage();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void sendMessage() {
    final text = textController.text;
    if (text.isNotEmpty) {
      final newMessage = Message(
        idFrom: currentUser.email,
        idTo: widget.user.email, 
        timestamp: DateTime.now().toString(),
        content: text,
        type: 1, // 1 for text message
      );
      setState(() {
        chatMessages.add(newMessage);
        textController.clear();
      });
    }
  }
}
