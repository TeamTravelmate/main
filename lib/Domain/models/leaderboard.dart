class Leaderboard {
  final int? id;
  final int? count;
  final String? name;
  final String? email;
  final String? profile_pic;

  Leaderboard({
    required this.id,
    required this.count,
    required this.name,
    required this.email,
    required this.profile_pic,
  });

  factory Leaderboard.fromJson(Map<String, dynamic> json) {
    return Leaderboard(
      id: json['user_id'],
      count: json['trips'],
      name: json['username'],
      email: json['email'],
      profile_pic: json['profile_pic'],
    );
  }

  static List<Leaderboard> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((user) => Leaderboard.fromJson(user)).toList();
  }
}

// Card(
//   elevation: 3.0,
//   margin: EdgeInsets.only(
//       left: 20.0,
//       right: 20.0,
//       bottom: 5.0
//   ),
//   shadowColor: Colors.black,
//   child: Container(
//     height: 60.0,
//     padding: EdgeInsets.only(
//         left: 10.0,
//         right: 10.0,
//         top: 6.0,
//         bottom: 5.0),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Container(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 width: 40.0,
//                 height: 40.0,
//                 margin: EdgeInsets.all(5.0),
//                 padding: EdgeInsets.only(
//                     left: 12.0,
//                     right: 10.0,
//                     top: 5.0),
//                 child: Text(
//                   '2',
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 25.0,
//                       color: Colors.yellow
//                   ),
//                 ),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(5.0)),
//                   color: Color(0xFF0C1C33),
//                 ),
//               ),
//               Container(
//                 width: 40.0,
//                 height: 40.0,
//                 margin: EdgeInsets.only(
//                     left: 5.0,
//                     right: 10.0),
//                 padding: EdgeInsets.all(2.0),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(50)),
//                   image: DecorationImage(
//                     image: AssetImage(controller.leaderboard[index].profile_pic ?? 'assets/img/woman.jpg'),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               Container(
//                 child: Container(
//                     padding: EdgeInsets.only(
//                         top: 10.0
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Sheromi',
//                           style: TextStyle(
//                             fontSize: 13.0,
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xFF0C1C33),
//                           ),
//                         ),
//                         Text(
//                           '1000 points',
//                           style: TextStyle(
//                             fontSize: 11.0,
//                             color: Color(0xFF0C1C33),
//                           ),
//                         ),
//                       ],
//                     )
//                 ),
//               )
//             ],
//           ),
//         ),
//         Container(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 width: 30.0,
//                 height: 30.0,
//                 margin: EdgeInsets.all(2.0),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(50)),
//                     image: DecorationImage(
//                         image: AssetImage('assets/img/camp.png'),
//                         fit: BoxFit.cover
//                     )
//                 ),
//               ),
//               Container(
//                 width: 30.0,
//                 height: 30.0,
//                 margin: EdgeInsets.all(2.0),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(50)),
//                     image: DecorationImage(
//                         image: AssetImage('assets/img/surf.png'),
//                         fit: BoxFit.cover
//                     )
//                 ),
//               ),
//             ],
//           ),
//         )
//       ],
//     ),
//   ),
// ),
// Card(
//   elevation: 3.0,
//   margin: EdgeInsets.only(
//       left: 20.0,
//       right: 20.0,
//       bottom: 5.0
//   ),
//   shadowColor: Colors.black,
//   child: Container(
//     height: 60.0,
//     padding: EdgeInsets.only(
//         left: 10.0,
//         right: 10.0,
//         top: 6.0,
//         bottom: 5.0),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Container(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 width: 40.0,
//                 height: 40.0,
//                 margin: EdgeInsets.all(5.0),
//                 padding: EdgeInsets.only(
//                     left: 12.0,
//                     right: 10.0,
//                     top: 5.0),
//                 child: Text(
//                   '3',
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 25.0,
//                       color: Colors.yellow
//                   ),
//                 ),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(5.0)),
//                   color: Color(0xFF0C1C33),
//                 ),
//               ),
//               Container(
//                 width: 40.0,
//                 height: 40.0,
//                 margin: EdgeInsets.only(
//                     left: 5.0,
//                     right: 10.0),
//                 padding: EdgeInsets.all(2.0),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(50)),
//                   image: DecorationImage(
//                     image: AssetImage('assets/img/woman.jpg'),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               Container(
//                 child: Container(
//                     padding: EdgeInsets.only(
//                         top: 10.0
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Sheromi',
//                           style: TextStyle(
//                             fontSize: 13.0,
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xFF0C1C33),
//                           ),
//                         ),
//                         Text(
//                           '1000 points',
//                           style: TextStyle(
//                             fontSize: 11.0,
//                             color: Color(0xFF0C1C33),
//                           ),
//                         ),
//                       ],
//                     )
//                 ),
//               )
//             ],
//           ),
//         ),
//         Container(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 width: 30.0,
//                 height: 30.0,
//                 margin: EdgeInsets.all(2.0),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(50)),
//                     image: DecorationImage(
//                         image: AssetImage('assets/img/hike.png'),
//                         fit: BoxFit.cover
//                     )
//                 ),
//               ),
//               Container(
//                 width: 30.0,
//                 height: 30.0,
//                 margin: EdgeInsets.all(2.0),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(50)),
//                     image: DecorationImage(
//                         image: AssetImage('assets/img/camp.png'),
//                         fit: BoxFit.cover
//                     )
//                 ),
//               ),
//               Container(
//                 width: 30.0,
//                 height: 30.0,
//                 margin: EdgeInsets.all(2.0),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(50)),
//                     image: DecorationImage(
//                         image: AssetImage('assets/img/surf.png'),
//                         fit: BoxFit.cover
//                     )
//                 ),
//               ),
//             ],
//           ),
//         )
//       ],
//     ),
//   ),
// ),
// Card(
//   elevation: 3.0,
//   margin: EdgeInsets.only(
//       left: 20.0,
//       right: 20.0,
//       bottom: 5.0
//   ),
//   shadowColor: Colors.black,
//   child: Container(
//     height: 60.0,
//     padding: EdgeInsets.only(
//         left: 10.0,
//         right: 10.0,
//         top: 6.0,
//         bottom: 5.0),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Container(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 width: 40.0,
//                 height: 40.0,
//                 margin: EdgeInsets.all(5.0),
//                 padding: EdgeInsets.only(
//                     left: 12.0,
//                     right: 10.0,
//                     top: 5.0),
//                 child: Text(
//                   '4',
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 25.0,
//                       color: Colors.yellow
//                   ),
//                 ),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(5.0)),
//                   color: Color(0xFF0C1C33),
//                 ),
//               ),
//               Container(
//                 width: 40.0,
//                 height: 40.0,
//                 margin: EdgeInsets.only(
//                     left: 5.0,
//                     right: 10.0),
//                 padding: EdgeInsets.all(2.0),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(50)),
//                   image: DecorationImage(
//                     image: AssetImage('assets/img/woman.jpg'),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               Container(
//                 child: Container(
//                     padding: EdgeInsets.only(
//                         top: 10.0
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Sheromi',
//                           style: TextStyle(
//                             fontSize: 13.0,
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xFF0C1C33),
//                           ),
//                         ),
//                         Text(
//                           '1000 points',
//                           style: TextStyle(
//                             fontSize: 11.0,
//                             color: Color(0xFF0C1C33),
//                           ),
//                         ),
//                       ],
//                     )
//                 ),
//               )
//             ],
//           ),
//         ),
//         Container(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 width: 30.0,
//                 height: 30.0,
//                 margin: EdgeInsets.all(2.0),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(50)),
//                     image: DecorationImage(
//                         image: AssetImage('assets/img/surf.png'),
//                         fit: BoxFit.cover
//                     )
//                 ),
//               ),
//               Container(
//                 width: 30.0,
//                 height: 30.0,
//                 margin: EdgeInsets.all(2.0),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(50)),
//                     image: DecorationImage(
//                         image: AssetImage('assets/img/camp.png'),
//                         fit: BoxFit.cover
//                     )
//                 ),
//               ),
//             ],
//           ),
//         )
//       ],
//     ),
//   ),
// ),
// GestureDetector(
//   onTap: () {
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => const Position())
//     );
//   },
//   child: Card(
//     color: Color(0x66FFD700),
//     elevation: 3.0,
//     margin: EdgeInsets.only(
//         left: 20.0,
//         right: 20.0,
//         bottom: 5.0
//     ),
//     shadowColor: Colors.black,
//     child: Container(
//       height: 60.0,
//       padding: EdgeInsets.only(
//           left: 10.0,
//           right: 10.0,
//           top: 6.0,
//           bottom: 5.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Container(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   width: 40.0,
//                   height: 40.0,
//                   margin: EdgeInsets.all(5.0),
//                   padding: EdgeInsets.only(
//                       left: 12.0,
//                       right: 10.0,
//                       top: 5.0),
//                   child: Text(
//                     '5',
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 25.0,
//                         color: Colors.yellow
//                     ),
//                   ),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(5.0)),
//                     color: Color(0xFF0C1C33),
//                   ),
//                 ),
//                 Container(
//                   width: 40.0,
//                   height: 40.0,
//                   margin: EdgeInsets.only(
//                       left: 5.0,
//                       right: 10.0),
//                   padding: EdgeInsets.all(2.0),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(50)),
//                     image: DecorationImage(
//                       image: AssetImage('assets/img/woman.jpg'),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   child: Container(
//                       padding: EdgeInsets.only(
//                           top: 10.0
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Good Luck on your achivement!',
//                             style: TextStyle(
//                               fontSize: 9.0,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.red,
//                             ),
//                           ),
//                           Text(
//                             'Sheromi',
//                             style: TextStyle(
//                               fontSize: 13.0,
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xFF0C1C33),
//                             ),
//                           ),
//                           Text(
//                             '1000 points',
//                             style: TextStyle(
//                               fontSize: 11.0,
//                               color: Color(0xFF0C1C33),
//                             ),
//                           ),
//                         ],
//                       )
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Container(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   width: 30.0,
//                   height: 30.0,
//                   margin: EdgeInsets.all(2.0),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(50)),
//                       image: DecorationImage(
//                           image: AssetImage('assets/img/camp.png'),
//                           fit: BoxFit.cover
//                       )
//                   ),
//                 ),
//                 Container(
//                   width: 30.0,
//                   height: 30.0,
//                   margin: EdgeInsets.all(2.0),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(50)),
//                       image: DecorationImage(
//                           image: AssetImage('assets/img/hike.png'),
//                           fit: BoxFit.cover
//                       )
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     ),
//
//   ),
// ),
// Card(
//   elevation: 3.0,
//   margin: EdgeInsets.only(
//       left: 20.0,
//       right: 20.0,
//       bottom: 5.0
//   ),
//   shadowColor: Colors.black,
//   child: Container(
//     height: 60.0,
//     padding: EdgeInsets.only(
//         left: 10.0,
//         right: 10.0,
//         top: 6.0,
//         bottom: 5.0),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Container(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 width: 40.0,
//                 height: 40.0,
//                 margin: EdgeInsets.all(5.0),
//                 padding: EdgeInsets.only(
//                     left: 12.0,
//                     right: 10.0,
//                     top: 5.0),
//                 child: Text(
//                   '6',
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 25.0,
//                       color: Colors.yellow
//                   ),
//                 ),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(5.0)),
//                   color: Color(0xFF0C1C33),
//                 ),
//               ),
//               Container(
//                 width: 40.0,
//                 height: 40.0,
//                 margin: EdgeInsets.only(
//                     left: 5.0,
//                     right: 10.0),
//                 padding: EdgeInsets.all(2.0),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(50)),
//                   image: DecorationImage(
//                     image: AssetImage('assets/img/woman.jpg'),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               Container(
//                 child: Container(
//                     padding: EdgeInsets.only(
//                         top: 10.0
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Sheromi',
//                           style: TextStyle(
//                             fontSize: 13.0,
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xFF0C1C33),
//                           ),
//                         ),
//                         Text(
//                           '1000 points',
//                           style: TextStyle(
//                             fontSize: 11.0,
//                             color: Color(0xFF0C1C33),
//                           ),
//                         ),
//                       ],
//                     )
//                 ),
//               )
//             ],
//           ),
//         ),
//         Container(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 width: 30.0,
//                 height: 30.0,
//                 margin: EdgeInsets.all(2.0),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(50)),
//                     image: DecorationImage(
//                         image: AssetImage('assets/img/camp.png'),
//                         fit: BoxFit.cover
//                     )
//                 ),
//               ),
//               Container(
//                 width: 30.0,
//                 height: 30.0,
//                 margin: EdgeInsets.all(2.0),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(50)),
//                     image: DecorationImage(
//                         image: AssetImage('assets/img/surf.png'),
//                         fit: BoxFit.cover
//                     )
//                 ),
//               ),
//             ],
//           ),
//         )
//       ],
//     ),
//   ),
// ),