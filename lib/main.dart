import 'package:flutter/material.dart';

// Function called to start the app
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyAppState();
  }
}
/// State è un oggetto generico di Flutter
/// Il widget può essere ricreato quando i
/// dati esterni cambiano.
/// Lo stato invece è persistente e non viene ricreato
class MyAppState extends State<MyApp> {
    var questionIndex = 0;

    void answerQuestion() {
      questionIndex = questionIndex + 1;
      print("Button pressed");
    }

    @override
    Widget build(BuildContext context) {
      var questions = [
        'What\'s the REAL tomato sauce according to the scientific community?',
        'Are you sure?'
      ];
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text("Important Question")),
          body: Column(children: <Widget>[
           Text(questions.elementAt(questionIndex)),
           RaisedButton(
               child: Text('Italian tomato sauce, of course'),
               onPressed: answerQuestion,),
            // onPressed: answerQuestion() non va bene perchè verrebbe eseguita
            // a build time
            // non mettendo le parentesi si passa un puntatore alla funzione
            RaisedButton(
              child: Text('Turkish, but I know that I\'m wrong'),
              onPressed: answerQuestion,),
            RaisedButton(
              child: Text('ITALIAN'),
              // Anonymous function
              onPressed: () {
                print("Scelta giusta");
              },)
            ],
          ),
        )
      );
    }
  }
