// import 'package:flutter/material.dart';

// class SubTheoryWidget extends StatelessWidget {
//   final String title;
//   final Function onTap;
//   bool isComplete = false;
//   SubTheoryWidget({
//     @required this.title,
//     this.isComplete,
//     @required this.onTap,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: Container(
//         color: Color(0xFFD2E0EF),
//         width: 35,
//         height: 35,
//         child: isComplete
//             ? IconButton(
//                 icon: Icon(Icons.done),
//                 onPressed: onTap,
//                 iconSize: 20,
//                 color: Color(0xFFFB1002),
//               )
//             : IconButton(
//                 icon: Icon(Icons.play_arrow),
//                 onPressed: onTap,
//                 color: Color(0xFFFB1002),
//                 iconSize: 20,
//               ),
//       ),
//       title: Container(
//         color: Color(0xFFD2E0EF),
//         width: 50,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text(
//             title,
//             overflow: TextOverflow.ellipsis,
//             style: TextStyle(
//               fontSize: 15,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
