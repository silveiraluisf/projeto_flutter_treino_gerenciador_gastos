import 'package:flutter/material.dart';
import 'package:projeto_flutter_treino_5/components/transactions_list.dart';
import '../components/transaction_form.dart';
import '../components/transactions_chart.dart';
import '../models/transaction.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Transaction> _userTransactions = [];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  bool _showChart = false;

  void _addNewTransaction(String txTitle, double txAmount,
      DateTime chosenDate) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: chosenDate,
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: TransactionForm(_addNewTransaction),
        );
      },
    );
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLandScape =
        MediaQuery
            .of(context)
            .orientation == Orientation.landscape;
    final appBar = AppBar(
      title: const Text('Gerenciador de gastos'),
      actions: [
        IconButton(
            onPressed: () => _startAddNewTransaction(context),
            icon: const Icon(Icons.add))
      ],
    );
    final txListWidget = Container(
      height: (MediaQuery
          .of(context)
          .size
          .height -
          appBar.preferredSize.height -
          MediaQuery
              .of(context)
              .padding
              .top) *
          0.7,
      child: TransactionsList(_userTransactions, _deleteTransaction),
    );

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (isLandScape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Mostrar gráfico'),
                  Switch(
                      value: _showChart,
                      onChanged: (val) {
                        setState(() {
                          _showChart = val;
                        });
                      })
                ],
              ),
            if (!isLandScape)
              SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.3 -
                    appBar.preferredSize.height,
                child: TransactionsChart(_recentTransactions),
              ),
            if (!isLandScape) txListWidget,
            if (isLandScape) _showChart
                ? SizedBox(
                  height: (MediaQuery.of(context).size.height -
                    appBar.preferredSize.height - MediaQuery.of(context).padding.top) *
                0.7,
                child: TransactionsChart(_recentTransactions),
            )
                : txListWidget
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
