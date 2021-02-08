import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_expense/model/transaction.dart';
import 'package:my_expense/widgets/new_transaction.dart';
import 'package:my_expense/widgets/transaction_list.dart';


class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTxs = [];

  void _addTransaction(String title, double amount) {
    final tx = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now()
    );

    setState(() {
      _userTxs.add(tx);
    });
  }

  void _startAddNewTx(BuildContext ctx) {
    showModalBottomSheet(context: ctx, builder: (_) {
      return GestureDetector(
          child: NewTransaction(addTransactionFun: _addTransaction),
        onTap: () {},
        behavior: HitTestBehavior.opaque,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
              child: Text("MyExpenses")
          ),
          actions: <Widget> [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () => _startAddNewTx(context)
            )
          ],
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
            TransactionList(userTxs: _userTxs),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTx(context),
      ),
    );
  }
}