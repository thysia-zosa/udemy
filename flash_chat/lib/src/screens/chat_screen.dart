import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../backend/backend.dart';
import '../utilities/consts.dart';
import '../widgets/chat_item.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  static String route = 'chatScreen';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final String _currentUserEmail = Backend().getCurrentUserEmail();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: [
          IconButton(
            onPressed: () {
              // TODO: Implement logout functionality.
              Backend().logout().then((value) {
                Navigator.pop(context);
              });
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
            StreamBuilder<List<Map<String, dynamic>>>(
                builder: ((context, snapshot) {
              if (!snapshot.hasData) {
                return const Expanded(
                  child: Center(
                    child: Text('Start a new conversation.'),
                  ),
                );
              }
              List<ChatItem> items = [];
              for (var element in snapshot.data!) {
                items.add(
                  ChatItem(
                    message: element[messageKey],
                    sender: element[senderKey],
                  ),
                );
              }
              return ListView(
                reverse: true,
                children: items.reversed.toList(),
              );
            })),
            Container(
              decoration: messageContainerDeco,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: messageTextFieldDeco,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // TODO: Implement send functionality.
                      Backend().sendMessage(
                        sender: _currentUserEmail,
                        message: _messageController.text,
                      );
                      _messageController.clear();
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
