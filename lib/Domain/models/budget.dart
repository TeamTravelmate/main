import 'package:main/Domain/models/expense_model.dart';

class Budget {
  final int id;
  final double amount;
  final List<Expense> expenses;

  Budget({required this.id, required this.amount, required this.expenses});

  /*
  response
  TTP/1.1 200 OK
X-Powered-By: Express
Content-Type: application/json; charset=utf-8
Content-Length: 381
ETag: W/"17d-GY7Jhgjf+IX4oBeI0Rmp507OpwM"
Date: Tue, 31 Oct 2023 09:07:27 GMT
Connection: close

{
  "budget": {
    "id": 1,
    "amount": "14334"
  },
  "expenses": [
    {
      "id": 5,
      "expense_name": "Taxi",
      "amount": "4334",
      "category": "Transportation",
      "date": "2023-10-09T18:30:00.000Z"
    },
    {
      "id": 6,
      "expense_name": "Hotel fare",
      "amount": "5000",
      "category": "Accomodation",
      "date": "2023-10-10T18:30:00.000Z"
    },
    {
      "id": 7,
      "expense_name": "Park Tickets",
      "amount": "5000",
      "category": "Tickets",
      "date": "2023-10-11T18:30:00.000Z"
    }
  ]
}
  */
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
      'budget':{
        'id': id,
      },
      'expenses': expenses.map((e) => e.toJson()).toList(),
    };
  }
}
