import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String text;
  final Function callback;

  Answer({@required this.text, this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.blueAccent,
        child: Text(text),
        onPressed: callback,),
    );
  }
}
