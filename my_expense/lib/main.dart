import 'package:flutter/material.dart';
import 'widgets/home.dart';


void main() => runApp(Home());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MyExpenses",
      home: MyHomePage()
    );
  }
}



