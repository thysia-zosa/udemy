import 'package:flutter/material.dart';

import '../backend/backend.dart';
import '../widgets/user_input_scaffold.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  static String route = 'registrationScreen';

  @override
  Widget build(BuildContext context) {
    return UserInputScaffold(
      text: 'Register',
      color: Colors.blueAccent,
      callBack: Backend().register,
    );
  }
}
