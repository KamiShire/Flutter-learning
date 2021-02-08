import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_expense/model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTxs;

  TransactionList({@required this.userTxs});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Card(
                child: Row(
                  children: <Widget> [
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            color: Theme.of(context).accentColor,
                        ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '€ ${userTxs[index].amount.toStringAsFixed(2)}',
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
                          userTxs[index].title,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          DateFormat.yMMMd().format(userTxs[index].date),
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    )
                  ],
                )
            );
          },
          itemCount: userTxs.length,
        ),
    );
  }
}
