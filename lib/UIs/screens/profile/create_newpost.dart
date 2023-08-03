import 'package:flutter/material.dart';

class NewPost extends StatelessWidget {
  // ... Your existing code ...

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF0C1C33)),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Create New Post',
          style: TextStyle(color: Color(0xFF0C1C33)),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(5.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20.0,
                  backgroundColor: Colors.grey[200],
                  backgroundImage: AssetImage('images/13.jpg'),
                ),
                SizedBox(width: 8.0),
                Text(
                  'Sheromi Zoyza',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
                SizedBox(width: 15.0),
                Expanded(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: 'EveryOne', // Set the initial selected value
                    onChanged: (String? newValue) {
                      // Handle dropdown value changes here
                      // You can implement your logic based on the selected value.
                    },
                    items: <String>['Everyone', 'Onlyme', 'Friends and Fllowers']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: TextField(
                  decoration: InputDecoration.collapsed(hintText: "What's on your mind"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
