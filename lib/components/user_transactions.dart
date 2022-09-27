import 'package:flutter/material.dart';
import '../components/transaction_form.dart';
import '../components/transactions_list.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({Key? key}) : super(key: key);

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionForm(),
        TransactionsList(),
      ],
    );
  }
}
