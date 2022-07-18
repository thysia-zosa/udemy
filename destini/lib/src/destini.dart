import 'package:flutter/material.dart';

import 'story_page.dart';

class Destini extends StatelessWidget {
  const Destini({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const StoryPage(),
    );
  }
// TODO: Step 9 - Create a new storyBrain object from the StoryBrain class.
}
