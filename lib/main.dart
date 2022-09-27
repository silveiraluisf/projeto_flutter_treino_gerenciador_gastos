import 'package:flutter/material.dart';
import 'package:projeto_flutter_treino_5/transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final List<Transaction> transactions = [
    Transaction(id: '1', title: 'Sapato', amount: 189.99, date: DateTime.now()),
    Transaction(
        id: '2', title: 'Conta de luz', amount: 77.89, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciador de gastos'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(
              width: double.infinity,
              child: Card(
                color: Colors.green,
                child: Text(
                  'Lista de gastos',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
            Column(
              children: transactions.map((tx) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        color: Colors.green,
                        width: 50,
                        height: 70,
                        child: Center(
                            child: Text(
                          tx.amount.toString(),
                          style: const TextStyle(color: Colors.white),
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(tx.title),
                            Text(tx.date.toString()),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
