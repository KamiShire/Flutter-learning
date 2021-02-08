import 'package:flutter/material.dart';


class NewTransaction extends StatefulWidget {

  final Function addTransactionFun;

  NewTransaction({@required this.addTransactionFun});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final title = TextEditingController();

  final amount = TextEditingController();

  void submitData() {
    final enteredText = title.text;
    final enteredAmount = double.parse(amount.text);

    if (enteredText.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addTransactionFun(enteredText, enteredAmount);

    // Chiudi la finestra
    Navigator.of(context).pop();
  }

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
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amount,
              keyboardType: TextInputType.numberWithOptions(signed: false, decimal: true),
              onSubmitted: (_) => submitData(),
            ),
            RaisedButton(
                child: Text("Add transaction"),
                onPressed: submitData
            )
          ],
        ),
      ),
    );
  }
}
