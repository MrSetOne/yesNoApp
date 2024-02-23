import 'package:flutter/material.dart';
import 'package:yes_no/presentation/widgets/chat/his_message_bubble.dart';
import 'package:yes_no/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pacogamer'),
        leading: const Padding(
          padding: EdgeInsets.all(5.0),
          child: CircleAvatar(
            backgroundColor: Color.fromARGB(255, 255, 0, 0),
            backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOOmt9eP6YQfzcKP4uOhNbNnniBT019ABTJrriV4gRzZSnmlp0BEsSZz8ACmBCc1Z-m0E&usqp=CAU'),
          ),
        ),
      ),
      body: const _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView();

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
                    if (index % 2 == 0) {
                      return MyMessageBubble(message: index.toString());
                    }
                    return HisMessageBubble(message: index.toString());
                  })),
          const MessageFieldBox(),
        ],
      ),
    ));
  }
}
