import 'package:flutter/material.dart';
import './widgets/new_transaction.dart';
import './models/transaction.dart';
import './widgets/transaction_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: HomePage(),
        title: 'My Expenses',
        theme: ThemeData(
            primarySwatch: Colors.amber,
            textTheme: TextTheme(
                subtitle1: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
                subtitle2: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                )),
            iconTheme: IconThemeData(
              color: Colors.white,
            )));
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final titleContoller = TextEditingController();

  final amountContoller = TextEditingController();

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            child: NewTransaction(_addNewTransaction),
            onTap: () => null,
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  final List<Transaction> _userTransactions = [
    Transaction(
        id: 't1', title: 'OnePlus 8T', amount: 72.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Apple iPad Pro', amount: 99.99, date: DateTime.now()),
    Transaction(
        id: 't3', title: 'Google Pixel 5', amount: 82.99, date: DateTime.now()),
    Transaction(
        id: 't1', title: 'OnePlus 8T', amount: 72.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Apple iPad Pro', amount: 99.99, date: DateTime.now()),
    Transaction(
        id: 't3', title: 'Google Pixel 5', amount: 82.99, date: DateTime.now()),
    Transaction(
        id: 't1', title: 'OnePlus 8T', amount: 72.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Apple iPad Pro', amount: 99.99, date: DateTime.now()),
    Transaction(
        id: 't3', title: 'Google Pixel 5', amount: 82.99, date: DateTime.now()),
    Transaction(
        id: 't1', title: 'OnePlus 8T', amount: 72.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Apple iPad Pro', amount: 99.99, date: DateTime.now()),
    Transaction(
        id: 't3', title: 'Google Pixel 5', amount: 82.99, date: DateTime.now()),
    Transaction(
        id: 't1', title: 'OnePlus 8T', amount: 72.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Apple iPad Pro', amount: 99.99, date: DateTime.now()),
    Transaction(
        id: 't3', title: 'Google Pixel 5', amount: 82.99, date: DateTime.now()),
    Transaction(
        id: 't1', title: 'OnePlus 8T', amount: 72.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Apple iPad Pro', amount: 99.99, date: DateTime.now()),
    Transaction(
        id: 't3', title: 'Google Pixel 5', amount: 82.99, date: DateTime.now()),
    Transaction(
        id: 't1', title: 'OnePlus 8T', amount: 72.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Apple iPad Pro', amount: 99.99, date: DateTime.now()),
    Transaction(
        id: 't3', title: 'Google Pixel 5', amount: 82.99, date: DateTime.now()),
    Transaction(
        id: 't1', title: 'OnePlus 8T', amount: 72.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Apple iPad Pro', amount: 99.99, date: DateTime.now()),
    Transaction(
        id: 't3', title: 'Google Pixel 5', amount: 82.99, date: DateTime.now())
  ];

  void _addNewTransaction({String title, double amount}) {
    final newTransaction = Transaction(
        id: 't${_userTransactions.length}',
        title: title,
        amount: amount,
        date: DateTime.now());
    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Expenses',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
        elevation: 5,
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
            color: Theme.of(context).iconTheme.color,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: Icon(
          Icons.add,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Card(
                elevation: 3,
                margin: EdgeInsets.symmetric(horizontal: 4, vertical: 15),
                child: Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Charts!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ],
                    ))),
            Column(
              children: <Widget>[
                TransactionList(
                  transactions: _userTransactions,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
