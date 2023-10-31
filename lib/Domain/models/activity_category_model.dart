class Choices {
  final String title, packageName;
  // image;
  final double price;

  Choices({
    required this.title,
    required this.packageName,
    // required this.image,
    required this.price,
  });
}

class CategoryChoice {
  final String Category;
  final List<Choices> items;

  CategoryChoice({
    required this.Category,
    required this.items,
  });
}

final List<CategoryChoice> demoCategoryChoices = [
  CategoryChoice(
    Category: "Most Popular",
    items: [
      Choices(
        title: "Medical Support",
        packageName: "medical",
        // image: "assets/img/medical.png",
        price: 0,
      ),
      Choices(
        title: "Accident",
        packageName: "accident",
        // image: "assets/img/accident.png",
        price: 0,
      ),
    ],
  ),
  CategoryChoice(
    Category: "Surfing",
    items: [
      Choices(
        title: "Flood",
        packageName: "flood",
        // image: "assets/img/flood.png",
        price: 0,
      ),
      Choices(
        title: "Earthquake",
        packageName: "earthquake",
        // image: "assets/img/earthquake.png",
        price: 0,
      ),
      Choices(
        title: "Tsunami",
        packageName: "tsunami",
        // image: "assets/img/tsunami.png",
        price: 0,
      ),
      Choices(
        title: "Landslide",
        packageName: "landslide",
        // image: "assets/img/landslide.png",
        price: 0,
      ),
      Choices(
        title: "Tornado",
        packageName: "tornado",
        // image: "assets/img/tornado.png",
        price: 0,
      ),
      Choices(
        title: "Volcano",
        packageName: "volcano",
        // image: "assets/img/volcano.png",
        price: 0,
      ),
    ],
  ),
];
