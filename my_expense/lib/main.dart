import 'package:flutter/material.dart';

void main() => runApp(MyHomePage());


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
              child: Text("MyExpenses")
          )
      ),
      body: Column(
        children: <Widget>[
          Card(
            child: Text("CHART"),
          ),
          Card(
            child: Text("TX LIST"),
          )
        ],
      ),
    );
  }
}

