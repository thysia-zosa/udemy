import 'package:flutter/material.dart';

import '../backend/backend.dart';
import '../widgets/user_input_scaffold.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static String route = 'loginScreen';

  @override
  Widget build(BuildContext context) {
    return UserInputScaffold(
      text: 'Log In',
      color: Colors.lightBlueAccent,
      callBack: Backend().login,
    );
  }
}
