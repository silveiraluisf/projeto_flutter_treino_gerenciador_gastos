import 'package:flutter/material.dart';
import 'package:projeto_flutter_treino_5/components/transaction_form.dart';
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
              SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  color: Colors.deepPurple,
                  child: SizedBox(
                    width: 300,
                    height: 100,
                    child: Center(
                      child: Text(
                        'Lista de gastos',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              TransactionForm(),
              TransactionsList(),
            ],
          ),
        ),
      ),
    );
  }
}
