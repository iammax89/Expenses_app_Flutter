import 'package:expenses_app/models/transaction.dart';
import 'package:flutter/material.dart';

import 'list-of-transactions.dart';
import 'new-transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: DateTime.now().toString(),
        title: "New MacBook",
        amount: 2200.00,
        date: DateTime.now()),
    Transaction(
        id: DateTime.now().toString(),
        title: "New Shoes",
        amount: 69.00,
        date: DateTime.now())
  ];

  void _addNewTransaction(String title, double amount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      NewTransaction(_addNewTransaction),
      ListOfTransactions(
        transactions: _userTransactions,
      )
    ]);
  }
}
