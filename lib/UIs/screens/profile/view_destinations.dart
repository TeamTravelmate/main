import 'package:flutter/material.dart';

class ViewDestination extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF0C1C33)),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text('Surfing', style: TextStyle(color: Color(0xFF0C1C33)),),

      ),

      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                  margin: EdgeInsets.only(top:5.0, left:5.0, right:5.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // Shadow color and opacity
                        spreadRadius: 2, // How far the shadow spreads from the container
                        blurRadius: 5, // The intensity of the shadow blur
                        offset: Offset(0, 3), // The offset of the shadow from the container
                      ),
                    ],
                  ),
                  padding: EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Trip to Galle",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.map_outlined),

                            )// Replace this with your desired icon
                          ]
                      ),
                      SizedBox(height: 5.0),


                      Row(
                        children: [
                          Icon(Icons.location_pin),
                          Text("Galle Fort, Unawatuna Beach",
                              style: TextStyle(
                                fontSize: 15,
                              )

                          ),
                        ],
                      ),
                      SizedBox(height: 5),

                      Row(
                        children: [
                          Icon(Icons.calendar_month),
                          Text("July 3, 2023  - July 6, 2023 (3 days)",
                              style: TextStyle(
                                fontSize: 15,
                              )

                          ),
                        ],
                      ),
                      SizedBox(height: 5),

                      Row(
                        children: [
                          Icon(Icons.person),
                          Text("Kumar & 5 others",
                              style: TextStyle(
                                fontSize: 15,
                              )

                          ),
                        ],
                      ),
                      SizedBox(height: 5),

                      Row(
                        children: [
                          Row(
                              children:[
                                Icon(Icons.surfing),
                                Text("Surfing",
                                    style: TextStyle(
                                      fontSize: 15,
                                    )

                                ),

                                SizedBox(width:15.0),

                                Icon(Icons.directions_boat_filled_sharp),
                                Text("Boat tours",
                                    style: TextStyle(
                                      fontSize: 15,
                                    )

                                ),
                              ]
                          )
                        ],
                      ),
                      SizedBox(height: 5),

                      Row(
                        children: [
                          Icon(Icons.control_point_duplicate_sharp),
                          Text("20 points",
                              style: TextStyle(
                                fontSize: 15,
                              )

                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ),



              Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                  margin: EdgeInsets.only(top:5.0, left:5.0, right:5.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // Shadow color and opacity
                        spreadRadius: 2, // How far the shadow spreads from the container
                        blurRadius: 5, // The intensity of the shadow blur
                        offset: Offset(0, 3), // The offset of the shadow from the container
                      ),
                    ],
                  ),
                  padding: EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Trip to Galle",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.map_outlined),

                            )// Replace this with your desired icon
                          ]
                      ),
                      SizedBox(height: 5.0),


                      Row(
                        children: [
                          Icon(Icons.location_pin),
                          Text("Galle Fort, Unawatuna Beach",
                              style: TextStyle(
                                fontSize: 15,
                              )

                          ),
                        ],
                      ),
                      SizedBox(height: 5),

                      Row(
                        children: [
                          Icon(Icons.calendar_month),
                          Text("July 3, 2023  - July 6, 2023 (3 days)",
                              style: TextStyle(
                                fontSize: 15,
                              )

                          ),
                        ],
                      ),
                      SizedBox(height: 5),

                      Row(
                        children: [
                          Icon(Icons.person),
                          Text("Kumar & 5 others",
                              style: TextStyle(
                                fontSize: 15,
                              )

                          ),
                        ],
                      ),
                      SizedBox(height: 5),

                      Row(
                        children: [
                          Row(
                              children:[
                                Icon(Icons.surfing),
                                Text("Surfing",
                                    style: TextStyle(
                                      fontSize: 15,
                                    )

                                ),

                                SizedBox(width:15.0),
                                Icon(Icons.directions_boat_filled_sharp),
                                Text("Boat tours",
                                    style: TextStyle(
                                      fontSize: 15,
                                    )

                                ),
                              ]
                          )
                        ],
                      ),
                      SizedBox(height: 5),

                      Row(
                        children: [
                          Icon(Icons.control_point_duplicate_sharp),
                          Text("20 points",
                              style: TextStyle(
                                fontSize: 15,
                              )

                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ),

            ]
        ),
      ),

    );
  }
}

