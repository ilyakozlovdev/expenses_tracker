import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList({this.transactions});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2, color: Theme.of(context).accentColor),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Text(
                          '\$${transactions[index].amount.toStringAsFixed(2)}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        transactions[index].title,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      Text(
                        DateFormat.yMMMd().format(transactions[index].date),
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ],
                  )
                ],
              ),
              elevation: 2,
            );
          },
          itemCount: transactions.length),
    );
  }
}
