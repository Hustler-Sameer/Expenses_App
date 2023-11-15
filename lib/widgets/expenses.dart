import 'package:expense_app/widgets/expenses_list/expenses_list.dart';
import 'package:expense_app/models/expenses.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key}); // constructor function

  State<Expenses> createState() {
    return _Expenses();
  }
}

class _Expenses extends State<Expenses> {
  // dummy expenses
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Flutter Course',
        amount: 19.99,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'Cinema',
        amount: 20,
        date: DateTime.now(),
        category: Category.leisure)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // IN scaffold widget we can directly declare appbar
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
            color: Colors.white,
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('Welcome to the App'),
          Expanded(
            child: ExpensesList(expenses: _registeredExpenses),
          )
        ],
      ),
    );
  }
}