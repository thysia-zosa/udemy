import 'package:flutter/material.dart';

import 'story_brain.dart';

class StoryPage extends StatefulWidget {
  final StoryBrain storyBrain = StoryBrain();

  StoryPage({Key? key}) : super(key: key);

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'images/background.png',
              ),
              fit: BoxFit.cover),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 50.0,
          horizontal: 15.0,
        ),
        constraints: const BoxConstraints.expand(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 12,
              child: Center(
                child: Text(
                  widget.storyBrain.getStory(),
                  style: const TextStyle(
                    fontSize: 25.0,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: TextButton(
                onPressed: () {
                  // Choice 1 made by user.
                  setState(() {
                    widget.storyBrain.nextStory(1);
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.red,
                  ),
                ),
                child: Text(
                  widget.storyBrain.getChoice1(),
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              flex: 2,
              child: Visibility(
                visible: widget.storyBrain.buttonShouldBeVisible(),
                child: TextButton(
                  onPressed: () {
                    // Choice 2 made by user.
                    setState(() {
                      widget.storyBrain.nextStory(2);
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.blue,
                    ),
                  ),
                  child: Text(
                    widget.storyBrain.getChoice2(),
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
