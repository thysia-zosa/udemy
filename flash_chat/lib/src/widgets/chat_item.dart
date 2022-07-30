import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({
    Key? key,
    required this.message,
    required this.sender,
  }) : super(key: key);

  final String message;
  final String sender;

  @override
  Widget build(BuildContext context) {
    return Text('$message from $sender');
  }
}
