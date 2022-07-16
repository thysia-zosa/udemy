import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  QuizPage({Key? key}) : super(key: key);

  final List<Question> questions = [
    Question(
      question: 'You can lead a cow down stairs but not up stairs.',
      answer: false,
    ),
    Question(
      question: 'Approximately one quarter of human bones are in the feet.',
      answer: true,
    ),
    Question(
      question: 'A slug\'s blood is green.',
      answer: true,
    ),
  ];

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<bool> hits = [];
  late int questionNumber;

  void _answer(bool answer) {
    setState(() {
      hits.add(answer == widget.questions[questionNumber].answer);
    });
  }

  @override
  Widget build(BuildContext context) {
    questionNumber = Random().nextInt(widget.questions.length);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                widget.questions[questionNumber].question,
                // 'This is where the question text will go.',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                primary: Colors.white,
              ),
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                _answer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                _answer(false);
              },
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper !!! DONE
        Row(
          children: List.generate(
            hits.length,
            (index) => Icon(
              hits[index] ? Icons.done : Icons.close,
              color: hits[index] ? Colors.green : Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/

class Question {
  String question;
  bool answer;
  Question({
    required this.question,
    required this.answer,
  });
}
