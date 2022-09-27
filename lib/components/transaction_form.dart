import 'package:flutter/material.dart';
import 'package:projeto_flutter_treino_5/components/transactions_list.dart';

class TransactionForm extends StatelessWidget {
  const TransactionForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: TextField(
              controller: amountController,
              decoration: const InputDecoration(labelText: 'Amount'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextButton(
                onPressed: () {
                  print(titleController.text);
                  print(amountController.text);
                },
                child: const Text(
                  'Add Transaction',
                  style: TextStyle(color: Colors.deepPurple, fontSize: 16),
                )),
          ),
        ],
      ),
    );
  }
}
