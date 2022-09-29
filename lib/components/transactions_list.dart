import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  const TransactionsList(this.transactions, this.deleteTx, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: transactions.isEmpty
          ? LayoutBuilder(builder: (ctx, constraints) {
              return Column(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'Nenhum gasto efetuado ainda!',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: constraints.maxHeight * 0.5,
                      child: Image.asset('assets/images/waiting.png',
                      fit: BoxFit.cover,),
                    ),
                  )
                ],
              );
            },
      )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                    elevation: 3,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Theme.of(context).primaryColor,
                        ),
                        width: 90,
                        height: 40,
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: FittedBox(
                            child: Text(
                              'R\$${transactions[index].amount.toStringAsFixed(2)}',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        transactions[index].title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date),
                      ),
                      trailing: MediaQuery.of(context).size.width > 460
                        ? TextButton.icon(onPressed: () => deleteTx(transactions[index].id), 
                          icon: const Icon(Icons.delete),
                          label: const Text('Apagar'),
                      )
                          : IconButton(
                          onPressed: () => deleteTx(transactions[index].id),
                          icon: const Icon(Icons.delete)),
                    ));
              },
              itemCount: transactions.length,
            ),
    );
  }
}
