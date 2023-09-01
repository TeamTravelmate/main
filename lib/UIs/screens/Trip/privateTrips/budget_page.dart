import 'package:flutter/material.dart';

class BudgetTabContent extends StatefulWidget {
  const BudgetTabContent({super.key});

  @override
  _BudgetTabContentState createState() => _BudgetTabContentState();
}

class _BudgetTabContentState extends State<BudgetTabContent> {
  double _totalBudget = 1000.0;
  double _remainingBudget = 1000.0;
  TextEditingController _expenseNameController = TextEditingController();
  TextEditingController _expenseAmountController = TextEditingController();
  List<Expense> _expenses = [];
  final _formKey = GlobalKey<FormState>();

  void _addExpense(double amount) {
    setState(() {
      _expenses.add(Expense(amount: amount));
      _remainingBudget -= amount;
    });
    Navigator.pop(context); // Close the bottom sheet
  }

  void _showAddExpenseBottomSheet() {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Expense',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                double amount = 100.0; // Replace with your logic
                _addExpense(amount);
                Navigator.pop(context); // Close the bottom sheet
              },
              child: Text('Add Expense'),
            ),
          ],
        ),
      );
    },
  );
}

   @override
  void dispose() {
    _expenseAmountController.dispose();
    super.dispose();
  }

  @override
 Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Total Budget: \$$_totalBudget',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16.0),
          Text(
            'Remaining Budget: \$$_remainingBudget',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: _showAddExpenseBottomSheet,
            child: const Text('Add Expense'),
          ),
          const SizedBox(height: 16.0),
          ListView.builder(
            shrinkWrap: true,
            itemCount: _expenses.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Expense ${index + 1}'),
                trailing: Text('-\$${_expenses[index].amount.toStringAsFixed(2)}'),
              );
            },
          ),
        ],
      ),
    );
  }
}

class Expense {
  final double amount;

  Expense({required this.amount});
}
