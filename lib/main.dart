import 'package:flutter/material.dart';
import 'package:flutter_udemy/answer.dart';

import './question.dart';

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

    void _answerQuestion() {
      /*
        Forza flutter a fare il re-render
        chiama il build del widget a cui si riferirisce
        quindi fa i render del widget.
       */
      setState(() {
        _questionIndex = _questionIndex + 1;
      });

      print("Button pressed");
    }

    @override
    Widget build(BuildContext context) {
      const questions = [
        {
          'questionText': 'What\'s the REAL tomato sauce according to the scientific community?',
          'answers': ['A', 'b', 'c', 'd']
        },
        {
          'questionText': 'Are you sure?',
          'answers': ['Errrr', 'F', 'G', 'H']
        },
      ];
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text("Important Question")),
          body: Column(
            children: <Widget>[
              Question(
                  questions.elementAt(_questionIndex)['questionText']
              ),
              // ... prende una lista, ci toglie li elementi e li mette nella lista che wrappa
              ...(questions[_questionIndex]['answers'] as List<String>).map((answer) {
                return Answer(text: answer, callback: _answerQuestion);
              }).toList()
            ],
          ),
        )
      );
    }
  }
