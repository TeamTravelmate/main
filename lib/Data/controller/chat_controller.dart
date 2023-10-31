import 'package:get/get.dart';
import 'package:main/Domain/models/message.dart';
import 'package:your_app/firestore_service.dart'; // Your Firestore service

class ChatController extends GetxController {
  final FirestoreService _firestoreService = FirestoreService();
  final messageController = TextEditingController(); // Text input controller

  // Messages
  RxList<Message> messages = <Message>[].obs;

  // Initialize the controller with messages from Firestore
  void initChat(String roomId) {
    _firestoreService.getMessages(roomId).listen((snapshot) {
      messages.assignAll(snapshot.map((doc) {
        final data = doc.data();
        return Message(
          text: data['message'],
          sender: data['sender'],
        );
      }));
    });
  }

  // Send a message
  void sendMessage(String roomId, String message, String sender) {
    _firestoreService.sendMessage(roomId, message, sender);
    messageController.clear();
  }
}
