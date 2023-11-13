// creating a data model

import 'package:uuid/uuid.dart';
// this uuid class enables us to create an unique id

const uuid = Uuid();

enum Category { food, travel, leisure, work }

class Expense {
  // here we will use named parameters as we need to accept multiple parameters
  // hence not going with positional parameters

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  //here every time the function is instantiated we give id property uuid method of v4 i.e in v4 it creates a random string

  // now deciding which type of data should be present in the expense model

  final String title;
  final double amount;
  // also we need a unique id to identify the expense later

  final String id;

  // using datetime datatype
  final DateTime date;
  final Category category;
}
