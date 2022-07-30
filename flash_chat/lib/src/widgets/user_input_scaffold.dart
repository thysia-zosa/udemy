import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/chat_screen.dart';
import 'chat_button.dart';
import 'chat_text_field.dart';
import 'hero_icon.dart';

class UserInputScaffold extends StatefulWidget {
  const UserInputScaffold({
    Key? key,
    required this.text,
    required this.color,
    required this.callBack,
  }) : super(key: key);

  final String text;
  final Color color;
  final Future<UserCredential> Function({
    required String email,
    required String password,
  }) callBack;

  @override
  State<UserInputScaffold> createState() => _UserInputScaffoldState();
}

class _UserInputScaffoldState extends State<UserInputScaffold> {
  bool _isWaiting = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                    controller: _emailController,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  ChatTextField(
                    hintText: 'Enter your password',
                    controller: _passwordController,
                    obscureText: true,
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
    Future<UserCredential> Function({
      required String email,
      required String password,
    })
        callBack,
  ) {
    setState(() {
      _isWaiting = true;
    });
    callBack(
      email: _emailController.text,
      password: _passwordController.text,
    ).then(
      (response) {
        setState(() {
          _isWaiting = false;
        });
        Navigator.pushNamed(context, ChatScreen.route);
      },
    ).catchError(
      (error) {
        setState(() {
          _isWaiting = false;
        });
        _showErrorMessage(
          error,
          _emailController.text,
          _passwordController.text,
        );
      },
    );
  }

  Future<void> _showErrorMessage(
    String errorMessage,
    String email,
    String password,
  ) {
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
                _emailController.text = email;
                _passwordController.text = password;
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
