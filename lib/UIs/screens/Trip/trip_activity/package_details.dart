import 'package:flutter/material.dart';

class PackageDetailsPage extends StatelessWidget {
  final String packageName;
  final String packageDescription;
  final String packageImage;
  final String duration;
  final String price;
  final String location;
  final String activitiesIncluded;
  final double rating;
  final String availability;

  const PackageDetailsPage({super.key, 
    required this.packageName,
    required this.packageDescription,
    required this.packageImage,
    required this.duration,
    required this.price,
    required this.location,
    required this.activitiesIncluded,
    required this.rating,
    required this.availability,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(packageName),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(packageImage),
            SizedBox(height: 20),
            // Location icon and location name in one line
           Padding(
  padding: EdgeInsets.only(left: 16), // Add padding from the left
  child: Row(
    children: [
      Image.asset(
        "assets/icons/location.png",
        height: 20,
        width: 20,
        fit: BoxFit.cover,
      ),
      SizedBox(width: 8), // Add spacing between the icon and text
      Text(location),
    ],
  ),
),

            SizedBox(height: 10), // Add some spacing
            // Three colored buttons in one line
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _ColoredButton(
                  text:("$availability"),
                  icon: Icons.date_range,
                  color: Colors.cyan,
                ),
                _ColoredButton(
                  text:("$duration"),
                  icon: Icons.calendar_today,
                  color: Colors.cyan,
                ),
                _ColoredButton(
                  text: "2-10",
                  icon: Icons.people,
                  color: Colors.cyan,
                ),
              ],
            ),

            // Other details
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Package Description: $packageDescription"),
                  SizedBox(height: 20), // Add some spacing

                  // Activities Included as a bullet-pointed list
                  Text(
                    "Activities Included:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10), // Add spacing
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: activitiesIncluded
                        .split('\n')
                        .map((activity) => buildBulletPoint(activity))
                        .toList(),
                  ),
                  SizedBox(height: 20), // Add some spacing

                  // Add the ReviewSection widget here
                  ReviewSection(
                    reviewCount: 42, // Change this to the actual number of reviews
                    starRating: 4.5, // Change this to the actual star rating
                  ),
                ],
              ),
            ),

            // Price and "Book Now" button in one line
            // Price and "Book Now" button in one line
// Price and "Book Now" button in one line
Padding(
  padding: EdgeInsets.only(left: 16), // Add padding from the left
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        padding: EdgeInsets.all(8),
        color: Colors.cyan, // Background color for the price box
        child: Text(
          "Price: $price / person",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
     Padding(
  padding: EdgeInsets.only(right: 16), // Add padding from the right
  child: ElevatedButton(
    onPressed: () {
      // Add your booking logic here
    },
    child: Text("Book Now"),
  ),
)

    ],
  ),
),


          ],
        ),
      ),
    );
  }

  Widget buildBulletPoint(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('• ', style: TextStyle(fontSize: 20), textAlign: TextAlign.left),
        Expanded(
          child: Text(text),
        ),
      ],
    );
  }
}

class _ColoredButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;

  _ColoredButton({
    required this.text,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(width: 5), // Add spacing between icon and text
          Text(text, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}

class ReviewSection extends StatelessWidget {
  final int reviewCount;
  final double starRating;

  ReviewSection({
    required this.reviewCount,
    required this.starRating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile pictures (you can use CircleAvatar or similar widgets here)
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/profile_image1.png'),
                radius: 20,
              ),
              SizedBox(width: 8),
              CircleAvatar(
                backgroundImage: AssetImage('assets/profile_image2.png'),
                radius: 20,
              ),
              // Add more CircleAvatar widgets as needed for more profiles
            ],
          ),

          // Total number of reviews
          SizedBox(height: 10), // Add some spacing
          Text("Total: $reviewCount Reviews"),

          // Star ratings (you can use a custom widget to display star ratings)
          StarRating(starRating: starRating),
        ],
      ),
    );
  }
}

class StarRating extends StatelessWidget {
  final double starRating;

  StarRating({
    required this.starRating,
  });

  @override
  Widget build(BuildContext context) {
    // You can implement the star rating widget as needed
    // You may use the FlutterRatingBar package or create a custom widget.
    // For simplicity, let's use a placeholder here.
    return Row(
      children: List.generate(5, (index) {
        if (index < starRating) {
          return Icon(Icons.star, color: Colors.yellow);
        } else {
          return Icon(Icons.star, color: Colors.grey);
        }
      }),
    );
  }
}
