import 'package:flutter/material.dart';


class Result extends StatelessWidget {
  final String resultText;
  final Function resetFun;

  Result({@required this.resultText, @required this.resetFun});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: [
            Text(
              resultText,
              style: TextStyle(fontSize: 36),
              textAlign: TextAlign.center,
            ),
            RaisedButton(
                child: Text("Reset"),
                onPressed: resetFun)
          ],
        ),
    );
  }
}
