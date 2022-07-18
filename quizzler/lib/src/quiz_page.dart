import 'package:flutter/material.dart';
import 'question_list.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizPage extends StatefulWidget {
  final questionList = QuestionList();
  QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> hits = [];

  void _answer(bool answer) {
    bool result = answer == widget.questionList.getAnswer();
    hits.add(Icon(
      result ? Icons.done : Icons.close,
      color: result ? Colors.green : Colors.red,
    ));
    if (widget.questionList.isFinished()) {
      Alert(
          context: context,
          type: AlertType.success,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
          buttons: [
            DialogButton(
              child: const Text('CANCEL'),
              onPressed: () {
                setState(() {
                  widget.questionList.reset();
                  hits.clear();
                  Navigator.pop(context);
                });
              },
            )
          ]).show();
    } else {
      setState(() {
        widget.questionList.nextQuestion();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                widget.questionList.getQuestion(),
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
        Row(
          children: hits,
        ),
      ],
    );
  }
}
