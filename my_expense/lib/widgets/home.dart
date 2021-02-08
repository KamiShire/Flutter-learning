import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_expense/model/transaction.dart';
import 'package:my_expense/widgets/chart.dart';
import 'package:my_expense/widgets/new_transaction.dart';
import 'package:my_expense/widgets/transaction_list.dart';


class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTxs = [];

  get recentTxs {
    return _userTxs.where((element) {
      return element.date.isAfter(
          DateTime.now().subtract(Duration(days: 7))
      );
    }).toList();
  }
   void _addTransaction(String title, double amount, DateTime date) {
    final tx = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: date
    );

    setState(() {
      _userTxs.add(tx);
    });
  }

  void _deleteTx(String id) {
    setState(() {
      _userTxs.removeWhere((element) => element.id == id);
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
            Chart(recentTxs),
            TransactionList(userTxs: _userTxs, removeTx: _deleteTx),
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