import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_expense/widgets/UserTransactions.dart';
import 'package:my_expense/widgets/new_transaction.dart';
import 'file:///C:/Sviluppo/AndroidStudioWorkspace/flutter-learning/my_expense/lib/model/transaction.dart';
import 'package:my_expense/widgets/transation_list.dart';


class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
              child: Text("MyExpenses")
          )
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              child: Container(
                  width: double.infinity,
                  child: Text("CHART")
              ),
              elevation: 10,
            ),
            UserTransactions()
          ],
        ),
      ),
    );
  }
}