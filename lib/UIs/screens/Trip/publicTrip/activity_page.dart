import 'package:flutter/material.dart';
import 'package:main/UIs/screens/Trip/trip_activity/package_details.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  String searchQuery = '';
  List<String> appliedFilters = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Activities", style: TextStyle(color: Colors.black)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list, color: Colors.black),
            onPressed: () {
              // Show filter options
              // You can use a BottomSheet, Dialog, or navigate to a filter page
            },
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Activities To Do",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                ClipRRect(
                  child: Icon(Icons.volunteer_activism, color: Colors.black),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (query) {
                // Handle search query changes
                setState(() {
                  searchQuery = query;
                });
              },
              decoration: InputDecoration(
                hintText: "Search activities...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.0, 0, 0, 0), // Add left padding
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  buildFilterButton("Hiking"),
              
                  buildFilterButton("Surfing"),
                  buildFilterButton("Camping"),
                  // Add more filters as needed
                ],
              ),
            ),
          ),
          // Activity cards
          Column(
            children: [
              buildActivityCard(
                "Hiking Package",
                "Knuckles Mountain Range",
                "1000\$",
                "assets/img/hiking.jpg", // Provide image path
              ),
              buildActivityCard(
                "Surfing Adventure",
                "Hiriketiya Beach",
                "800\$",
                "assets/img/surfing.jpg", // Provide image path
              ),
              buildActivityCard(
                "Camping in the Woods",
                "Sinharaja Forest Reserve",
                "1200\$",
                "assets/img/camp.jpg", // Provide image path
              ),
            
              // Add more activity cards as needed
            ],
          ),
        ],
      ),
    );
  }

  Widget buildFilterButton(String filterName) {
    final isActive = appliedFilters.contains(filterName);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            if (isActive) {
              appliedFilters.remove(filterName);
            } else {
              appliedFilters.add(filterName);
            }
          });
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(isActive ? Colors.cyan[300] : Colors.grey),
        ),
        child: Text(filterName, style: TextStyle(color: isActive ? Colors.white : Colors.black)),
      ),
    );
  }

  Widget buildActivityCard(String title, String location, String price, String image) {
    if (passesFilters(title) && (searchQuery.isEmpty || title.toLowerCase().contains(searchQuery.toLowerCase()))) {
      return SizedBox(
        width: double.infinity,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(
                      image,
                      height: 120,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                    Container(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(height: 5),
                          Text(
                            title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("Location: $location"),
                          Text("Price: $price"),
                          Container(height: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 120),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PackageDetailsPage(
                                          packageName: title,
                                          packageDescription: "Explore the beautiful mountains...",
                                          packageImage: image, // Pass the image path
                                          duration: "2 days, 3 nights",
                                          price: price,
                                          location: location,
                                          activitiesIncluded: "Hiking, sightseeing, tea plantation tour",
                                          rating: 4.5,
                                          availability: "Year-round",
                                          // Add other details here
                                        ),
                                      ),
                                    );
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.cyan[300]),
                                  ),
                                  child: Row(
                                    children: [
                                      Text("More Details", style: TextStyle(color: Colors.white)),
                                      Icon(Icons.arrow_forward, color: Colors.white),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  bool passesFilters(String title) {
    if (appliedFilters.isEmpty) {
      return true; // If no filters applied, show all activities
    }

    for (var filter in appliedFilters) {
      if (title.toLowerCase().contains(filter.toLowerCase())) {
        return true;
      }
    }
    return false;
  }
}
