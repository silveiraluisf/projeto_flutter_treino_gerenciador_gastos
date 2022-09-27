import 'package:flutter/material.dart';
import '../components/transaction_form.dart';
import '../components/transactions_chart.dart';
import '../components/transactions_list.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Gerenciador de gastos'),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(color: Colors.black12),
          child: Column(
            children: const <Widget>[
              TransactionsChart(),
              TransactionForm(),
              TransactionsList(),
            ],
          ),
        ),
      ),
    );
  }
}
