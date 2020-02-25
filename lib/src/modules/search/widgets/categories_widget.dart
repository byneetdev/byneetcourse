// import 'package:flutter/material.dart';

// class CategoriesWidget extends StatelessWidget {
//   final String categoriesTitle;
//   final Function onTap;
//   final String urlimage;
//   CategoriesWidget(
//       {@required this.categoriesTitle,
//       @required this.onTap,
//       @required this.urlimage});
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         margin: EdgeInsets.only(bottom: 13.0),
//         child: Row(
//           children: <Widget>[
//             //icon data nya
//             ClayContainer(
//               color: Color(0xFFD2E0EF),
//               height: 45,
//               width: 45,
//               borderRadius: 50,
//               child: Padding(
//                 padding: const EdgeInsets.all(5.0),
//                 child: CircleAvatar(
//                   backgroundColor: Colors.transparent,
//                   backgroundImage: AssetImage(urlimage),
//                 ),
//               ),
//             ),
//             SizedBox(width: 10),
//             Text(
//               categoriesTitle,
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(
//                 fontSize: 16.0,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
