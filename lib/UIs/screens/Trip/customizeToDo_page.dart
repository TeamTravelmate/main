import 'package:flutter/material.dart';
import '../../themes/colors.dart';
import '../../widgets/inputField_widget.dart';

class CustomizeToDo extends StatelessWidget {
  const CustomizeToDo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // List<String> _list = [];

    bool? _isItem = false;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checklist'),
        backgroundColor: ColorsTravelMate.tertiary,
        foregroundColor: ColorsTravelMate.primary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(60.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                child: Column(
                  children: [
                    const Text('Checklist', style: TextStyle(fontSize: 18)),
                    ListTile(
                      leading:
                          Checkbox(value: _isItem, onChanged: (bool? value) {}),
                      title: const Text('Item 1'),
                    ),
                    ListTile(
                      leading:
                          Checkbox(value: _isItem, onChanged: (bool? value) {}),
                      title: const Text('Item 2'),
                    ),
                    ListTile(
                      leading:
                          Checkbox(value: _isItem, onChanged: (bool? value) {}),
                      title: const Text('Item 3'),
                    ),
                    const Divider(color: Colors.grey, thickness: 1),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('0 of 3'),
                          Row(
                            children: [
                              TextButton.icon(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                          height: 40,
                                        ),
                                        const Text('Important Notes',
                                            style: TextStyle(fontSize: 20)),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const Text('Explore, Plan, and Embark on Your Dream Adventure! Add tour essentials here...'),
                                        const SizedBox(height: 20,),
                                        const TextFieldWidget(
                                          labelText: 'Checklist',
                                          hintText: 'Item',
                                          prefixIcon:
                                              Icon(Icons.check_circle_sharp),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            TextButton(
                                              onPressed: () {},
                                              child: const Text(
                                                'Save',
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 160,
                                            ),
                                            TextButton(
                                              onPressed: () {},
                                              child: const Text(
                                                'Cancel',
                                                style: TextStyle(
                                                    color: Colors.red),
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
                                icon: const Icon(Icons.add_circle_rounded,
                                    color: Colors.grey),
                                label: const Text(
                                  'Add Item',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    children: [
                      const Text('Notes', style: TextStyle(fontSize: 18)),
                      const Text(
                        '\nEg: Reminders\n\n',
                      ),
                      const Divider(color: Colors.grey, thickness: 1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.notifications),
                          TextButton(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                          height: 40,
                                        ),
                                        const Text('Important Notes',
                                            style: TextStyle(fontSize: 20)),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const TextFieldWidget(
                                          labelText: 'Add reminder',
                                          hintText: 'Reminder',
                                          prefixIcon:
                                              Icon(Icons.notification_add),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            TextButton(
                                              onPressed: () {},
                                              child: const Text(
                                                'Save',
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 160,
                                            ),
                                            TextButton(
                                              onPressed: () {},
                                              child: const Text(
                                                'Cancel',
                                                style: TextStyle(
                                                    color: Colors.red),
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
                                  MaterialStateProperty.all(Colors.grey),
                              foregroundColor: MaterialStateProperty.all(
                                  ColorsTravelMate.tertiary),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            child: const Text('Add'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
