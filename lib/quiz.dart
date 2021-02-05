
import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final int questionIndex;
  final List<Map<String, Object>> questions;
  final Function answerQuestion;

  Quiz({ @required this.questionIndex, @required this.questions, @required this.answerQuestion});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(
            questions.elementAt(questionIndex)['questionText']
        ),
        // ... prende una lista, ci toglie li elementi e li mette nella lista che wrappa
        ...(questions[questionIndex]['answers'] as List<String>).map((answer) {
          return Answer(text: answer, callback: answerQuestion);
        }).toList()
      ],
    );
  }
}
