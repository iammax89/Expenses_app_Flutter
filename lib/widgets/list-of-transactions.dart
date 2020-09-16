import 'package:expenses_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListOfTransactions extends StatelessWidget {
  final List<Transaction> transactions;
  final Function removeTransaction;

  ListOfTransactions(
      {@required this.transactions, @required this.removeTransaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 16),
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  'No Transactions added yet.',
                  style: TextStyle(fontSize: 26),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  elevation: 4,
                  child: ListTile(
                    title: Text(transactions[index].title),
                    subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date)),
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FittedBox(
                            child: Text(
                                '\$${transactions[index].amount.toStringAsFixed(2)}')),
                      ),
                    ),
                    trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                        onPressed: () {
                          removeTransaction(transactions[index].id);
                        }),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
