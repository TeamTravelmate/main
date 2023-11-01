import 'package:main/Domain/models/expense_model.dart';

class Budget {
  final int id;
  final double amount;
  final List<Expense> expenses;

  Budget({required this.id, required this.amount, required this.expenses});

  /**
   * method to return the total amount for each day
   * {
   * {
   * day: 1,
   * total: 100
   * },
   * {
   * day: 2,
   * total: 200
   * },
   * }
   * 
   * expenses like  {
      "id": 5,
      "expense_name": "Taxi",
      "amount": "4334",
      "category": "Transportation",
      "date": "2023-10-09T18:30:00.000Z"
    },

    //there might be multiple expenses for a day
    //number of days and starting date comes from the trip provider
    //to find the day of the expense, we need to find the difference between the expense date and the starting date
   */
  Map<int, double> getBudgetMap(int numberOfDays, DateTime startingDate) {
    Map<int, double> budgetMap = {};
    for (int i = 1; i <= numberOfDays; i++) {
      double total = 0;
      for (int j = 0; j < expenses.length; j++) {
        if (expenses[j].date.difference(startingDate).inDays == i) {
          total += expenses[j].amount;
        }
      }
      budgetMap[i] = total;
    }
    return budgetMap;
  }

  factory Budget.fromJson(Map<String, dynamic> json) {
    return Budget(
      id: json['budget']['id'],
      amount: double.parse(json['budget']['amount']),
      expenses: (json['expenses'] as List<dynamic>)
          .map((e) => Expense.fromJson(e as Map<String, dynamic>))
          .toList()
          .cast<Expense>(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'budget': {
        'id': id,
      },
      'expenses': expenses.map((e) => e.toJson()).toList(),
    };
  }
}
