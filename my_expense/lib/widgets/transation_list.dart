import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_expense/model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTxs;

  TransactionList({@required this.userTxs});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: userTxs.map((el) {
        return Card(
            child: Row(
              children: <Widget> [
                Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                        border: Border.all()
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '€ ${el.amount}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),
                    )
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget> [
                    Text(
                      el.title,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      DateFormat.yMMMd().format(el.date),
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                )
              ],
            )
        );
      }).toList(),
    );
  }
}
