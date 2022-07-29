import 'package:flutter/material.dart';

class ChatTextField extends StatefulWidget {
  const ChatTextField({
    Key? key,
    required this.hintText,
    required this.onChanged,
  }) : super(key: key);

  final String hintText;
  final void Function(String) onChanged;

  @override
  State<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(32.0),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.lightBlueAccent,
            width: 1.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(32.0),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.lightBlueAccent,
            width: 2.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(32.0),
          ),
        ),
      ),
    );
  }
}
