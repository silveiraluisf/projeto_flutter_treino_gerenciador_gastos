import 'package:flutter/material.dart';

class TransactionsChart extends StatelessWidget {
  const TransactionsChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
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
    );
  }
}
