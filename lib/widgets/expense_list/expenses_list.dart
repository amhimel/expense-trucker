import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expense_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) =>
      // use item swipe option
          Dismissible(

            key: ValueKey(expenses[index]),
            child: ExpenseItem(expenses[index]),
            onDismissed: (direction){
              onRemoveExpense(expenses[index]);
            },
          ),
    );
  }
}
