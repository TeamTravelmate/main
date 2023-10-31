import 'package:flutter/material.dart';
import 'package:main/Domain/models/expense_model.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.exp, {super.key});

  final Expense exp;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            Row(
              children: [
                Row(
                  children: [
                    Icon(categoryIcons[exp.category]),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(exp.title),
                  ],
                ),
                const Spacer(),
                Text("Rs ${exp.amount.toStringAsFixed(2)}"),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(exp.formattedDate)
              ],
            )
          ],
        ),
      ),
    );
  }
}
