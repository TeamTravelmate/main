import 'package:flutter/material.dart';
import '../../themes/colors.dart';
import '../../widgets/inputField_widget.dart';
import 'package:info_popup/info_popup.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';

class CustomizeBudget extends StatefulWidget {
  const CustomizeBudget({Key? key}) : super(key: key);

  @override
  State<CustomizeBudget> createState() => _CustomizeBudgetState();
}

class _CustomizeBudgetState extends State<CustomizeBudget> {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Expenses'),
        backgroundColor: ColorsTravelMate.tertiary,
        foregroundColor: ColorsTravelMate.primary,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
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
                //Add expenses button
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
                              const Text('Set Budget',
                                  style: TextStyle(fontSize: 20)),
                              const Text(
                                'Add all your expenses here! TravelMate simplifies the budget handling for you!',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              DropDownTextField(
                                // initialValue: "Category",
                                controller: _cnt,
                                clearOption: true,
                                // enableSearch: true,
                                // dropdownColor: Colors.green,
                                // searchDecoration: const InputDecoration(
                                //     hintText:
                                //         "enter hint text here"),
                                validator: (value) {
                                  if (value == null) {
                                    return "Required field";
                                  } else {
                                    return null;
                                  }
                                },
                                dropDownItemCount: 4,

                                dropDownList: const [
                                  DropDownValueModel(
                                      name: 'Food', value: "Food"),
                                  DropDownValueModel(
                                      name: 'Transport', value: "Transport"),
                                  DropDownValueModel(
                                      name: 'Hotels', value: "Hotels"),
                                  DropDownValueModel(
                                      name: 'Tickets', value: "Tickets"),
                                  DropDownValueModel(
                                      name: 'name5', value: "value5"),
                                  DropDownValueModel(
                                      name: 'name6', value: "value6"),
                                  DropDownValueModel(
                                      name: 'name7', value: "value7"),
                                ],
                                onChanged: (val) {},
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFieldWidget(
                                labelText: 'Description',
                                hintText: 'lunch',
                                prefixIcon: Icon(Icons.description_outlined),
                                validator: (val) {
                                  if ( val.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFieldWidget(
                                labelText: 'Enter Amount',
                                hintText: 'Rs 0.00',
                                prefixIcon: Icon(Icons.money),
                                validator: (value) {
                                  if (value == null) {
                                    return 'Please enter some text';
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      _formKey.currentState!.validate();
                                    },
                                    child: Text('Save'),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              ColorsTravelMate.secundary
                                                  .withOpacity(0.3)),
                                      foregroundColor:
                                          MaterialStateProperty.all(
                                              ColorsTravelMate.secundary),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // const SizedBox(
                                  //   width: 160,
                                  // ),
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text('Cancel'),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.red.withOpacity(0.4)),
                                      foregroundColor:
                                          MaterialStateProperty.all(Colors.red),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                      TextFieldWidget(
                                        labelText: 'Enter Amount',
                                        hintText: 'Rs 0.00',
                                        prefixIcon: Icon(Icons.money),
                                        validator: (value) {
                                          if (value == null) {
                                            return 'Please enter some text';
                                          }
                                        },
                                      ),
                                      const SizedBox(
                                        height: 40,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                                  padding:
                                                      EdgeInsets.only(top: 5),
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
                                                backgroundColor:
                                                    const Color(0xffE0E0E0),
                                                foregroundColor:
                                                    const Color.fromARGB(
                                                        255, 69, 68, 68),
                                                child: const Icon(Icons.upload),
                                              ),
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(top: 5),
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
                                        label:
                                            const Text('Share with Tripmates'),
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
                                    TextFieldWidget(
                                      labelText: 'Invite By Email Address',
                                      hintText: 'Email Address',
                                      prefixIcon: Icon(Icons.email),
                                      validator: (value) {
                                        if (value == null) {
                                          return 'Please enter some text';
                                        }
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            FloatingActionButton(
                                              onPressed: () {},
                                              backgroundColor:
                                                  const Color(0xffE0E0E0),
                                              foregroundColor:
                                                  const Color.fromARGB(
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
                                              backgroundColor:
                                                  const Color(0xffE0E0E0),
                                              foregroundColor:
                                                  const Color.fromARGB(
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
                                              backgroundColor:
                                                  const Color(0xffE0E0E0),
                                              foregroundColor:
                                                  const Color.fromARGB(
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
                        backgroundColor: ColorsTravelMate.primary,
                        foregroundColor: ColorsTravelMate.tertiary,
                        child: const Icon(Icons.share),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
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
                            'View & share the budget \nwith your trip mates by \ncategory or day by day \nexpenses.',
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
                        dismissTriggerBehavior:
                            PopupDismissTriggerBehavior.onTapArea,
                        areaBackgroundColor: Colors.transparent,
                        indicatorOffset: Offset.zero,
                        contentOffset: Offset.zero,
                        child: FloatingActionButton(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {},
                                            style: TextButton.styleFrom(
                                              backgroundColor:
                                                  Colors.grey.shade200,
                                              foregroundColor:
                                                  const Color.fromARGB(
                                                      255, 69, 68, 68),
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
                                              foregroundColor:
                                                  const Color.fromARGB(
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
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
