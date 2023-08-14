import 'package:flutter/material.dart';

class Position extends StatelessWidget {
  const Position({super.key});

  @override
  Widget build(BuildContext context){
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
            Card(
              margin: EdgeInsets.all(20.0),
              elevation: 5.0,
              shadowColor: Colors.black,
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            CircleAvatar(
                              radius: 56.0,
                              backgroundColor: Color(0x992FACBB),
                              child: CircleAvatar(
                                backgroundImage: AssetImage('assets/img/woman.jpg'),
                                radius: 52.0,
                              ),
                            ),
                            CircleAvatar(
                              radius: 15.0,
                              backgroundColor: Color(0xFF2FACBB),
                              child: Text(
                                '5',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '1000 points',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Hi Sheromi!',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                        ),
                        Text(
                          'Good Luck on your',
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                        Text(
                          'achievement',
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                        SizedBox(height: 25.0,),
                        Text(
                          'Four levels to reach',
                          style: TextStyle(
                              fontSize: 15.0
                          ),
                        ),
                        Text(
                          'the top',
                          style: TextStyle(
                              fontSize: 15.0
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  top: 10.0,
                  bottom: 5.0
              ),
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      'Activities you have done so far',
                      style: TextStyle(
                          fontSize: 15.0
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 30.0,
                          height: 30.0,
                          margin: EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                              image: DecorationImage(
                                  image: AssetImage('assets/img/camp.png'),
                                  fit: BoxFit.cover
                              )
                          ),
                        ),
                        Container(
                          width: 30.0,
                          height: 30.0,
                          margin: EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                              image: DecorationImage(
                                  image: AssetImage('assets/img/hike.png'),
                                  fit: BoxFit.cover
                              )
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Plan your next trip <<<',
                style: TextStyle(
                    fontSize: 25.0
                ),
                textAlign: TextAlign.center,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  gradient: LinearGradient(
                      colors: [Color(0xFF2FACBB), Colors.white],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}