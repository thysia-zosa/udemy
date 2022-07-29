import 'package:flutter/material.dart';

import '../widgets/chat_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
            Row(
              children: [
                SizedBox(
                  height: 60.0,
                  child: Image.asset('images/logo.png'),
                ),
                const Text(
                  'Flash Chat',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            ChatButton(
              text: 'Log In',
              color: Colors.lightBlueAccent,
              onPressed: () {
                // TODO: Go to login screen.
              },
            ),
            ChatButton(
              text: 'Register',
              color: Colors.blueAccent,
              onPressed: () {
                // TODO: Go to registration screen.
              },
            ),
          ],
        ),
      ),
    );
  }
}
