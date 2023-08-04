import 'package:flutter/material.dart';

class LeaderBoard extends StatelessWidget {
  const LeaderBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Card(
              margin: EdgeInsets.only(
                  top: 45.0,
                  bottom: 10.0
              ),
              elevation: 5.0,
              shadowColor: Colors.black,
              child: Container(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.menu),
                    SizedBox(width: 80.0,),
                    Text(
                      'Leaderboard',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}