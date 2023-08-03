import 'package:flutter/material.dart';
import '../../themes/colors.dart';
import '../../widgets/button_widget.dart';
import 'customizeActivities_page.dart';
import 'customizeBudget_page.dart';
import 'customizeDestination_page.dart';
import 'customizeHotels_page.dart';
import 'customizeResturants_page.dart';
import 'customizeToDo_page.dart';
import 'customizeVehicles_page.dart';
import 'customizeWeather_page.dart';
import 'publicTripsAll_page.dart';
import 'tripView_page.dart';

// ignore: must_be_immutable
class Plan extends StatelessWidget {
  List<Tab> tabs = [
    const Tab(
      child: Text('Public Trips'),
    ),
    const Tab(
      child: Text('Customize Trips'),
    )
  ];

  List<Widget> tabContent = [
    Container(
      child: const publicTripsAll(),
    ),
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
      width: double.infinity,
      child: const CustomFacilities(),
    )
  ];

  Plan({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsTravelMate.tertiary,
          foregroundColor: ColorsTravelMate.primary,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 0),
                  child: BackButton(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: TabBar(
                    indicatorColor: ColorsTravelMate.secundary,
                    labelColor: ColorsTravelMate.secundary,
                    isScrollable: true,
                    tabs: tabs,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Container(
          child: TabBarView(
            children: tabContent,
          ),
        ),
      ),
    );
  }
}

class CustomFacilities extends StatelessWidget {
  const CustomFacilities({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          const Row(
            children: [
              Facility(
                  widgetName: CustomizeDestination(),
                  title: 'Destinations',
                  icon: Icons.location_city_outlined),
              SizedBox(width: 20),
              Facility(
                  widgetName: CustomizeWeather(),
                  title: 'Weather',
                  icon: Icons.cloud),
              SizedBox(width: 30),
              Facility(
                  widgetName: CustomizeHotels(),
                  title: 'Hotels',
                  icon: Icons.hotel),
              SizedBox(width: 30),
              Facility(
                  widgetName: CustomizeBudget(),
                  title: 'Budget',
                  icon: Icons.wallet),
            ],
          ),
          const SizedBox(height: 45),
          const Row(
            children: [
              Facility(
                  widgetName: CustomizeVehicle(),
                  title: 'Vehicles',
                  icon: Icons.car_rental_outlined),
              SizedBox(width: 30),
              Facility(
                  widgetName: CustomizeResturants(),
                  title: 'Resturants',
                  icon: Icons.restaurant_menu),
              SizedBox(width: 30),
              Facility(
                  widgetName: CustomizeActivities(),
                  title: 'Activities',
                  icon: Icons.hiking),
              SizedBox(width: 30),
              Facility(
                widgetName: CustomizeToDo(),
                icon: Icons.list_alt_rounded,
                title: 'To Do',
              ),
            ],
          ),
          const SizedBox(
            height: 80,
          ),
          Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: ListTile(
                    leading: const Icon(Icons.shopping_bag_rounded,
                        color: ColorsTravelMate.secundary, size: 60),
                    title: const Text(
                      'Travel Essentials Marketplace',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: ColorsTravelMate.primary),
                    ),
                    subtitle: const Text(
                      '\nExplore, Plan, and Embark! \n All Tour Essentials in One Convenient place!',
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    trailing: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 60, 0, 10),
                      child: ElevatedButton(
                          onPressed: () {},
                          child: const Icon(
                            Icons.arrow_circle_right_rounded,
                            size: 40,
                            color: ColorsTravelMate.primary,
                          )),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 140),
          buttonWidget(
              width: double.infinity, labelText: 'Create my plan', path: joinedTripView()),
        ],
      ),
    );
  }
}

class Facility extends StatelessWidget {
  const Facility({
    super.key,
    required this.widgetName,
    required this.title,
    required this.icon,
  });

  final Widget widgetName;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => widgetName,
              ),
            );
          },
          backgroundColor: ColorsTravelMate.secundary,
          foregroundColor: ColorsTravelMate.tertiary,
          child: Icon(icon),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 5),
        ),
        Text(title,
            style: const TextStyle(fontSize: 12, color: ColorsTravelMate.primary, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
