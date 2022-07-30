import 'package:flutter/material.dart';

import '../screens/chat_screen.dart';
import 'chat_button.dart';
import 'chat_text_field.dart';
import 'hero_icon.dart';

class UserEntryScaffold extends StatefulWidget {
  const UserEntryScaffold({
    Key? key,
    required this.text,
    required this.color,
    required this.callBack,
  }) : super(key: key);

  final String text;
  final Color color;
  final Future<String?> Function({
    required String email,
    required String password,
  }) callBack;

  @override
  State<UserEntryScaffold> createState() => _UserEntryScaffoldState();
}

class _UserEntryScaffoldState extends State<UserEntryScaffold> {
  bool _isWaiting = false;
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _isWaiting
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Flexible(
                    child: HeroIcon(
                      height: 200.0,
                    ),
                  ),
                  const SizedBox(
                    height: 48.0,
                  ),
                  ChatTextField(
                    hintText: 'Enter your email',
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      _email = value;
                    },
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  ChatTextField(
                    hintText: 'Enter your password',
                    obscureText: true,
                    onChanged: (value) {
                      _password = value;
                    },
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  ChatButton(
                    text: widget.text,
                    color: widget.color,
                    onPressed: () {
                      _onPressed(widget.callBack);
                    },
                  ),
                ],
              ),
            ),
    );
  }

  void _onPressed(
    Future<String?> Function({
      required String email,
      required String password,
    })
        callBack,
  ) {
    setState(() {
      _isWaiting = true;
    });
    callBack(
      email: _email,
      password: _password,
    ).then(
      (response) {
        setState(() {
          _isWaiting = false;
        });
        if (response != null) return _showErrorMessage(response);
        Navigator.pushNamed(context, ChatScreen.route);
      },
    );
  }

  Future<void> _showErrorMessage(String errorMessage) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Center(
            child: Text(errorMessage),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
