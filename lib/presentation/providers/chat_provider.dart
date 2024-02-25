import 'package:flutter/material.dart';
import 'package:yes_no/config/helpers/get_yes_no.dart';
import 'package:yes_no/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNo apiCall = GetYesNo();

  final List<Message> messages = [
    Message(message: 'Hello', sender: Sender.other),
    Message(message: 'Hi', sender: Sender.me),
    Message(message: 'How are you?', sender: Sender.me),
    Message(message: 'I am fine', sender: Sender.other),
    Message(message: 'How about you?', sender: Sender.other),
    Message(message: 'I am good', sender: Sender.me),
  ];

  Future<void> sendMessage(String msg) async {
    if (msg.isEmpty) return;
    messages.add(Message(message: msg, sender: Sender.me));
    notifyListeners();
    scrollToBottom();
    if (msg.endsWith('?')) {
      await getYesNo();
      notifyListeners();
      scrollToBottom();
    }
  }

  Future<void> getYesNo() async {
    final message = await apiCall.getYesNo();
    messages.add(message);
  }

  sendLenght() {
    return messages.length;
  }

  void scrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.bounceOut);
  }

  // List<Message> get messages => _messages;
}
