class Budget {
  final int tripId;
  final String category;
  final String name;
  final double amount;

  Budget(
      {
      required this.tripId,
      required this.category,
      required this.name,
      required this.amount});


  Map<String, dynamic> toJson() {
    return {
      'tripId': tripId,
      'category': category,
      'name': name,
      'amount': amount,
    };
  }
}
