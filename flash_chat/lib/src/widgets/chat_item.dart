import 'package:flutter/material.dart';

import '../models/message.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({
    Key? key,
    required this.message,
  }) : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Text('${message.message} from ${message.sender}');
  }
}
