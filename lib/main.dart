import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

// Function called to start the app
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MyAppState();
  }
}
/// State è un oggetto generico di Flutter
/// Il widget può essere ricreato quando i
/// dati esterni cambiano.
/// Lo stato invece è persistente e non viene ricreato
///
/// Mettendo l'underscore prima del nome si rende la classe privata
class _MyAppState extends State<MyApp> {
    var _questionIndex = 0;
    final _questions = const [
      {
        'questionText': 'What\'s the REAL tomato sauce according to the scientific community?',
        'answers': ['A', 'b', 'c', 'd']
      },
      {
        'questionText': 'Are you sure?',
        'answers': ['Errrr', 'F', 'G', 'H']
      },
    ];

    void _answerQuestion() {
      /*
        Forza flutter a fare il re-render
        chiama il build del widget a cui si riferirisce
        quindi fa i render del widget.
       */
      if (_questionIndex < _questions.length) {
        setState(() {
          _questionIndex = _questionIndex + 1;
        });
      }
      print("Button pressed");
    }

    void resetQuiz() {
      setState(() {
        _questionIndex = 0;
      });
      print("reset called");
    }

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text("Important Question")),
          body: _questionIndex < _questions.length ?
          Quiz(
                questionIndex: _questionIndex,
                questions:_questions,
                answerQuestion: _answerQuestion)
            :
          Result(resultText: "Done", resetFun: resetQuiz),
        )
      );
    }
  }
