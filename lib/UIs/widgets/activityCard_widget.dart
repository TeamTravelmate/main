import 'package:flutter/material.dart';
import 'package:main/UIs/themes/colors.dart';
import 'inputField_widget.dart';

class ActivityCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.5,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            ListTile(
              title: Text(
                title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              // leading: icon, iconColor: ColorsTravelMate.secundary, 
              leading: CircleAvatar(
                        backgroundImage: AssetImage(imagepath),
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
                              Text(title, style: const TextStyle(fontSize: 20)),
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
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 5, 0),
                                            child:
                                                Icon(Icons.location_on_rounded),
                                          ),
                                          Text(locationTitle)
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 5, 0),
                                            child:
                                                Icon(Icons.access_time_rounded),
                                          ),
                                          Text(time),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 5, 0),
                                            child: Icon(Icons.person),
                                          ),
                                          Text(age)
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 5, 0),
                                            child: Icon(
                                                Icons.currency_exchange_sharp),
                                          ),
                                          Text(price),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                          'Contact Details : \nKumara R\n077-xxxxxxx\nGalle, Sri Lanka'),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const TextFieldWidget(
                                labelText: 'Check Availability',
                                hintText: 'mm/dd/yyyy',
                                prefixIcon: Icon(Icons.calendar_month),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              ColorsTravelMate.secundary.withOpacity(0.4),
                                              ),
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              ColorsTravelMate.secundary),
                                    ),
                                    child: const Text('Rent Essentials'),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              ColorsTravelMate.secundary.withOpacity(0.4),
                                              ),
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              ColorsTravelMate.secundary),
                                    ),
                                    child: const Text('Reserve Slot'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  backgroundColor: ColorsTravelMate.secundary.withOpacity(0.5),
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
                Text(age)
              ],
            ),
            DropdownButton<String>(
              value: 'Unawatuna Beach',
              items: <String>[
                'Unawatuna Beach',
                'Galle Fort Beach',
                'Jungle Beach'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 14),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // setState(() {
                //   dropdownValue = newValue!;
                // });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            // DropdownButton<String>(
            //   value: 'Experience Providers',
            //   items: <String>['Kumara R', 'Name 2', 'Name 3']
            //       .map<DropdownMenuItem<String>>((String value) {
            //     return DropdownMenuItem<String>(
            //       value: value,
            //       child: Text(
            //         value,
            //         style: TextStyle(fontSize: 14),
            //       ),
            //     );
            //   }).toList(),
            //   onChanged: (String? newValue1) {
            //     // setState(() {
            //     //   dropdownValue = newValue!;
            //     // });
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
