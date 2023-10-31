import 'package:flutter/material.dart';
import 'package:main/Domain/models/budget.dart';
import 'package:main/Domain/models/expense_model.dart';
import 'package:main/Domain/provider/budget_provider.dart';
import 'package:main/UIs/screens/Trip/privateTrips/Budget/expenses_list/expenses_list.dart';
import 'package:main/UIs/screens/Trip/privateTrips/Budget/new_expense.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:main/Domain/provider/trip_provider.dart';

class BudgetPage extends ConsumerStatefulWidget {
  const BudgetPage({super.key});

  @override
  ConsumerState<BudgetPage> createState() => _BudgetPageState();
}

class _BudgetPageState extends ConsumerState<BudgetPage> {
  final List<Expense> _registeredExpenses = [];

  @override
  void initState() {
    super.initState();
  }

  void _addNewExpenseModal() {
    showModalBottomSheet(
      enableDrag: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: NewExpense(onAddExpense: _addExpense),
      ),
    );
  }

  void _addExpense(Expense expense) {
    final trip = ref.read(tripPlanningNotifierProvider);
    final budget = ref.read(budgetNotifierProvider(trip.value!.tripId));
    if(budget.value!.amount==0){
        ref.read(budgetNotifierProvider(trip.value!.tripId).notifier).createBudget(expense, trip.value!.tripId);
    }
    final updatedBudget = Budget(id: budget.value!.id, amount: budget.value!.amount+expense.amount, expenses: [...budget.value!.expenses, expense]);
    ref.read(budgetNotifierProvider(trip.value!.tripId).notifier).updateBudget(updatedBudget);
  }

  @override
  Widget build(BuildContext context) {
    final currentTrip = ref.watch(tripPlanningNotifierProvider);
    final budget = ref.watch(budgetNotifierProvider(currentTrip.value!.tripId));
    return switch(budget){
      AsyncData(:final value) => SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //add a total amount of expenses
            Text(
              'Total: Rs ${value.amount}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: _addNewExpenseModal,
            ),
          ],
        ),
        Expanded(child: ExpensesList(expenses: value.expenses)),
      ]),
    ),
    AsyncError(:final error, :final stackTrace) => Center(
      child: Text(error.toString()),
    ),
    _ => Center(
      child: CircularProgressIndicator(),
    ),
    };
  }
}
