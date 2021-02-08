import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_expense/model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTxs;
  final Function removeTx;

  TransactionList({@required this.userTxs, @required this.removeTx});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Padding(
              padding: EdgeInsets.all(5),
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                elevation: 10,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: FittedBox(
                          child: Text('€${userTxs[index].amount}')
                      ),
                    ),
                  ),
                  title: Text(
                    userTxs[index].title,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(userTxs[index].date),
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  trailing: IconButton(
                      icon: Icon(Icons.delete_forever,
                        color: Theme.of(context).errorColor
                      ),
                    onPressed: () {removeTx(userTxs[index].id);},
                  ),
                ),
              ),
            );
          },
          itemCount: userTxs.length,
        ),
    );
  }
}
