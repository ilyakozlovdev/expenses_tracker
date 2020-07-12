import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/chart.dart';
import './models/transaction.dart';

void main() {
  WidgetsFlutterBinding();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
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
            accentColor: Colors.amberAccent,
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
        id: 't0', title: 'OnePlus 8T', amount: 672.99, date: DateTime.now()),
    Transaction(
        id: 't1',
        title: 'Apple iPad Pro',
        amount: 999.99,
        date: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'Google Pixel 5',
        amount: 782.99,
        date: DateTime.now()),
  ];

  void _addNewTransaction(
      {@required String title,
      @required double amount,
      @required DateTime date}) {
    final newTransaction = Transaction(
        id: 't${_userTransactions.length}',
        title: title,
        amount: amount,
        date: date);
    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  void _deleteTransaction(id) {
    setState(() {
      _userTransactions.removeWhere((element) => element.id == id);
    });
  }

  List<Transaction> get _recentTransactions {
    return _userTransactions
        .where((element) =>
            element.date.isAfter(DateTime.now().subtract(Duration(days: 7))))
        .toList();
  }

  double get totalSpendings {
    return _recentTransactions.fold(
        0.0, (previousValue, element) => previousValue + element.amount);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQeury = MediaQuery.of(context);
    final isLanscape = mediaQeury.orientation == Orientation.landscape;

    final appBar = AppBar(
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
    );

    var availableSpace = mediaQeury.size.height -
        appBar.preferredSize.height -
        mediaQeury.padding.top;
    return Scaffold(
      appBar: appBar,
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
            Container(
              height: isLanscape ? availableSpace * 0.5 : availableSpace * 0.25,
              child: Chart(
                recentTransactions: _userTransactions,
                totalSpendings: totalSpendings,
              ),
            ),
            Container(
              height: isLanscape ? availableSpace * 0.5 : availableSpace * 0.75,
              child: TransactionList(
                  transactions: _userTransactions,
                  deleteTransatcion: _deleteTransaction),
            )
          ],
        ),
      ),
    );
  }
}
