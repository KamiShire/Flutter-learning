import 'package:flutter/material.dart';


class NewTransaction extends StatelessWidget {

  final title = TextEditingController();
  final amount = TextEditingController();
  final Function addTransactionFun;

  NewTransaction({@required this.addTransactionFun});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children:  <Widget> [
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: title,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amount,
            ),
            RaisedButton(
                child: Text("Add transaction"),
                onPressed: () => addTransactionFun(title.text, double.parse(amount.text))
            )
          ],
        ),
      ),
    );
  }
}
