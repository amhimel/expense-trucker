import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    // card widget for create custom list item
    return Card(
      margin: EdgeInsets.fromLTRB(15, 10, 15, 5),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expense.title, style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 4),
            Row(
              children: [
                Text('\$ ${expense.amount.toStringAsFixed(2)}'),
                Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                    SizedBox(height: 8),
                    Text(expense.formatedDate),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
