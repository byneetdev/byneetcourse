// import 'package:byneetcourseapp/src/modules/course/models/course_model_purin.dart';
// import 'package:byneetcourseapp/src/modules/login/services/login_service.dart';
// import 'package:byneetcourseapp/src/modules/myCourse/mycourse_service.dart';
// import 'package:byneetcourseapp/src/modules/nodata_container.dart';
// import 'package:flutter/material.dart';
// import 'package:percent_indicator/linear_percent_indicator.dart';
// import 'package:provider/provider.dart';

// import '../../loading_container.dart';

// class KelaskuWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final user = Provider.of<LoginService>(context);
//     final mycourseServ = MycourseService(user.user.uid);
//     return FutureBuilder<List<CourseModel>>(
//         future: mycourseServ.getCollection(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState != ConnectionState.done)
//             return LoadingContainer();
//           if (!snapshot.hasData) return NoDataContainer();
//           return ListView.builder(
//             itemCount: 3,
//             shrinkWrap: true,
//             scrollDirection: Axis.vertical,
//             physics: BouncingScrollPhysics(),
//             itemBuilder: (BuildContext context, int index) {
//               return Card(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(16.0),
//                   // side:
//                 ),
//                 color: Color(0xFFD2E0EF),
//                 margin: EdgeInsets.only(bottom: 20),
//                 elevation: 8,
//                 child: ClayContainer(
//                   borderRadius: 16,
//                   color: Color(0xFFD2E0EF),
//                   child: Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: 110.0,
//                     child: Row(
//                       children: <Widget>[
//                         Container(
//                           width: 110.0,
//                           height: 110.0,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(16.0),
//                               image: DecorationImage(
//                                 image: AssetImage("images/gambar1.jpg"),
//                                 fit: BoxFit.cover,
//                               )),
//                         ),
//                         SizedBox(width: 10),
//                         Expanded(
//                           child: Padding(
//                             padding: const EdgeInsets.all(10.0),
//                             child: ClayContainer(
//                               borderRadius: 16,
//                               color: Color(0xFFD2E0EF),
//                               emboss: true,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: <Widget>[
//                                   Text(
//                                     "Full-Stack Web Developer Guide for Beginner",
//                                     overflow: TextOverflow.ellipsis,
//                                     maxLines: 2,
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 15.0,
//                                       color: Color(0xFF15140D),
//                                     ),
//                                   ),
//                                   SizedBox(height: 5),
//                                   Text(
//                                     "Dicky Reynaldi, Ph.D",
//                                     overflow: TextOverflow.ellipsis,
//                                     style: TextStyle(
//                                       // fontWeight: FontWeight.bold,
//                                       color: Color(0xFF83867C),
//                                       fontSize: 14.0,
//                                     ),
//                                   ),
//                                   SizedBox(height: 5),
//                                   LinearPercentIndicator(
//                                     animation: true,
//                                     lineHeight: 10.0,
//                                     animationDuration: 1000,
//                                     percent: 0.8,
//                                     linearStrokeCap: LinearStrokeCap.roundAll,
//                                     progressColor: Color(0xFFFB1002),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           );
//         });
//   }
// }
