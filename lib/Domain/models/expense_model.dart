
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMMMd();

const uuid = Uuid();

enum expCategory { food, transport, accomodation, activities, misc, fees, others }

const categoryIcons = {
  expCategory.food: Icons.lunch_dining_rounded,
  expCategory.transport: Icons.directions_car_rounded,
  expCategory.accomodation: Icons.hotel_rounded,
  expCategory.activities: Icons.sports_soccer_rounded,
  expCategory.misc: Icons.miscellaneous_services_rounded,
  expCategory.fees: Icons.money_off_rounded,
  expCategory.others: Icons.more_horiz_rounded,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  });

  final String title;
  final double amount;
  final DateTime date;
  final expCategory category;


  String get formattedDate {
    return formatter.format(date);
  }

  /*
  {
      "id": 5,
      "expense_name": "Taxi",
      "amount": "4334",
      "category": "Transportation",
      "date": "2023-10-09T18:30:00.000Z"
    },
   */
  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
      title: json['expense_name'],
      amount: double.parse(json['amount']),
      date: DateTime.parse(json['date']),
      category: expCategory.values.firstWhere((e) => e.toString() == 'expCategory.${json['category']}'),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'expense_name': title,
      'amount': amount,
      'category': category.toString().split('.').last,
      'date': date.toIso8601String(),
    };
  }
}
