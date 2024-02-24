import 'package:flutter/material.dart';
import 'package:yes_no/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final List<Message> messages = [
    Message(message: 'Hello', sender: Sender.other),
    Message(message: 'Hi', sender: Sender.me),
    Message(message: 'How are you?', sender: Sender.me),
    Message(message: 'I am fine', sender: Sender.other),
    Message(message: 'How about you?', sender: Sender.other),
    Message(message: 'I am good', sender: Sender.me),
  ];

  Future<void> sendMessage(String msg) async {
    messages.add(Message(message: msg, sender: Sender.me));
  }

  sendLenght() {
    return messages.length;
  }

  // List<Message> get messages => _messages;
}
