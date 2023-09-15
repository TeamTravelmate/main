// ignore_for_file: unnecessary_null_comparison
import 'package:flutter/material.dart';
import '../../../Domain/services/notification_services.dart';
import '../../themes/colors.dart';
import 'package:intl/intl.dart';

class Reminder {
  final String title;
  final String time;
  final String date;

  Reminder(this.title, this.time, this.date);
}

class CustomizeToDo extends StatefulWidget {
  const CustomizeToDo({Key? key}) : super(key: key);

  @override
  State<CustomizeToDo> createState() => _CustomizeToDoState();
}

class _CustomizeToDoState extends State<CustomizeToDo> {
  final Map<String, bool> _map = {};
  int _count = 0;

  // List to store user-added reminders
  //example. Reminder("Meeting", "10:00 AM", "2023-08-24"),
  final List<Reminder> userReminders = [];

  List<Tab> tabs = [
    const Tab(
      child: Text('ToDo', style: TextStyle(fontSize: 18)),
    ),
    const Tab(
      child: Text('Reminders', style: TextStyle(fontSize: 18)),
    )
  ];

  List<Widget> tabContent = [
    Container(
      child: const ToDo(),
    ),
    Container(
      child: const ReminderTab(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('Welcome Back!'),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(100.0),
            child: TabBar(
              indicatorColor: ColorsTravelMate.tertiary,
              labelColor: ColorsTravelMate.tertiary,
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              isScrollable: true,
              tabs: tabs,
            ),
          ),
          backgroundColor: ColorsTravelMate.secundary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        ),
        body: TabBarView(
          children: tabContent,
        ),
      ),
    );
  }
}

class RemindersList extends StatelessWidget {
  final List<Reminder> reminders;

  const RemindersList({required this.reminders});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: reminders.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 2.0,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: Icon(
                Icons.push_pin_rounded,
                color: Colors.indigoAccent[800],
                size: 30.0,
              ),
              title: Text(reminders[index].title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(reminders[index].time, style: const TextStyle(fontSize: 14)),
                  Text(
                    "Date: ${reminders[index].date}",
                    style: const TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  // NotificationService().showNotification(
                  //     id: index,
                  //     title: reminders[index].title,
                  //     body: reminders[index].time,
                  //     payload: reminders[index].date);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.amber[100]),
                  shape: MaterialStatePropertyAll<CircleBorder>(
                    CircleBorder(
                      side: BorderSide(color: Colors.amber[700]!, width: 2),
                    ),
                  ),
                ),
                child: Icon(Icons.notification_add, color: Colors.amber[800]),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ToDo extends StatefulWidget {
  const ToDo({super.key});

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  final Map<String, bool> _map = {};
  int _count = 0;

  final List<Reminder> userReminders = [];

  void _showAddItemDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        String newItemLabel = '';

        return AlertDialog(
          title: const Text('Add Item'),
          content: TextField(
            onChanged: (value) {
              newItemLabel = value;
            },
            decoration: const InputDecoration(labelText: 'Item Name'),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (newItemLabel.isNotEmpty) {
                  setState(() {
                    _map[newItemLabel] = false;
                  });
                  Navigator.pop(context);
                }
              },
              style: const ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(ColorsTravelMate.secundary),
                foregroundColor:
                    MaterialStatePropertyAll(ColorsTravelMate.tertiary),
              ),
              child: const Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: const ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(ColorsTravelMate.tertiary),
                foregroundColor:
                    MaterialStatePropertyAll(ColorsTravelMate.secundary),
              ),
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _updateChecked(String key, bool value) {
    setState(() {
      _map[key] = value;
      _count = _map.values.where((element) => element).length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Explore, Plan, and Embark on Your Dream Adventure! Add tour essentials here...',
            style: TextStyle(fontSize: 15),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView(
              children: _map.keys
                  .map(
                    (key) => Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: CheckboxListTile(
                        value: _map[key],
                        onChanged: (value) => _updateChecked(key, value!),
                        subtitle: Text(key, style: const TextStyle(fontSize: 16)),
                        // tileColor: ColorsTravelMate.secundary.withOpacity(0.4),
                        checkColor: ColorsTravelMate.tertiary,
                        activeColor: ColorsTravelMate.secundary,
                        dense: true,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$_count of ${_map.length} ticked',
                  style: const TextStyle(fontSize: 16),
                ),
                FloatingActionButton(
                  onPressed: () => _showAddItemDialog(context),
                  backgroundColor: ColorsTravelMate.secundary,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReminderTab extends StatefulWidget {
  const ReminderTab({super.key});

  @override
  State<ReminderTab> createState() => _ReminderTabState();
}

class _ReminderTabState extends State<ReminderTab> {
  final List<Reminder> userReminders = [];

  void _showAddReminderDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        String newReminderLabel = '';
        TimeOfDay selectedTime = TimeOfDay.now();
        DateTime selectedDate = DateTime.now();

        String errorMessage = '';

        return AlertDialog(
          title: const Text('Add Reminder'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                onChanged: (value) {
                  newReminderLabel = value;
                },
                decoration: const InputDecoration(labelText: 'Reminder Name'),
              ),
              ElevatedButton(
                onPressed: () async {
                  final TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: selectedTime,
                    initialEntryMode: TimePickerEntryMode.input,
                    builder: (BuildContext context, Widget? child) {
                      return Theme(
                        data: ThemeData.light().copyWith(
                          primaryColor: ColorsTravelMate
                              .tertiary, // Change the color of the header
                          hintColor: ColorsTravelMate
                              .secundary, // Change the color of the selected time
                          colorScheme: const ColorScheme.light(
                              primary: ColorsTravelMate.secundary),
                          buttonTheme: const ButtonThemeData(
                              textTheme: ButtonTextTheme.primary),
                        ),
                        child: child!,
                      );
                    },
                  );
                  if (pickedTime != null && pickedTime != selectedTime) {
                    setState(() {
                      selectedTime = pickedTime;
                    });
                  }
                },
                style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(ColorsTravelMate.secundary),
                ),
                child: Text('Select Time: ${selectedTime.format(context)}'),
              ),
              ElevatedButton(
                onPressed: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                    builder: (BuildContext context, Widget? child) {
                      return Theme(
                        data: ThemeData.light().copyWith(
                          primaryColor: ColorsTravelMate
                              .tertiary, // Change the color of the header and selected date
                          hintColor: ColorsTravelMate
                              .secundary, // Change the color of the calendar icons
                          colorScheme: const ColorScheme.light(
                              primary: ColorsTravelMate.secundary),
                          buttonTheme: const ButtonThemeData(
                              textTheme: ButtonTextTheme.primary),
                        ),
                        child: child!,
                      );
                    },
                  );
                  if (pickedDate != null && pickedDate != selectedDate) {
                    setState(() {
                      selectedDate = pickedDate;
                    });
                  }
                },
                style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(ColorsTravelMate.secundary),
                ),
                child: Text(
                    'Select Date: ${DateFormat('yyyy-MM-dd').format(selectedDate)}'),
              ),
              if (errorMessage.isNotEmpty)
                Text(
                  errorMessage,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 12.0,
                  ),
                ),
            ],
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  if (newReminderLabel.isEmpty ||
                      selectedTime == null ||
                      selectedDate == null) {
                    // Set the error message if any field is empty
                    setState(() {
                      errorMessage = 'All fields are required.';
                    });
                  } else {
                    // Clear the error message and add the reminder
                    setState(() {
                      errorMessage = '';
                      userReminders.add(
                        Reminder(newReminderLabel, selectedTime.format(context),
                            DateFormat('yyyy-MM-dd').format(selectedDate)),
                      );

                      int reminderIndex = userReminders.length -
                          1; // Index of the newly added reminder

                      // Calculate the notification time
                      DateTime selectedDateTime = DateTime(
                        selectedDate.year,
                        selectedDate.month,
                        selectedDate.day,
                        selectedTime.hour,
                        selectedTime.minute,
                      );
                      DateTime scheduledTime = selectedDateTime;

                      // Schedule the notification
                      NotificationService().scheduleNotification(
                        id: reminderIndex,
                        title: 'Reminder:',
                        body: '${userReminders[reminderIndex].title}',
                        scheduledNotificationDateTime: scheduledTime,
                      );
                    });
                    Navigator.pop(context);
                  }
                },
                style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(ColorsTravelMate.secundary),
                  foregroundColor:
                      MaterialStatePropertyAll(ColorsTravelMate.tertiary),
                ),
                child: const Text('Add')),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: const ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(ColorsTravelMate.tertiary),
                foregroundColor:
                    MaterialStatePropertyAll(ColorsTravelMate.secundary),
              ),
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Text(
            'Stay organized while traveling with TravelMate.',
            style: TextStyle(fontSize: 15),
          ),
          RemindersList(reminders: userReminders),
          Padding(
            padding: const EdgeInsets.only(left: 300.0),
            child: FloatingActionButton(
              onPressed: () => _showAddReminderDialog(context),
              backgroundColor: ColorsTravelMate.secundary,
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
