import 'package:flutter/material.dart';
import 'package:main/UIs/themes/colors.dart';
import '../screens/Trip/booking_exProviders.dart';
import '../screens/Trip/publicTrip/publicTripViewPage.dart';
import '../screens/service providers/ex_providers.dart';
import 'inputField_widget.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';

class ActivityCard extends StatefulWidget {
  const ActivityCard({
    super.key,
    required this.title,
    // required this.icon,
    required this.imagepath,
    required this.locationTitle,
    required this.time,
    required this.age,
    required this.price,
  });

  final String title;
  // final Icon icon;
  final String imagepath;
  final String locationTitle;
  final String time;
  final String age;
  final String price;

  @override
  State<ActivityCard> createState() => _ActivityCardState();
}

class _ActivityCardState extends State<ActivityCard> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();
  late SingleValueDropDownController _cnt;

  @override
  void initState() {
    _cnt = SingleValueDropDownController();
    super.initState();
  }

  @override
  void dispose() {
    _cnt.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.5,
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  widget.title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                // leading: icon, iconColor: ColorsTravelMate.secundary,
                leading: CircleAvatar(
                  backgroundImage: AssetImage(widget.imagepath),
                  radius: 40,
                ),
                trailing: SizedBox(
                  width: 30,
                  height: 30,
                  child: FloatingActionButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        builder: (BuildContext context) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 2),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Divider(
                                  color: Colors.grey,
                                  thickness: 4,
                                  indent: 110,
                                  endIndent: 110,
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Text(widget.title,
                                    style: const TextStyle(fontSize: 20)),
                                const SizedBox(
                                  height: 20,
                                ),
                                CircleAvatar(
                                  backgroundImage: AssetImage(widget.imagepath),
                                  radius: 50,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 5, 0),
                                              child: Icon(
                                                  Icons.location_on_rounded),
                                            ),
                                            Text(widget.locationTitle)
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 5, 0),
                                              child: Icon(
                                                  Icons.access_time_rounded),
                                            ),
                                            Text(widget.time),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 5, 0),
                                              child: Icon(Icons.person),
                                            ),
                                            Text(widget.age)
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 5, 0),
                                              child: Icon(Icons
                                                  .currency_exchange_sharp),
                                            ),
                                            Text(widget.price),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ExperienceProviders()));
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      ColorsTravelMate.tertiary,
                                    ),
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            ColorsTravelMate.secundary),
                                  ),
                                  child:
                                      const Text('Select Experience Providers'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const BookingCalendarDemoApp()));
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      ColorsTravelMate.secundary
                                          .withOpacity(0.3),
                                    ),
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            ColorsTravelMate.secundary),
                                    fixedSize: MaterialStateProperty.all<Size>(
                                        const Size(160, 50)),
                                  ),
                                  child: const Text('Check Availability'),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    backgroundColor:
                        ColorsTravelMate.secundary.withOpacity(0.5),
                    foregroundColor: ColorsTravelMate.tertiary,
                    child: const Icon(Icons.add),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Icon(Icons.access_time_rounded),
                  ),
                  Text('Duration: 2 - 3 Hours')
                ],
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Icon(Icons.person),
                  ),
                  Text(widget.age)
                ],
              ),
              DropDownTextField(
                initialValue: "Unawatuna Beach",
                // controller: _cnt,
                clearOption: true,
                validator: (value) {
                  if (value == null) {
                    return "Required field";
                  } else {
                    return null;
                  }
                },
                dropDownItemCount: 3,

                dropDownList: const [
                  DropDownValueModel(
                      name: 'Unawatuna Beach', value: "Unawatuna Beach"),
                  DropDownValueModel(
                      name: 'Galle Fort Beach', value: "Galle Fort Beach"),
                  DropDownValueModel(
                      name: 'Jungle Beach', value: "Jungle Beach"),
                  DropDownValueModel(
                      name: 'Hikkaduwa Beach', value: "Hikkaduwa Beach"),
                  DropDownValueModel(
                      name: 'Bentota Beach', value: "Bentota Beach"),
                  DropDownValueModel(name: 'name6', value: "value6"),
                  DropDownValueModel(name: 'name7', value: "value7"),
                ],
                onChanged: (val) {},
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
