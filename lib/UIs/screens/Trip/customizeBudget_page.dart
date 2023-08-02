import 'package:flutter/material.dart';
import '../../themes/colors.dart';
import '../../widgets/inputField_widget.dart';

class CustomizeBudget extends StatelessWidget {
  const CustomizeBudget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Expenses'),
        backgroundColor: ColorsTravelMate.tertiary,
        foregroundColor: ColorsTravelMate.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Rs 0.00',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Set Budget',
              style: TextStyle(fontSize: 18),
            ),
            const Text(
              'You haven\'\t added any expenses yet',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const SizedBox(
              height: 180,
            ),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 5),
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
                            height: 40,
                          ),
                          const Text('Set Budget', style: TextStyle(fontSize: 20)),
                          const SizedBox(
                            height: 20,
                          ),
                          const TextFieldWidget(
                            labelText: 'Enter Amount',
                            hintText: 'Rs 0.00',
                            prefixIcon: Icon(Icons.money),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Save',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              const SizedBox(
                                width: 160,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Cancel',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.grey,
                                backgroundColor: Colors.white),
                            icon: const Icon(Icons.share),
                            label: const Text('Split expenses'),
                          ),
                          const Text(
                            'TravelMate simplifies the budget handling! Add all the expenses and split with friends easily!',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(ColorsTravelMate.secundary),
                foregroundColor:
                    MaterialStateProperty.all(ColorsTravelMate.tertiary),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              child: const Text('+ Add Expenses'),
            ),
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          builder: (BuildContext context) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 5),
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
                                    height: 50,
                                  ),
                                  const Text(
                                    'Share trip Expenses',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  const TextFieldWidget(
                                    labelText: 'Enter Amount',
                                    hintText: 'Rs 0.00',
                                    prefixIcon: Icon(Icons.money),
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        child: Column(
                                          children: [
                                            FloatingActionButton(
                                              onPressed: () {},
                                              backgroundColor:
                                                  const Color(0xffE0E0E0),
                                              foregroundColor:
                                                  const Color.fromARGB(
                                                      255, 69, 68, 68),
                                              child: const Icon(Icons
                                                  .currency_exchange_rounded),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(top: 5),
                                            ),
                                            const Text(
                                              'USD',
                                              style: TextStyle(
                                                fontSize: 10,
                                                color: Color.fromARGB(
                                                    255, 69, 68, 68),
                                              ),
                                            ),
                                          ],
                                        ),
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
                                                const Color.fromARGB(
                                                    255, 69, 68, 68),
                                            child: const Icon(Icons.upload),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(top: 5),
                                          ),
                                          const Text(
                                            'other',
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: Color.fromARGB(
                                                  255, 69, 68, 68),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  TextButton.icon(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                        foregroundColor: Colors.grey,
                                        backgroundColor: Colors.white),
                                    icon: const Icon(Icons.share),
                                    label: const Text('Share with Tripmates'),
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                    backgroundColor: ColorsTravelMate.primary,
                    foregroundColor: ColorsTravelMate.tertiary,
                    child: const Icon(Icons.currency_exchange),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        builder: (BuildContext context) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 15),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Divider(
                                  color: Colors.grey,
                                  thickness: 4,
                                  indent: 110,
                                  endIndent: 110,
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                const Text(
                                  'Share trip Expenses',
                                  style: TextStyle(fontSize: 20),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                const TextFieldWidget(
                                  labelText: 'Invite By Email Address',
                                  hintText: 'Email Address',
                                  prefixIcon: Icon(Icons.email),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        FloatingActionButton(
                                          onPressed: () {},
                                          backgroundColor: const Color(0xffE0E0E0),
                                          foregroundColor: const Color.fromARGB(
                                              255, 69, 68, 68),
                                          child: const Icon(Icons.link),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(top: 5),
                                        ),
                                        const Text(
                                          'Copy Link',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Color.fromARGB(
                                                  255, 69, 68, 68)),
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
                                          foregroundColor: const Color.fromARGB(
                                              255, 69, 68, 68),
                                          child: const Icon(Icons.message),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(top: 5),
                                        ),
                                        const Text(
                                          'Text',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Color.fromARGB(
                                                  255, 69, 68, 68)),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 40,
                                    ),
                                    Column(
                                      children: [
                                        FloatingActionButton(
                                          onPressed: () {},
                                          backgroundColor: const Color(0xffE0E0E0),
                                          foregroundColor: const Color.fromARGB(
                                              255, 69, 68, 68),
                                          child: const Icon(Icons.upload),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(top: 5),
                                        ),
                                        const Text(
                                          'Other',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Color.fromARGB(
                                                  255, 69, 68, 68)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 100,
                                ),
                                TextButton.icon(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                      foregroundColor: Colors.grey,
                                      backgroundColor: Colors.white),
                                  icon: const Icon(Icons.group_add_sharp),
                                  label: const Text('Manage Tripmates'),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    backgroundColor: ColorsTravelMate.primary,
                    foregroundColor: ColorsTravelMate.tertiary,
                    child: const Icon(Icons.share),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        builder: (BuildContext context) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 15),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Divider(
                                  color: Colors.grey,
                                  thickness: 4,
                                  indent: 110,
                                  endIndent: 110,
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                const Text(
                                  'Spending Breakdown',
                                  style: TextStyle(fontSize: 20),
                                ),
                                const SizedBox(
                                  height: 60,
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
                                      child: const Text('Category'),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        foregroundColor: const Color.fromARGB(
                                            255, 69, 68, 68),
                                      ),
                                      child: const Text('Day by Day'),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 60,
                                ),
                                const Text(
                                  'No expenses added',
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    backgroundColor: ColorsTravelMate.primary,
                    foregroundColor: ColorsTravelMate.tertiary,
                    child: const Icon(Icons.bar_chart_outlined),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
