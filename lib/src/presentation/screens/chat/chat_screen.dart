import 'package:flutter/material.dart';
import 'package:yes_no_app/src/presentation/widgets/chat/components/message_field_box.dart';
import 'package:yes_no_app/src/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/src/presentation/widgets/chat/my_message_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToyBRJrPSxi2ayeWmvKnPVC_rdTFjGt32-rw&s',
            ),
          ),
        ),
        title: Text('Chat'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return (index % 2 == 0)
                      ? const HerMessageBubble()
                      : const MyMessageBubble();
                },
              ),
            ),
            // caja de texto
            const MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}
