import 'package:flutter/material.dart';
import 'package:main/Domain/models/expense_model.dart';
import 'package:main/UIs/screens/Trip/privateTrips/Budget/expenses_list/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => ExpenseItem(expenses[index]),
    );
  }
}