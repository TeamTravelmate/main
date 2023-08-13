// import 'package:flutter/material.dart';
// import '../../themes/colors.dart';
// import '../../widgets/button_widget.dart';
// import 'tripView_page.dart';

// // ignore: camel_case_types
// class publicTripView extends StatelessWidget {
//   const publicTripView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.only(top: 30.0, left: 10, right: 10),
//         child: Expanded(
//           child: Column(
//             children: [
//               Stack(
//                 children: <Widget>[
//                   Container(
//                       alignment: Alignment.center,
//                       child: Image.asset(
//                         'assets/galle public.png',
//                         width: double.infinity,
//                         fit: BoxFit.cover,
//                       )),
//                   Container(
//                     child: const Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: CircleAvatar(
//                         backgroundColor: ColorsTravelMate.tertiary,
//                         child: Icon(
//                           Icons.arrow_back_ios_new_rounded,
//                           color: ColorsTravelMate.primary,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.only(top: 250.0),
//                     child: tripCard(),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 children: [
//                   const Text('Start in:   ', style: TextStyle(fontSize: 20)),
//                   Container(
//                     height: 65,
//                     width: 65,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: ColorsTravelMate.secundary,
//                     ),
//                     child: const Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Text(
//                           '05',
//                           style: TextStyle(
//                               color: ColorsTravelMate.tertiary,
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         Text(
//                           'Days',
//                           style: TextStyle(
//                             color: ColorsTravelMate.tertiary,
//                             fontSize: 16,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(width: 4),
//                   Container(
//                     height: 65,
//                     width: 65,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: ColorsTravelMate.secundary,
//                     ),
//                     child: const Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Text(
//                           '12',
//                           style: TextStyle(
//                               color: ColorsTravelMate.tertiary,
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         Text(
//                           'Hours',
//                           style: TextStyle(
//                             color: ColorsTravelMate.tertiary,
//                             fontSize: 16,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(width: 4),
//                   Container(
//                     height: 65,
//                     width: 65,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: ColorsTravelMate.secundary,
//                     ),
//                     child: const Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Text(
//                           '30',
//                           style: TextStyle(
//                               color: ColorsTravelMate.tertiary,
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         Text(
//                           'Mins',
//                           style: TextStyle(
//                             color: ColorsTravelMate.tertiary,
//                             fontSize: 16,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(width: 4),
//                   Container(
//                     height: 65,
//                     width: 65,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: ColorsTravelMate.secundary,
//                     ),
//                     child: const Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Text(
//                           '10',
//                           style: TextStyle(
//                               color: ColorsTravelMate.tertiary,
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         Text(
//                           'Sec',
//                           style: TextStyle(
//                             color: ColorsTravelMate.tertiary,
//                             fontSize: 16,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 200),
//               buttonWidget(
//                   width: 200, labelText: 'Join Tour', path: joinedTripView())
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // ignore: camel_case_types
// class tripCard extends StatelessWidget {
//   const tripCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: SizedBox(
//         height: 150,
//         width: double.infinity,
//         child: ListTile(
//           title: const Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'Galle - Kandy\n',
//                 style: TextStyle(
//                   fontSize: 20,
//                   color: ColorsTravelMate.primary,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Row(
//                 children: [
//                   Icon(
//                     Icons.favorite_border_rounded,
//                     color: ColorsTravelMate.primary,
//                   ),
//                   Icon(
//                     Icons.file_upload_outlined,
//                     color: ColorsTravelMate.primary,
//                   ),
//                   Icon(
//                     Icons.more_horiz_outlined,
//                     color: ColorsTravelMate.primary,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           subtitle: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Row(
//                     children: [
//                       Icon(
//                         Icons.location_on_rounded,
//                         color: ColorsTravelMate.primary,
//                       ),
//                       Text(
//                         '  Galle Fort, Unawatuna Beach',
//                         style: TextStyle(color: ColorsTravelMate.primary),
//                       ),
//                     ],
//                   ),
//                   const Row(
//                     children: [
//                       Icon(
//                         Icons.calendar_month,
//                         color: ColorsTravelMate.primary,
//                       ),
//                       Text(
//                         '  July 3, 2023 - July 6, 2023 (3 days)',
//                         style: TextStyle(color: ColorsTravelMate.primary),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       const Icon(
//                         Icons.supervised_user_circle_sharp,
//                         color: ColorsTravelMate.primary,
//                       ),
//                       Image.asset(
//                         'assets/profile.png',
//                         width: 20,
//                         height: 20,
//                       ),
//                       const Text(
//                         '  Kumar & 5 others',
//                         style: TextStyle(color: ColorsTravelMate.primary),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 40.0),
//                 child: FloatingActionButton.small(
//                     onPressed: () {},
//                     backgroundColor: ColorsTravelMate.tertiary,
//                     shape: const CircleBorder(
//                         side: BorderSide(color: ColorsTravelMate.primary)),
//                     child: const Icon(
//                       Icons.map_outlined,
//                       color: ColorsTravelMate.primary,
//                     )),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
