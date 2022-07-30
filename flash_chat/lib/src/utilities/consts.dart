import 'package:flutter/material.dart';

const String collection = 'messages';
const String sender = 'sender';
const String message = 'message';

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
