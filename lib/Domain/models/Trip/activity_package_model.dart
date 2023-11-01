class ActivityPackage {
  int packageId;
  String name;
  String category;
  double price;
  int tripId;
  int ageLimit;
  bool availability;
  String location;
  int ownerId;
  Map<String, List<ActivityPackage>> menu;

  ActivityPackage(
      this.packageId,
      this.name,
      this.category,
      this.price,
      this.tripId,
      this.ageLimit,
      this.availability,
      this.location,
      this.ownerId,
      this.menu);

  static List<ActivityPackage> generateActivityPackages() {
    return [
      ActivityPackage(
        1,
        "Medical Support",
        "Most Popular",
        0,
        1,
        0,
        true,
        "Jakarta",
        1,
        {
          'For you': [],
          'Popular': [],
          'Recommended': [],
          'New': [],
        },
      ),
    ];
  }
}
