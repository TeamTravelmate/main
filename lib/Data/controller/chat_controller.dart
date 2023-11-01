import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main/Domain/models/message.dart';

class ChatController extends GetxController {
  final messageController = TextEditingController(); // Text input controller

  // Messages
  RxList<Message> messages = <Message>[].obs;




}
