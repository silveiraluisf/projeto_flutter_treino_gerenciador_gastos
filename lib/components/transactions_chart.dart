import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionsChart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  TransactionsChart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 5,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        color: Theme
            .of(context)
            .primaryColorLight,
        child: SizedBox(
          width: 300,
          height: 100,
          child: Center(
            child: Row(
              children: groupedTransactionValues.map((data) {
                return Text(
                  '${data['day']}: ${data['amount']}',
                  // style: TextStyle(fontSize: 24, color: Colors.deepPurple),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
