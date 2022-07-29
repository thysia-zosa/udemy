import 'package:flutter/material.dart';

import '../widgets/chat_button.dart';
import '../widgets/chat_text_field.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
            SizedBox(
              height: 200.0,
              child: Image.asset('images/logo.png'),
            ),
            const SizedBox(
              height: 48.0,
            ),
            ChatTextField(
              hintText: 'Enter your email',
              onChanged: (value) {
                // TODO: Do something with the user input.
              },
            ),
            const SizedBox(
              height: 8.0,
            ),
            ChatTextField(
              hintText: 'Enter your password',
              onChanged: (value) {
                // TODO: Do something with the user input.
              },
            ),
            const SizedBox(
              height: 24.0,
            ),
            ChatButton(
                text: 'Register',
                color: Colors.blueAccent,
                onPressed: () {
                  // TODO: Implement registration functionality.
                }),
          ],
        ),
      ),
    );
  }
}
