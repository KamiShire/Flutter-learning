import 'package:flutter/material.dart';
import 'package:my_expense/model/transaction.dart';
import 'package:my_expense/widgets/new_transaction.dart';
import 'package:my_expense/widgets/transation_list.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
        NewTransaction(addTransactionFun: _addTransaction),
        TransactionList(userTxs: _userTxs)
      ],
    );
  }
}
