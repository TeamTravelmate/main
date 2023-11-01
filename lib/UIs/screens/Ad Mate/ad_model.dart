import '../../../Domain/models/user.dart';

class Ad {
  final User user;
  final String title;
  final String description;
  final String imageUrl;
  final int duration; // in days
  final double price;

  Ad({
    required this.user,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.duration,
  }) : price = calculatePrice(duration);

  static double calculatePrice(int duration) {
    // Define your price calculation logic here
    // For example, you can charge $1 per day
    return 1.0 * duration;
  }
}
