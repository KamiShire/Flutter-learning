import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class NewTransaction extends StatefulWidget {

  final Function addTransactionFun;

  NewTransaction({@required this.addTransactionFun});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _title = TextEditingController();
  DateTime _choosenDate;
  final _amount = TextEditingController();

  void submitData() {
    final enteredText = _title.text;
    final enteredAmount = double.parse(_amount.text);
    if (_amount.text.isEmpty)   {
      return;
    }
    if (enteredText.isEmpty || enteredAmount <= 0 || _choosenDate == null) {
      return;
    }
    widget.addTransactionFun(enteredText, enteredAmount, _choosenDate);

    // Chiudi la finestra
    Navigator.of(context).pop();
  }

  void _displayDatePicker() {
    showDatePicker(
        context: context, 
        initialDate: DateTime.now(), 
        firstDate: DateTime(DateTime.now().year),
        lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) {
        return;
      }
      _choosenDate = value;
    });
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
              style: Theme.of(context).textTheme.bodyText1,
              decoration: InputDecoration(
                  labelText: "Title",
              ),
              controller: _title,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              style: Theme.of(context).textTheme.bodyText1,
              decoration: InputDecoration(labelText: "Amount"),
              controller: _amount,
              keyboardType: TextInputType.numberWithOptions(signed: false, decimal: true),
              onSubmitted: (_) => submitData(),
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                   Expanded(
                     child: Text(
                      _choosenDate == null ? 'No date choosen' : DateFormat.yMMMd().format(_choosenDate),
                      style: TextStyle(color: Colors.black54),
                  ),
                   ),
                  FlatButton(
                      onPressed: _displayDatePicker,
                      textColor: Theme.of(context).accentColor,
                      child: Text(
                          'Choose date')
                  )
                ],
              ),
            ),
            RaisedButton(
                child: Text(
                  "Add transaction",
                  style: TextStyle(
                    color: Theme.of(context).textTheme.button.color,
                  ),
                ),
                onPressed: submitData,
                color: Theme.of(context).accentColor,
            )
          ],
        ),
      ),
    );
  }
}
