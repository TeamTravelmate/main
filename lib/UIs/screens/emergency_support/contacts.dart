import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Options(),
    );
  }
}

class Options extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Options'),
      ),
      body: Contacts(),
    );
  }
}

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}
// ... Existing code ...

class _ContactsState extends State<Contacts> {
  List<EmergencyContact> emergencyContacts = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Contacts'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _showContactInputDialog(context);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                width: 350,
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(Icons.search),
                      SizedBox(width: 40),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration.collapsed(
                            hintText: 'Search',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: emergencyContacts.length,
                  itemBuilder: (context, index) {
                    return ContactCard(
                      contact: emergencyContacts[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showContactInputDialog(BuildContext context) async {
    nameController.clear();
    phoneNumberController.clear();

    bool saveButtonEnabled = false;

    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) {
            return AlertDialog(
              title: Text('Add New Emergency Contact'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(labelText: 'Contact Name'),
                    onChanged: (value) {
                      setState(() {
                        saveButtonEnabled = nameController.text.isNotEmpty &&
                            phoneNumberController.text.length >= 10;
                      });
                    },
                  ),
                  TextFormField(
                    controller: phoneNumberController,
                    decoration: InputDecoration(labelText: 'Phone Number'),
                    onChanged: (value) {
                      setState(() {
                        saveButtonEnabled = nameController.text.isNotEmpty &&
                            phoneNumberController.text.length >= 10;
                      });
                    },
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                ElevatedButton(
                  onPressed: saveButtonEnabled
                      ? () {
                          if (phoneNumberController.text.length >= 10) {
                            final newContact = EmergencyContact(
                              name: nameController.text,
                              phoneNumber: phoneNumberController.text,
                            );
                            emergencyContacts.add(newContact);
                            _showConfirmationDialog(context);
                            Navigator.of(context).pop();
                            setState(() {}); // Trigger a rebuild of the Contacts widget
                          } else {
                            _showErrorDialog(context);
                          }
                        }
                      : null,
                  child: Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  // ... Existing code ...
}


  Future<void> _showErrorDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text('Please enter a valid phone number with at least 10 digits.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ],
        );
          },
        );
  }

  Future<void> _showConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Contact Added'),
          content: Text('The contact has been added to the emergency contact list.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ],
        );
          },
        );
      }


class ContactCard extends StatelessWidget {
  final EmergencyContact contact;

  ContactCard({required this.contact});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(12),
      child: Row(
        children: [
          Icon(Icons.person, size: 50),
          SizedBox(width: 20),
          Text(
            contact.name,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 60),
          IconButton(
            icon: Icon(Icons.call),
            onPressed: () {
              // Implement contact button functionality here (e.g., make a phone call)
            },
          ),
        ],
      ),
    );
  }
}

class EmergencyContact {
  final String name;
  final String phoneNumber;

  EmergencyContact({
    required this.name,
    required this.phoneNumber,
  });
}
