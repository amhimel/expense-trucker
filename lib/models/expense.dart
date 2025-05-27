import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

enum Category { food, travel, work, netBill, mobileBill }

final formater = DateFormat.yMd();

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.travel_explore,
  Category.work: Icons.work,
  Category.netBill: Icons.wifi,
  Category.mobileBill: Icons.mobile_friendly,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formatedDate {
    return formater.format(date);
  }
}

class ExpenseBucket {
  final Category category;
  final List<Expense> expenses;
  ExpenseBucket({required this.category, required this.expenses});

  ExpenseBucket.forCategory(List<Expense> allExpense, this.category)
    : expenses =
          allExpense.where((expense) => expense.category == category).toList();

  double get totalExpense {
    double sum = 0;
    // for in loop
    for (final expense in expenses) {
      sum += expense.amount;
    }

    return sum;
  }
}
