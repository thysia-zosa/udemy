import 'package:flutter/material.dart';

const String collection = 'messages';
const String senderKey = 'sender';
const String messageKey = 'message';

const sendButtonStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const messageTextFieldDeco = InputDecoration(
  contentPadding: EdgeInsets.symmetric(
    vertical: 10.0,
    horizontal: 20.0,
  ),
);

const messageContainerDeco = BoxDecoration(
  border: Border(
    top: BorderSide(
      color: Colors.lightBlueAccent,
      width: 2.0,
    ),
  ),
);

const messageSenderStyle = TextStyle(
  fontSize: 12.0,
  color: Colors.black54,
);

const messageRadius = Radius.circular(30.0);
