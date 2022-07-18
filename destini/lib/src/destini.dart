import 'package:destini/src/story_brain.dart';
import 'package:flutter/material.dart';

import 'story_page.dart';

class Destini extends StatelessWidget {
  Destini({Key? key}) : super(key: key);

  final StoryBrain storyBrain = StoryBrain();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const StoryPage(),
    );
  }
}
