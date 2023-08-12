import 'package:flutter/material.dart';

class NewPost extends StatelessWidget {

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
        margin: EdgeInsets.only(top:20.0, left:15.0, bottom:15.0),
        padding: EdgeInsets.all(5.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundColor: Colors.grey[200],
                  backgroundImage: AssetImage('assets/profile_pic.jpeg'),
                ),
                SizedBox(width: 8.0),
                Text(
                  'Sheromi Zoyza',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(width: 30.0),

                Expanded(
                  child: Container(
                    width:50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: 'EveryOne', // Set the initial selected value
                      onChanged: (String? newValue) {
                        // Handle dropdown value changes here
                        // You can implement your logic based on the selected value.
                      },
                      items: <String>['EveryOne', 'Onlyme', 'Friends']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Padding( // Add Padding widget around the Text
                            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                            child: Text(value),
                          ),
                        );
                      }).toList(),

                      icon: Icon(Icons.arrow_downward), // You can choose any icon you like
                      iconSize: 24,
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      hint: Text('Select an option'),
                      isDense: true,
                      itemHeight: 50,

                      elevation: 8,

                      underline: Container( // Custom underline widget
                        height: 0,
                        width: 5.0,// Set the height of the underline to 0 to remove the default underline
                      ),
                    ),
                  ),
                ),
              ],
            ),


            Container(
              padding: EdgeInsets.symmetric(vertical: 10), // Set your desired margin using EdgeInsets
              child: Divider(
                height: 1, // Set the height of the divider
                color: Colors.grey, // Set the color of the divider
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 15.0), // Adjust the value as per your requirement
                  child: Column(
                    children: [
                      Container(
                        height: 50.0,
                        child: TextField(
                          decoration: InputDecoration.collapsed(hintText: "What's your travel experience"),
                        ),
                      ),
                      Divider(
                        height: 1, // Set the height of the divider
                        color: Colors.grey, // Set the color of the divider
                      ),
                    ],
                  ),
                ),
              ),
            )


          ],
        ),
      ),
    );
  }
}
