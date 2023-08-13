import 'package:flutter/material.dart';
import '../../themes/colors.dart';
import '../../widgets/button_widget.dart';
import '../Marketplace/marketplace_page.dart';
import '../vendor/home_page.dart';
import 'customizeActivities_page.dart';
import 'customizeBudget_page.dart';
import 'customizeDestination_page.dart';
import 'customizeHotels_page.dart';
import 'customizeResturants_page.dart';
import 'customizeToDo_page.dart';
import 'customizeVehicles_page.dart';
import 'customizeWeather_page.dart';
import 'publicTrip/publicTripsAll_page.dart';
import 'tripView_page.dart';
import 'package:info_popup/info_popup.dart';

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
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.95,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          Row(
            children: [
              InfoPopupWidget(
                customContent: Container(
                  decoration: BoxDecoration(
                    color: ColorsTravelMate.tertiary,
                    border: Border.all(
                      color: ColorsTravelMate.primary,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Select places which you \nlike to visit around your \ndestination.',
                    style: TextStyle(
                      color: ColorsTravelMate.primary,
                      fontSize: 12,
                    ),
                  ),
                ),
                arrowTheme: const InfoPopupArrowTheme(
                  color: ColorsTravelMate.primary,
                  arrowDirection: ArrowDirection.up,
                ),
                dismissTriggerBehavior: PopupDismissTriggerBehavior.onTapArea,
                areaBackgroundColor: Colors.transparent,
                indicatorOffset: Offset.zero,
                contentOffset: Offset.zero,
                child: const Facility(
                    widgetName: CustomizeDestination(),
                    title: 'Destinations',
                    icon: Icons.location_city_outlined),
              ),
              const SizedBox(width: 25),
              InfoPopupWidget(
                customContent: Container(
                  decoration: BoxDecoration(
                    color: ColorsTravelMate.tertiary,
                    border: Border.all(
                      color: ColorsTravelMate.primary,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'View the weather report \nbefore you plan the trip.',
                    style: TextStyle(
                      color: ColorsTravelMate.primary,
                      fontSize: 12,
                    ),
                  ),
                ),
                arrowTheme: const InfoPopupArrowTheme(
                  color: ColorsTravelMate.primary,
                  arrowDirection: ArrowDirection.up,
                ),
                dismissTriggerBehavior: PopupDismissTriggerBehavior.onTapArea,
                areaBackgroundColor: Colors.transparent,
                indicatorOffset: Offset.zero,
                contentOffset: Offset.zero,
                child: const Facility(
                    widgetName: CustomizeWeather(),
                    title: 'Weather',
                    icon: Icons.cloud),
              ),
              const SizedBox(width: 25),
              InfoPopupWidget(
                customContent: Container(
                  decoration: BoxDecoration(
                    color: ColorsTravelMate.tertiary,
                    border: Border.all(
                      color: ColorsTravelMate.primary,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Best choices for you to \nstay around your location \nas you prefer.',
                    style: TextStyle(
                      color: ColorsTravelMate.primary,
                      fontSize: 12,
                    ),
                  ),
                ),
                arrowTheme: const InfoPopupArrowTheme(
                  color: ColorsTravelMate.primary,
                  arrowDirection: ArrowDirection.up,
                ),
                dismissTriggerBehavior: PopupDismissTriggerBehavior.onTapArea,
                areaBackgroundColor: Colors.transparent,
                indicatorOffset: Offset.zero,
                contentOffset: Offset.zero,
                child: const Facility(
                    widgetName: CustomizeHotels(),
                    title: 'Hotels',
                    icon: Icons.hotel),
              ),
              const SizedBox(width: 25),
              InfoPopupWidget(
                customContent: Container(
                  decoration: BoxDecoration(
                    color: ColorsTravelMate.tertiary,
                    border: Border.all(
                      color: ColorsTravelMate.primary,
                      style: BorderStyle.solid,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Set a budget, Split budget\n among the members,\n currency conversion.',
                    style: TextStyle(
                      color: ColorsTravelMate.primary,
                      fontSize: 12,
                    ),
                  ),
                ),
                arrowTheme: const InfoPopupArrowTheme(
                  color: ColorsTravelMate.primary,
                  arrowDirection: ArrowDirection.up,
                ),
                dismissTriggerBehavior: PopupDismissTriggerBehavior.onTapArea,
                areaBackgroundColor: Colors.transparent,
                indicatorOffset: Offset.zero,
                contentOffset: Offset.zero,
                child: const Facility(
                    widgetName: CustomizeBudget(),
                    title: 'Budget',
                    icon: Icons.wallet),
              ),
            ],
          ),
          const SizedBox(height: 45),
          Row(
            children: [
              InfoPopupWidget(
                customContent: Container(
                  decoration: BoxDecoration(
                    color: ColorsTravelMate.tertiary,
                    border: Border.all(
                      color: ColorsTravelMate.primary,
                      style: BorderStyle.solid,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Select your preferable\n transport service now.\n No regrets later!',
                    style: TextStyle(
                      color: ColorsTravelMate.primary,
                      fontSize: 12,
                    ),
                  ),
                ),
                arrowTheme: const InfoPopupArrowTheme(
                  color: ColorsTravelMate.primary,
                  arrowDirection: ArrowDirection.up,
                ),
                dismissTriggerBehavior: PopupDismissTriggerBehavior.onTapArea,
                areaBackgroundColor: Colors.transparent,
                indicatorOffset: Offset.zero,
                contentOffset: Offset.zero,
                child: Facility(
                    widgetName: CustomizeVehicle(),
                    title: 'Vehicles',
                    icon: Icons.car_rental_outlined),
              ),
              const SizedBox(width: 25),
              InfoPopupWidget(
                customContent: Container(
                  decoration: BoxDecoration(
                    color: ColorsTravelMate.tertiary,
                    border: Border.all(
                      color: ColorsTravelMate.primary,
                      style: BorderStyle.solid,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Veg or Non-veg? \nHere’s your choices! \nPick a resturant & \nEnjoy your meal!',
                    style: TextStyle(
                      color: ColorsTravelMate.primary,
                      fontSize: 12,
                    ),
                  ),
                ),
                arrowTheme: const InfoPopupArrowTheme(
                  color: ColorsTravelMate.primary,
                  arrowDirection: ArrowDirection.up,
                ),
                dismissTriggerBehavior: PopupDismissTriggerBehavior.onTapArea,
                areaBackgroundColor: Colors.transparent,
                indicatorOffset: Offset.zero,
                contentOffset: Offset.zero,
                child: const Facility(
                    widgetName: CustomizeResturants(),
                    title: 'Resturants',
                    icon: Icons.restaurant_menu),
              ),
              const SizedBox(width: 25),
              InfoPopupWidget(
                customContent: Container(
                  decoration: BoxDecoration(
                    color: ColorsTravelMate.tertiary,
                    border: Border.all(
                      color: ColorsTravelMate.primary,
                      style: BorderStyle.solid,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Enjoy your trip with\nrecreational activities \naccording to your \ndestination.',
                    style: TextStyle(
                      color: ColorsTravelMate.primary,
                      fontSize: 12,
                    ),
                  ),
                ),
                arrowTheme: const InfoPopupArrowTheme(
                  color: ColorsTravelMate.primary,
                  arrowDirection: ArrowDirection.up,
                ),
                dismissTriggerBehavior: PopupDismissTriggerBehavior.onTapArea,
                areaBackgroundColor: Colors.transparent,
                indicatorOffset: Offset.zero,
                contentOffset: Offset.zero,
                child: const Facility(
                    widgetName: CustomizeActivities(),
                    title: 'Activities',
                    icon: Icons.hiking),
              ),
              const SizedBox(width: 25),
              InfoPopupWidget(
                customContent: Container(
                  decoration: BoxDecoration(
                    color: ColorsTravelMate.tertiary,
                    border: Border.all(
                      color: ColorsTravelMate.primary,
                      style: BorderStyle.solid,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'View trip essentials \nchecklist or Add reminders \nat your own need.',
                    style: TextStyle(
                      color: ColorsTravelMate.primary,
                      fontSize: 12,
                    ),
                  ),
                ),
                arrowTheme: const InfoPopupArrowTheme(
                  color: ColorsTravelMate.primary,
                  arrowDirection: ArrowDirection.up,
                ),
                dismissTriggerBehavior: PopupDismissTriggerBehavior.onTapArea,
                areaBackgroundColor: Colors.transparent,
                indicatorOffset: Offset.zero,
                contentOffset: Offset.zero,
                child: const Facility(
                  widgetName: CustomizeToDo(),
                  icon: Icons.list_alt_rounded,
                  title: 'To Do',
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 80,
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
                child: Card(
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
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                ),
                              );
                            },
                            child: const Icon(
                              Icons.arrow_circle_right_rounded,
                              size: 40,
                              color: ColorsTravelMate.primary,
                            )),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 140),
          buttonWidget(
              width: double.infinity,
              labelText: 'Create my plan',
              path: joinedTripView()),
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
            style: const TextStyle(
                fontSize: 12,
                color: ColorsTravelMate.primary,
                fontWeight: FontWeight.bold)),
      ],
    );
  }
}
