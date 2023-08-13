import 'package:flutter/material.dart';
import '../../themes/colors.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/inputField_widget.dart';
import 'publicTrip/publicTripsAll_page.dart';
import 'tripPlanning2_page.dart';

// ignore: must_be_immutable, camel_case_types
class trip extends StatelessWidget {
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
      child: const Customize(),
    )
  ];

  trip({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          // leading: BackButton(),
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

class Customize extends StatelessWidget {
  const Customize({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const TextFieldWidget(
          labelText: 'Where to go?',
          hintText: 'Eg. Galle, Trincomalee',
          prefixIcon: Icon(Icons.location_on),
        ),
        const SizedBox(height: 20),
        const TextFieldWidget(
          labelText: 'Start Date',
          hintText: 'Select a start date',
          prefixIcon: Icon(Icons.calendar_month),
        ),
        const SizedBox(height: 20),
        const TextFieldWidget(
          labelText: 'No. of Days',
          hintText: 'Select no. of days',
          prefixIcon: Icon(Icons.date_range),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          height: 80,
          child: TextButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                builder: (BuildContext context) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Divider(
                          color: Colors.grey,
                          thickness: 4,
                          indent: 110,
                          endIndent: 110,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          'Share your trip',
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.grey.shade200,
                                foregroundColor:
                                    const Color.fromARGB(255, 69, 68, 68),
                              ),
                              child: const Text('Can Edit'),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor:
                                    const Color.fromARGB(255, 69, 68, 68),
                              ),
                              child: const Text('View Only'),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const TextFieldWidget(
                          labelText: 'Invite By Email Address',
                          hintText: 'Email Address',
                          prefixIcon: Icon(Icons.email),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                FloatingActionButton(
                                  onPressed: () {},
                                  backgroundColor: const Color(0xffE0E0E0),
                                  foregroundColor:
                                      const Color.fromARGB(255, 69, 68, 68),
                                  child: const Icon(Icons.link),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 5),
                                ),
                                const Text(
                                  'Copy Link',
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Color.fromARGB(255, 69, 68, 68)),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Column(
                              children: [
                                FloatingActionButton(
                                  onPressed: () {},
                                  backgroundColor: const Color(0xffE0E0E0),
                                  foregroundColor:
                                      const Color.fromARGB(255, 69, 68, 68),
                                  child: const Icon(Icons.message),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 5),
                                ),
                                const Text(
                                  'Text',
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Color.fromARGB(255, 69, 68, 68)),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Column(
                              children: [
                                FloatingActionButton(
                                  onPressed: () {},
                                  backgroundColor: const Color(0xffE0E0E0),
                                  foregroundColor:
                                      const Color.fromARGB(255, 69, 68, 68),
                                  child: const Icon(Icons.upload),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 5),
                                ),
                                const Text(
                                  'Other',
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Color.fromARGB(255, 69, 68, 68)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // TextButton.icon(
                        //   onPressed: () {
                        //     showBottomSheet(
                        //       context: context,
                        //       builder: (BuildContext context) {
                        //         return const Column(
                        //           children: [
                        //             Divider(
                        //               color: Colors.grey,
                        //               thickness: 4,
                        //               indent: 110,
                        //               endIndent: 110,
                        //             ),
                        //             SizedBox(
                        //               height: 30,
                        //             ),
                        //             Text(
                        //               'Invite your tripmates',
                        //               style: TextStyle(fontSize: 20),
                        //             ),
                        //             SizedBox(
                        //               height: 30,
                        //             ),
                        //             SizedBox(
                        //               height: 20,
                        //             ),
                        //             TextFieldWidget(
                        //               labelText: 'Invite By Email Address',
                        //               hintText: 'Email Address',
                        //               prefixIcon: Icon(Icons.email),
                        //             ),
                        //           ],
                        //         );
                        //       },
                        //     );
                        //   },
                        //   style: TextButton.styleFrom(
                        //       foregroundColor: Colors.grey,
                        //       backgroundColor: Colors.white),
                        //   icon: const Icon(Icons.group_add_sharp),
                        //   label: const Text('Manage Tripmates'),
                        // ),
                      ],
                    ),
                  );
                },
              );
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(ColorsTravelMate.tertiary),
              foregroundColor:
                  MaterialStateProperty.all(ColorsTravelMate.primary),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            child: const Text('+ Invite Tripmates'),
          ),
        ),
        const SizedBox(
          height: 260,
        ),
        buttonWidget(
          width: double.infinity,
          labelText: 'Next',
          path: Plan(),
        ),
      ],
    );
  }
}
