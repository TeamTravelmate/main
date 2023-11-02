import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../screens/home/feedView_page.dart';
import '../themes/colors.dart';

// ignore: camel_case_types
class feedCard extends StatelessWidget {
  const feedCard({
    super.key,
    required this.profile,
    required this.title,
    this.subtitleIcon = Icons.location_on_rounded,
    required this.subtitle,
    required this.post,
    required this.imagePath,
    required this.likes,
    required this.comments,
  });

  final String profile;
  final String title;
  final IconData subtitleIcon;
  final String subtitle;
  final String post;
  final String imagePath;
  final String likes;
  final String comments;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (_) => feed()),
        // );
      },
      child: Container(
        margin: const EdgeInsets.only(right:20.0, left:20.0, top:20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3), // Shadow color and opacity
              spreadRadius: 2, // How far the shadow spreads from the container
              blurRadius: 2, // The intensity of the shadow blur
              offset: Offset(0, 3), // The offset of the shadow from the container
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ListTile(
                  title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Row(
                    children: [
                      Icon(subtitleIcon, size: 20),
                      Text(subtitle,
                          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold))
                    ],
                  ),
                  trailing: const Icon(
                    Icons.more_horiz,
                    color: Colors.blue, // Use your desired color
                    size: 30,
                  ),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(25), // Adjust the radius as needed
                    child: Image.network(
                      'http://192.168.8.138:3000/' + profile.replaceAll(r'\', '/'), // Replace with your image URL
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  )
              ),
              Text(post),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                ),
                child: Image.network('http://192.168.8.138:3000/' + imagePath.replaceAll(r'\', '/'),
                  width: 300, // Set the desired width
                  height: 150, // Set the desired height
                  fit: BoxFit.fill, // Adjust the fit as needed
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.thumb_up_alt),
                        color: Colors.grey,
                        onPressed: (){
                          showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            builder: (BuildContext context) {
                              return SingleChildScrollView(
                                child: Container(
                                  margin: EdgeInsets.all(16.0),
                                  child: Column(
                                    children:[
                                      Text('Likes',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,)),

                                      SizedBox(height:10.0),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start, // Adjust as needed
                                        crossAxisAlignment: CrossAxisAlignment.center, // Adjust as needed
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(50.0),
                                            child: Image.asset(
                                              'assets/profile_pic.jpeg',
                                              width: 40,
                                              height: 40,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20.0, // Adjust the spacing between image and column
                                          ),
                                          Flexible(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Sachini Usha',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text('sachisew'),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),

                                      SizedBox(
                                        height: 20.0, // Adjust the spacing between image and column
                                      ),



                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start, // Adjust as needed
                                        crossAxisAlignment: CrossAxisAlignment.center, // Adjust as needed
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(50.0),
                                            child: Image.asset(
                                              'assets/man.jpg',
                                              width: 40,
                                              height: 40,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20.0, // Adjust the spacing between image and column
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Kasun Jayaweera',style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                              ),
                                              Text('kasun99'),
                                            ],
                                          ),


                                          // Align(
                                          //   alignment: Alignment.centerRight,
                                          //   child: Container(
                                          //     margin: EdgeInsets.only(right: 0),
                                          //     child: FilledButton(
                                          //       child: Text('Following', style: TextStyle(fontSize: 15.0)),
                                          //       onPressed: () {
                                          //         // Button onPressed logic here...
                                          //       },
                                          //       style: ElevatedButton.styleFrom(
                                          //         primary: Color(0xFF0C1C33),
                                          //         minimumSize: Size(100.0, 30.0),
                                          //         shape: RoundedRectangleBorder(
                                          //           borderRadius: BorderRadius.circular(10.0),
                                          //         ),
                                          //       ),
                                          //     ),
                                          //   ),
                                          // )
                                        ],
                                      ),

                                      SizedBox(
                                        height: 20.0, // Adjust the spacing between image and column
                                      ),


                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start, // Adjust as needed
                                        crossAxisAlignment: CrossAxisAlignment.center, // Adjust as needed
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(50.0),
                                            child: Image.asset(
                                              'assets/woman.jpeg',
                                              width: 40,
                                              height: 40,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20.0, // Adjust the spacing between image and column
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Nimalee Perera',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text('nima185'),
                                            ],
                                          ),
                                        ],
                                      ),

                                      SizedBox(
                                        height: 20.0, // Adjust the spacing between image and column
                                      ),


                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start, // Adjust as needed
                                        crossAxisAlignment: CrossAxisAlignment.center, // Adjust as needed
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(50.0),
                                            child: Image.asset(
                                              'assets/woman2.jpg',
                                              width: 40,
                                              height: 40,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20.0, // Adjust the spacing between image and column
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Buddhi Yapa',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text('buddYap'),
                                            ],
                                          ),
                                        ],
                                      ),

                                      SizedBox(
                                        height: 20.0, // Adjust the spacing between image and column
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),

                      Text(
                        likes,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.message_outlined),
                        color: Colors.grey,
                        onPressed: (){

                          showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            builder: (BuildContext context) {
                              return SingleChildScrollView(
                                child: Container(
                                  margin: EdgeInsets.all(16.0),
                                  child: Column(
                                    children:[
                                      Text('Comments',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,)),

                                      SizedBox(height:10.0),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start, // Adjust as needed
                                        crossAxisAlignment: CrossAxisAlignment.center, // Adjust as needed
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(50.0),
                                            child: Image.asset(
                                              'assets/profile_pic.jpeg',
                                              width: 40,
                                              height: 40,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20.0, // Adjust the spacing between image and column
                                          ),
                                          Flexible(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Sew',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text('If you like to surfing I recommand Arugambe'),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),

                                      SizedBox(
                                        height: 20.0, // Adjust the spacing between image and column
                                      ),



                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start, // Adjust as needed
                                        crossAxisAlignment: CrossAxisAlignment.center, // Adjust as needed
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(50.0),
                                            child: Image.asset(
                                              'assets/man.jpg',
                                              width: 40,
                                              height: 40,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20.0, // Adjust the spacing between image and column
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Kasun',style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                              ),
                                              Text('Trinco'),
                                            ],
                                          ),
                                        ],
                                      ),

                                      SizedBox(
                                        height: 20.0, // Adjust the spacing between image and column
                                      ),


                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start, // Adjust as needed
                                        crossAxisAlignment: CrossAxisAlignment.center, // Adjust as needed
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(50.0),
                                            child: Image.asset(
                                              'assets/woman.jpeg',
                                              width: 40,
                                              height: 40,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20.0, // Adjust the spacing between image and column
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Nimalee',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text('Nuwaraeliya'),
                                            ],
                                          ),
                                        ],
                                      ),

                                      SizedBox(
                                        height: 20.0, // Adjust the spacing between image and column
                                      ),


                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start, // Adjust as needed
                                        crossAxisAlignment: CrossAxisAlignment.center, // Adjust as needed
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(50.0),
                                            child: Image.asset(
                                              'assets/woman2.jpg',
                                              width: 40,
                                              height: 40,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20.0, // Adjust the spacing between image and column
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Sachi',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text('I recommand Marbles beach'),
                                            ],
                                          ),
                                        ],
                                      ),

                                      SizedBox(
                                        height: 20.0, // Adjust the spacing between image and column
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                      Text(
                        comments,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.telegram_outlined,
                        color: Colors.grey,
                      ),
                      Text(
                        '26',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),





            ],
          ),
        ),
      ),
    );
  }
}