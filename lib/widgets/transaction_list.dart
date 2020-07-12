import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransatcion;

  TransactionList({this.transactions, this.deleteTransatcion});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  child: Image.asset('assets/images/no_data.png'),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  child: ListTile(
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Theme.of(context).errorColor,
                        ),
                        onPressed: () =>
                            deleteTransatcion(transactions[index].id),
                      ),
                      title: Text(transactions[index].title),
                      subtitle: Text(
                          DateFormat.yMMMd().format(transactions[index].date)),
                      leading: Container(
                        width: 80,
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColor),
                            borderRadius: BorderRadius.circular(3)),
                        child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              '\$${transactions[index].amount}',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold),
                            )),
                      )),
                );
              },
              itemCount: transactions.length),
    );
  }
}
