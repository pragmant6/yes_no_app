import 'package:flutter/material.dart';
import 'package:yes_no_app/src/config/helpers/get_yes_no_answer.dart';

import 'package:yes_no_app/src/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();
  List<Message> messagesList = [];

  void sendMessage(String message) async {
    if (message.isEmpty) return;
    messagesList.add(Message(text: message, fromWho: FromWho.my));
    if (message.endsWith('?')) {
      await herReply();
    }

    notifyListeners();
    moveStrollToBottom();
  }

  Future<void> herReply() async {
    final herMessage = await GetYesNoAnswer.getAnswer();
    messagesList.add(herMessage);
    notifyListeners();
    moveStrollToBottom();
  }

  void moveStrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
