import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountContoller = TextEditingController();
  DateTime _selectedDate;

  final amount = FocusNode();
  final datePicker = FocusNode();

  _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: _selectedDate == null ? DateTime.now() : _selectedDate,
            firstDate: DateTime(1990),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) return;
      _selectedDate = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
              top: 15,
              left: 15,
              right: 15,
              bottom: MediaQuery.of(context).viewInsets.bottom + 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
                autofocus: true,
                onSubmitted: (_) => FocusScope.of(context).requestFocus(amount),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountContoller,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                focusNode: amount,
                onSubmitted: (_) {
                  _presentDatePicker();
                },
              ),
              Container(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(_selectedDate == null
                        ? 'No date picked'
                        : DateFormat.yMMMd().format(_selectedDate)),
                    FlatButton(
                        onPressed: _presentDatePicker,
                        child: Text('Pick a date'))
                  ],
                ),
              ),
              RaisedButton(
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                    if (titleController.text.length == 0 ||
                        double.parse(amountContoller.text) < 0 ||
                        _selectedDate == null) {
                      return;
                    }
                    widget.addNewTransaction(
                        title: titleController.text,
                        amount: double.parse(amountContoller.text),
                        date: _selectedDate);
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Add transaction',
                  ))
            ],
          ),
        ),
      );
    });
  }
}
