import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

// Above packages for further functionalities
class Transaction {
  //final means these constants, getting values on runtime
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  //Constructor of the class , pass values
  Transaction(
      {@required this.id,
      @required this.title,
      @required this.amount,
      @required this.date});
}
