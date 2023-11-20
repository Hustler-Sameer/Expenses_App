import 'package:expense_app/widgets/expenses_list/expenses_list.dart';
import 'package:expense_app/models/expenses.dart';
import 'package:expense_app/widgets/new_expense.dart';
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
  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }
  // we will execute this functoin in add expense file

  void _openAddExpenseOverlay() {
    print('add expense button clicked');
    showModalBottomSheet(
        isScrollControlled: true,
        // this allows us to take our modal whole screen
        context: context,
        builder: (ctx) {
          // now adding new file
          return NewExpense(onAddExpense: _addExpense);
        });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });

    // this will now remove expense and also give the option for undo
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Expense Deleted '),
        duration: Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        )));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text(
        'No expense found , start adding!!',
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }
    return Scaffold(
      // IN scaffold widget we can directly declare appbar
      appBar: AppBar(
        title: const Text('Expense Tracker App'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
            color: Colors.white,
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('Welcome to the App'),
          Expanded(
            child: mainContent,
          )
        ],
      ),
    );
  }
}
