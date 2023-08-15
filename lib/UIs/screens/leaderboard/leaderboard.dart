import 'package:flutter/material.dart';
import 'package:main/UIs/screens/leaderboard/position.dart';

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
            Container(
              width: double.infinity,
              height: 195,
              margin: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  bottom: 10
              ),
              padding: EdgeInsets.only(
                  top: 20.0
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 80,
                    left: 40,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Color(0xFFC0C0C0),
                      child: CircleAvatar(
                        radius: 36,
                        backgroundImage: AssetImage('assets/img/man.jpg'),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 80,
                    left: 200,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Color(0xFFCD7F32),
                      child: CircleAvatar(
                        radius: 36,
                        backgroundImage: AssetImage('assets/img/woman2.jpg'),
                      ),
                    ),
                  ),
                  Container(
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Color(0xFFFFD700),
                      child: CircleAvatar(
                        radius: 55,
                        backgroundImage: AssetImage('assets/img/woman.jpg'),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -1,
                    left: 180.0,
                    child: Image(
                      image: AssetImage('assets/img/crown.png'),
                    ),
                  ),
                  Positioned(
                    top: 135,
                    left: 143,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Color(0xCCFFD700),
                      child: Text(
                        '1',
                        style: TextStyle(
                            fontSize: 13.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 145,
                    left: 65,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Color(0xCCC0C0C0),
                      child: Text(
                        '2',
                        style: TextStyle(
                            fontSize: 13.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 145,
                    left: 225,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Color(0xCCCD7F32),
                      child: Text(
                        '3',
                        style: TextStyle(
                            fontSize: 13.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              elevation: 3.0,
              margin: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  bottom: 5.0
              ),
              shadowColor: Colors.black,
              child: Container(
                height: 60.0,
                padding: EdgeInsets.only(
                    left: 10.0,
                    right: 10.0,
                    top: 6.0,
                    bottom: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 40.0,
                            height: 40.0,
                            margin: EdgeInsets.all(5.0),
                            padding: EdgeInsets.all(5.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  color: Color(0xFF0C1C33),
                                  image: DecorationImage(
                                      image: AssetImage('assets/img/crown.png'),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              color: Color(0xFF0C1C33),
                            ),
                          ),
                          Container(
                            width: 40.0,
                            height: 40.0,
                            margin: EdgeInsets.only(
                                left: 5.0,
                                right: 10.0),
                            padding: EdgeInsets.all(2.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                              image: DecorationImage(
                                image: AssetImage('assets/img/woman.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            child: Container(
                                padding: EdgeInsets.only(
                                    top: 10.0
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Sheromi',
                                      style: TextStyle(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF0C1C33),
                                      ),
                                    ),
                                    Text(
                                      '1000 points',
                                      style: TextStyle(
                                        fontSize: 11.0,
                                        color: Color(0xFF0C1C33),
                                      ),
                                    ),
                                  ],
                                )
                            ),
                          )
                        ],
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
                                    image: AssetImage('assets/img/hike.png'),
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
                                    image: AssetImage('assets/img/surf.png'),
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
            ),
            Card(
              elevation: 3.0,
              margin: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  bottom: 5.0
              ),
              shadowColor: Colors.black,
              child: Container(
                height: 60.0,
                padding: EdgeInsets.only(
                    left: 10.0,
                    right: 10.0,
                    top: 6.0,
                    bottom: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 40.0,
                            height: 40.0,
                            margin: EdgeInsets.all(5.0),
                            padding: EdgeInsets.only(
                                left: 12.0,
                                right: 10.0,
                                top: 5.0),
                            child: Text(
                              '2',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0,
                                  color: Colors.yellow
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              color: Color(0xFF0C1C33),
                            ),
                          ),
                          Container(
                            width: 40.0,
                            height: 40.0,
                            margin: EdgeInsets.only(
                                left: 5.0,
                                right: 10.0),
                            padding: EdgeInsets.all(2.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                              image: DecorationImage(
                                image: AssetImage('assets/img/woman.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            child: Container(
                                padding: EdgeInsets.only(
                                    top: 10.0
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Sheromi',
                                      style: TextStyle(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF0C1C33),
                                      ),
                                    ),
                                    Text(
                                      '1000 points',
                                      style: TextStyle(
                                        fontSize: 11.0,
                                        color: Color(0xFF0C1C33),
                                      ),
                                    ),
                                  ],
                                )
                            ),
                          )
                        ],
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
                                    image: AssetImage('assets/img/surf.png'),
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
            ),
            Card(
              elevation: 3.0,
              margin: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  bottom: 5.0
              ),
              shadowColor: Colors.black,
              child: Container(
                height: 60.0,
                padding: EdgeInsets.only(
                    left: 10.0,
                    right: 10.0,
                    top: 6.0,
                    bottom: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 40.0,
                            height: 40.0,
                            margin: EdgeInsets.all(5.0),
                            padding: EdgeInsets.only(
                                left: 12.0,
                                right: 10.0,
                                top: 5.0),
                            child: Text(
                              '3',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0,
                                  color: Colors.yellow
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              color: Color(0xFF0C1C33),
                            ),
                          ),
                          Container(
                            width: 40.0,
                            height: 40.0,
                            margin: EdgeInsets.only(
                                left: 5.0,
                                right: 10.0),
                            padding: EdgeInsets.all(2.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                              image: DecorationImage(
                                image: AssetImage('assets/img/woman.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            child: Container(
                                padding: EdgeInsets.only(
                                    top: 10.0
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Sheromi',
                                      style: TextStyle(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF0C1C33),
                                      ),
                                    ),
                                    Text(
                                      '1000 points',
                                      style: TextStyle(
                                        fontSize: 11.0,
                                        color: Color(0xFF0C1C33),
                                      ),
                                    ),
                                  ],
                                )
                            ),
                          )
                        ],
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
                                    image: AssetImage('assets/img/hike.png'),
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
                                    image: AssetImage('assets/img/surf.png'),
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
            ),
            Card(
              elevation: 3.0,
              margin: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  bottom: 5.0
              ),
              shadowColor: Colors.black,
              child: Container(
                height: 60.0,
                padding: EdgeInsets.only(
                    left: 10.0,
                    right: 10.0,
                    top: 6.0,
                    bottom: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 40.0,
                            height: 40.0,
                            margin: EdgeInsets.all(5.0),
                            padding: EdgeInsets.only(
                                left: 12.0,
                                right: 10.0,
                                top: 5.0),
                            child: Text(
                              '4',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0,
                                  color: Colors.yellow
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              color: Color(0xFF0C1C33),
                            ),
                          ),
                          Container(
                            width: 40.0,
                            height: 40.0,
                            margin: EdgeInsets.only(
                                left: 5.0,
                                right: 10.0),
                            padding: EdgeInsets.all(2.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                              image: DecorationImage(
                                image: AssetImage('assets/img/woman.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            child: Container(
                                padding: EdgeInsets.only(
                                    top: 10.0
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Sheromi',
                                      style: TextStyle(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF0C1C33),
                                      ),
                                    ),
                                    Text(
                                      '1000 points',
                                      style: TextStyle(
                                        fontSize: 11.0,
                                        color: Color(0xFF0C1C33),
                                      ),
                                    ),
                                  ],
                                )
                            ),
                          )
                        ],
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
                                    image: AssetImage('assets/img/surf.png'),
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
                                    image: AssetImage('assets/img/camp.png'),
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
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Position())
                );
              },
              child: Card(
                color: Color(0x66FFD700),
                elevation: 3.0,
                margin: EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    bottom: 5.0
                ),
                shadowColor: Colors.black,
                child: Container(
                  height: 60.0,
                  padding: EdgeInsets.only(
                      left: 10.0,
                      right: 10.0,
                      top: 6.0,
                      bottom: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 40.0,
                              height: 40.0,
                              margin: EdgeInsets.all(5.0),
                              padding: EdgeInsets.only(
                                  left: 12.0,
                                  right: 10.0,
                                  top: 5.0),
                              child: Text(
                                '5',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0,
                                    color: Colors.yellow
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                color: Color(0xFF0C1C33),
                              ),
                            ),
                            Container(
                              width: 40.0,
                              height: 40.0,
                              margin: EdgeInsets.only(
                                  left: 5.0,
                                  right: 10.0),
                              padding: EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(50)),
                                image: DecorationImage(
                                  image: AssetImage('assets/img/woman.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10.0
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Good Luck on your achivement!',
                                        style: TextStyle(
                                          fontSize: 9.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red,
                                        ),
                                      ),
                                      Text(
                                        'Sheromi',
                                        style: TextStyle(
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF0C1C33),
                                        ),
                                      ),
                                      Text(
                                        '1000 points',
                                        style: TextStyle(
                                          fontSize: 11.0,
                                          color: Color(0xFF0C1C33),
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                            )
                          ],
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

              ),
            ),
            Card(
              elevation: 3.0,
              margin: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  bottom: 5.0
              ),
              shadowColor: Colors.black,
              child: Container(
                height: 60.0,
                padding: EdgeInsets.only(
                    left: 10.0,
                    right: 10.0,
                    top: 6.0,
                    bottom: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 40.0,
                            height: 40.0,
                            margin: EdgeInsets.all(5.0),
                            padding: EdgeInsets.only(
                                left: 12.0,
                                right: 10.0,
                                top: 5.0),
                            child: Text(
                              '6',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0,
                                  color: Colors.yellow
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              color: Color(0xFF0C1C33),
                            ),
                          ),
                          Container(
                            width: 40.0,
                            height: 40.0,
                            margin: EdgeInsets.only(
                                left: 5.0,
                                right: 10.0),
                            padding: EdgeInsets.all(2.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                              image: DecorationImage(
                                image: AssetImage('assets/img/woman.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            child: Container(
                                padding: EdgeInsets.only(
                                    top: 10.0
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Sheromi',
                                      style: TextStyle(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF0C1C33),
                                      ),
                                    ),
                                    Text(
                                      '1000 points',
                                      style: TextStyle(
                                        fontSize: 11.0,
                                        color: Color(0xFF0C1C33),
                                      ),
                                    ),
                                  ],
                                )
                            ),
                          )
                        ],
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
                                    image: AssetImage('assets/img/surf.png'),
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
            ),
          ],
        ),
      ),
    );
  }
}