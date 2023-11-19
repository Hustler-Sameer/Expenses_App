import 'package:expense_app/models/expenses.dart';
import 'package:expense_app/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});
  Function(Expense expense) onRemoveExpense;

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(expenses[index]),
        child: ExpenseItem(expense: expenses[index]),
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
          // this will now remove data
        },
      ),
      // this dimissible is used when we want to remove article using swipeout.
    );
  }
}
