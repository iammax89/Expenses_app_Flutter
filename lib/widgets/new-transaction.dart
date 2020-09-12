import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  void onSubmit() {
    final String enteredTitle = titleController.text;
    final double enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty && enteredAmount <= 0) {
      return;
    }
    addNewTransaction(
        titleController.text, double.parse(amountController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
                onSubmitted: (_) => onSubmit(),
                // onChanged: (value) {
                //   titleInput = value;
                // },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => onSubmit(),
                // onChanged: (value) {
                //   amountInput = value;
                // },
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                child: RaisedButton(
                  onPressed: onSubmit,
                  child: Text(
                    "Add Transaction",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                ),
              )
            ],
          )),
    );
  }
}
