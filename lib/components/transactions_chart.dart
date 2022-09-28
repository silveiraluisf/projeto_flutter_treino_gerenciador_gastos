import 'package:flutter/material.dart';

class TransactionsChart extends StatelessWidget {
  const TransactionsChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 5,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        color: Theme.of(context).primaryColorLight,
        child: const SizedBox(
          width: 300,
          height: 100,
          child: Center(
            child: Text(
              'Lista de gastos',
              style: TextStyle(fontSize: 24, color: Colors.deepPurple),
            ),
          ),
        ),
      ),
    );
  }
}
