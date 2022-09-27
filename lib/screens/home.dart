import 'package:flutter/material.dart';
import 'package:projeto_flutter_treino_5/components/user_transactions.dart';
import '../components/transactions_chart.dart';

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
        child: Column(
          children: const <Widget>[
            TransactionsChart(),
            UserTransactions(),
          ],
        ),
      ),
    );
  }
}
