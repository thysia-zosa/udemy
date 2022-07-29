import 'package:flutter/material.dart';

import '../utilities/consts.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  static String route = 'chatScreen';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: [
          IconButton(
            onPressed: () {
              // TODO: Implement logout functionality.
            },
            icon: const Icon(
              Icons.close,
            ),
          ),
        ],
        title: const Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: messageContainerDeco,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        // TODO: Do something with the user input.
                      },
                      decoration: messageTextFieldDeco,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // TODO: Implement send functionality.
                    },
                    child: const Text(
                      'Send',
                      style: sendButtonStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
