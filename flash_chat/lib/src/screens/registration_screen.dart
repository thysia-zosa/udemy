import 'package:flutter/material.dart';

import '../widgets/chat_button.dart';
import '../widgets/chat_text_field.dart';
import '../widgets/hero_icon.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  static String route = 'registrationScreen';

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
              text: 'Register',
              color: Colors.blueAccent,
              onPressed: _register,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _register() async {
    // TODO: Implement registration functionality.
  }
}
