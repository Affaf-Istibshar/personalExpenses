import 'dart:io';
// import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class NewTransactions extends StatefulWidget {
  final Function addTx;
  //addTx property of widget
  NewTransactions(this.addTx);

  @override
  State<NewTransactions> createState() => _NewTransactionsState();
}

class _NewTransactionsState extends State<NewTransactions> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;
  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    // for validation
    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    //widget class properties
    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );
    //context give access to the context of the widget
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    // context on right side shows global context, which refers to the class property..
    // left one just the argument of the widget
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10,
              left: 10,
              right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                onSubmitted: (_) => _submitData(),

                // onChanged: (value){
                //   titleInput = value;
                // },
                controller: _titleController,
              ),
              // CupertinoTextField(
              //   placeholder: ,
              // ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                // onChanged: (val) {
                //   amountInput = val;
                // },
                controller: _amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Expanded(
                        child: Text(_selectedDate == null
                            ? 'No date chosen'
                            //string interpolation
                            : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}'),
                      ),
                    ),
                        Platform.isIOS
                        ? CupertinoButton(
                            onPressed: _presentDatePicker,
                            child: const Text('Choose date'))
                        : TextButton(
                            style: TextButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 20),
                            ),
                            onPressed: _presentDatePicker,
                            child: const Text('Choose date'),
                          ),
                    // ElevatedButton(
                    //     onPressed: () {},
                    //   child: Text('Choose Date'),
                    //   style: ElevatedButton.styleFrom(
                    //     backgroundColor: Colors.purple,
                    //   ),)
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: ElevatedButton(
                  child: Text(
                    'Add Transaction',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                  ),
                  onPressed: _submitData,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
