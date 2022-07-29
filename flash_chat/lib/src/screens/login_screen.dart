import 'package:flutter/material.dart';

import '../widgets/chat_button.dart';
import '../widgets/chat_text_field.dart';
import '../widgets/hero_icon.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static String route = 'loginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const HeroIcon(
              height: 200.0,
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
              color: Colors.lightBlueAccent,
              onPressed: _login,
              text: 'Log In',
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _login() async {
    // TODO: implement login functionality.
  }
}
