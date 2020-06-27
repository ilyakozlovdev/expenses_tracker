import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountContoller = TextEditingController();

  final focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: titleController,
            autofocus: true,
            onSubmitted: (_) => FocusScope.of(context).requestFocus(focus),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: amountContoller,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            focusNode: focus,
            onSubmitted: (_) {
              if (titleController.text.length == 0 ||
                  double.parse(amountContoller.text) < 0) {
                return;
              }
              widget.addNewTransaction(
                  title: titleController.text,
                  amount: double.parse(amountContoller.text));
              Navigator.of(context).pop();
            },
          ),
          FlatButton(
              onPressed: () {
                widget.addNewTransaction(
                    title: titleController.text,
                    amount: double.parse(amountContoller.text));
                Navigator.of(context).pop();
              },
              child: Text(
                'Add transaction',
              ))
        ],
      ),
    );
  }
}
