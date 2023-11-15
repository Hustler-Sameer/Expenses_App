import 'package:expense_app/models/expenses.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  ExpenseItem({super.key, required this.expense});

  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          children: [
            Text(expense.title),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text(
                    '\$${expense.amount.toStringAsFixed(2)}'), // this to StringAsFixed would display 12.454444 as 12.45 only
                // the dollar sign after backward \ signifies that it should be considered as string not injection syntax
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(expense.formattedDate),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
