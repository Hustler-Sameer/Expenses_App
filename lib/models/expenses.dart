// creating a data model

import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// using dateformatter from intl package
final formatter = DateFormat.yMd();

// this uuid class enables us to create an unique id

const uuid = Uuid();

enum Category { food, travel, leisure, work }
// this values are treated kind of strings

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
  // here we have mapped various icons with the enums category available to us.
};

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

  String get formattedDate {
    return formatter.format(date);
  }
}
// creating a datamodel for chart

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenses});
  final category;
  final List<Expense> expenses;

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();
  // the above function is a utility function that helps us to filter out on basis of some category
  // some category and then it starts to make a list and hence it gives us the list of items of same category,
  double get totalExpenses {
    double sum = 0;
    // for in l
    for (final expense in expenses) {
      sum = sum + expense.amount;
    }

    return sum;
  }
}
