import 'package:flutter/material.dart';
import 'package:main/Domain/models/expense_model.dart';
import 'package:main/UIs/screens/Trip/privateTrips/Budget/expenses_list/expenses_list.dart';
import 'package:main/UIs/screens/Trip/privateTrips/Budget/new_expense.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({super.key});

  @override
  State<BudgetPage> createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: "Breakfast",
        amount: 580.00,
        date: DateTime.now(),
        category: expCategory.food),
  ];

  void _addNewExpenseModal() {
    showModalBottomSheet(
      enableDrag: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => Padding(
        padding:EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom) ,
        child: NewExpense(onAddExpense: _addExpense),
      ),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(children: [
        const Text("Budget"),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: _addNewExpenseModal,
            ),
          ],
        ),
        Expanded(child: ExpensesList(expenses: _registeredExpenses)),
      ]),
    );
  }
}
