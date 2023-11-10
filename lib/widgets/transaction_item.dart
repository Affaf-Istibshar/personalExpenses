import 'package:flutter/material.dart';
import 'package:intl/intl.dart/';
import '../model/transaction.dart';
class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deletetx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deletetx;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 20,
          child: Padding(
            padding: EdgeInsets.all(6.0),
            child:
            FittedBox(child: Text('\$${transaction.amount}')),
          ),
        ),
        title: Text(transaction.title),
        //  style: Theme.of(context).textTheme.title,
        subtitle:
        Text(DateFormat.yMMMd().format(transaction.date)),
        trailing: MediaQuery.of(context).size.width > 500 ?
        ElevatedButton.icon(
          icon: Icon(Icons.delete) ,
          label: Text('Delete', style: TextStyle(color: Colors.white),),
          onPressed: () => deletetx(transaction.id),
        ) :
        IconButton(
          icon: Icon(Icons.delete),
          color: Colors.red,
        ),
        onTap: () => deletetx(transaction.id),
      ),
    );
  }
}