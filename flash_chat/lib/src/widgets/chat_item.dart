import 'package:flash_chat/src/utilities/consts.dart';
import 'package:flutter/material.dart';

import '../models/message.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({
    Key? key,
    required this.message,
    required this.isMe,
  }) : super(key: key);

  final Message message;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            message.sender,
            style: messageSenderStyle,
          ),
          Material(
            borderRadius: BorderRadius.only(
              topLeft: isMe ? messageRadius : Radius.zero,
              topRight: isMe ? Radius.zero : messageRadius,
              bottomLeft: messageRadius,
              bottomRight: messageRadius,
            ),
            elevation: 5.0,
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 20.0,
              ),
              child: Text(
                message.message,
                style: TextStyle(
                  color: isMe ? Colors.white : Colors.black54,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
