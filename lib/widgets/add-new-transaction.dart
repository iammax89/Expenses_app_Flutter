import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddNewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  AddNewTransaction(this.addNewTransaction);

  @override
  _AddNewTransactionState createState() => _AddNewTransactionState();
}

class _AddNewTransactionState extends State<AddNewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _pickedDateTime;

  void _onSubmit() {
    final String enteredTitle = _titleController.text;
    final double enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty && enteredAmount <= 0 && _pickedDateTime == null) {
      return;
    }
    widget.addNewTransaction(_titleController.text,
        double.parse(_amountController.text), _pickedDateTime);

    Navigator.of(context).pop();
  }

  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _pickedDateTime = value;
      });
    });
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
                controller: _titleController,
                onSubmitted: (_) => _onSubmit(),
                // onChanged: (value) {
                //   titleInput = value;
                // },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: _amountController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _onSubmit(),
                // onChanged: (value) {
                //   amountInput = value;
                // },
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_pickedDateTime == null
                        ? 'No Date picked.'
                        : DateFormat.yMMMd().format(_pickedDateTime)),
                    FlatButton(
                      onPressed: _showDatePicker,
                      child: Text(
                        'Choose Date',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                child: RaisedButton(
                  onPressed: _onSubmit,
                  child: Text(
                    "Add Transaction",
                    style: TextStyle(
                        color: Theme.of(context).textTheme.button.color),
                  ),
                  color: Theme.of(context).primaryColor,
                ),
              )
            ],
          )),
    );
  }
}
