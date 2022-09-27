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

  final List<Transaction> transaction = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciador de gastos'),
      ),
      body: Center(
        child: Column(
          children: const <Widget>[
            SizedBox(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('Criação de card'),
              ),
            ),
            Card(
              color: Colors.lightBlueAccent,
              child: Text('Segundo texto'),
            )
          ],
        ),
      ),
    );
  }
}
