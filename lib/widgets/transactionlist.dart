import 'package:flutter/material.dart';
import '../model/transaction.dart';
import './transaction_item.dart';
class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deletetx;
  TransactionList(this.transactions, this.deletetx);
  @override
  Widget build(BuildContext context) {
    // a column with singlechildscrollableview
    return ListView.builder(
      // takes function that gives context (object.. holds info about position in widget tree)
      itemBuilder: (context, index) {
        return TransactionItem(transaction: transactions[index], deletetx: deletetx);
      },
      //   Card(
      //   child: Row(
      //     children: [
      //       Container(
      //         margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      //         decoration: BoxDecoration(
      //           border: Border.all(
      //             color: Theme.of(context).primaryColor,
      //             width: 2,
      //           ),
      //         ),
      //         padding: EdgeInsets.all(10),
      //         child: Text(
      //           //String Interpolation $ sign for interpolation in flutter
      //           '\$${transactions[index].amount.toStringAsFixed(2)}',
      //           style: TextStyle(
      //             fontWeight: FontWeight.bold,
      //             fontSize: 20,
      //             color: Colors.purple,
      //           ),
      //         ),
      //       ),
      //       Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Text(
      //             transactions[index].title,
      //             // style: TextStyle(
      //             //   fontSize: 16,
      //             //   fontWeight: FontWeight.bold,
      //             // ),
      //             style: Theme.of(context).textTheme.titleLarge,
      //           ),
      //           Text(
      //             DateFormat().format(transactions[index].date),
      //             style: TextStyle(
      //               fontWeight: FontWeight.bold,
      //               color: Colors.grey,
      //             ),
      //           ),
      //         ],
      //       )
      //     ],
      //   ),
      // );
      // } ,
      itemCount: transactions.length,
      // children: transactions.map((tx)
      // {
      //
      // }).toList(),
    );
  }
}


