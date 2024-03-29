// import 'package:flutter/material.dart';
// import 'package:ourESchool/UI/Utility/constants.dart';
// import 'package:ourESchool/UI/Utility/ui_helpers.dart';
// import 'package:ourESchool/UI/Widgets/ColumnReusableCardButton.dart';
// import 'package:ourESchool/UI/Utility/Resources.dart';
// import 'package:ourESchool/UI/pages/Dashboard/Assignment/AssignmentPage.dart';
// import 'package:ourESchool/UI/pages/Dashboard/E-Card/E-CardPage.dart';
// import 'package:ourESchool/UI/pages/Dashboard/Fees/create_fees.dart';
// import 'package:ourESchool/UI/pages/Dashboard/Fees/fees_page_dashboard.dart';
// import 'package:ourESchool/UI/pages/feed/feed_page.dart';
// import 'package:ourESchool/UI/resources/colors.dart';
// import 'package:ourESchool/core/Models/User.dart';
// import 'package:ourESchool/core/Models/fees/fees_model.dart';
// import 'package:ourESchool/imports.dart';

// class BottomSheetChildrensWidget extends StatefulWidget {
//   const BottomSheetChildrensWidget({Key key, this.user, this.fees})
//       : super(key: key);

//   final User user;
//   final Fees fees;

//   @override
//   _BottomSheetChildrensWidgetState createState() =>
//       _BottomSheetChildrensWidgetState();
// }

// class _BottomSheetChildrensWidgetState extends State<BottomSheetChildrensWidget>
//     with Services {
//   bool isTeacher = false;

//   @override
//   Widget build(BuildContext context) {
//     var userType = Provider.of<UserType>(context, listen: false);
//     if (userType == UserType.TEACHER) {
//       isTeacher = true;
//     }

//     return SafeArea(
//       child: Container(
//         height: 300,
//         margin: EdgeInsets.only(left: 18, right: 18),
//         decoration: BoxDecoration(
//           color:
//               isThemeCurrentlyDark(context) ? MyColors.dark : MyColors.accent,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(18),
//             topRight: Radius.circular(18),
//             bottomRight: Radius.circular(5),
//             bottomLeft: Radius.circular(5),
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(7.0),
//           child: Column(
//             // mainAxisAlignment: MainAxisAlignment.start,
//             children: <Widget>[
//               Expanded(
//                 child: ColumnReusableCardButton(
//                   // height: 65,
//                   tileColor: Colors.orangeAccent,
//                   label: string.announcement,
//                   icon: FontAwesomeIcons.speakap,
//                   onPressed: () {
//                     kopenPage(
//                       context,
//                       //todo create a good page for feed of specific student
//                       FeedPage(
//                         announcementFor: widget.user.standard +
//                             widget.user.division.toUpperCase(),
//                       ),
//                       'Announcement_Page',
//                     );
//                   },
//                 ),
//               ),
//               Expanded(
//                 child: ColumnReusableCardButton(
//                   tileColor: Colors.lightGreen,
//                   label: string.assignment,
//                   onPressed: () {
//                     kopenPage(
//                         context,
//                         AssignmentsPage(
//                           standard: widget.user.standard +
//                               widget.user.division.toUpperCase(),
//                         ),
//                         'Assignments_Page');
//                   },
//                   icon: Icons.assignment,
//                 ),
//               ),
//               // SizedBox(
//               //   height: 5,
//               // ),
//               Expanded(
//                 child: ColumnReusableCardButton(
//                   // height: 65,
//                   tileColor: MyColors.twitter,
//                   label: string.e_card,
//                   onPressed: () {
//                     kopenPage(
//                         context,
//                         ECardPage(
//                           user: widget.user,
//                         ),
//                         'ECard_Page');
//                   },
//                   icon: Icons.perm_contact_calendar,
//                 ),
//               ),
//               Visibility(
//                 visible: isTeacher,
//                 child: Expanded(
//                   child: ColumnReusableCardButton(
//                     // height: 65,
//                     tileColor: Colors.deepOrangeAccent,
//                     label: 'Fees',
//                     onPressed: () {
//                       kopenPage(
//                         context,
//                         FeesPageEntry(
//                           user: widget.user,
//                           //targeteid: widget.user.id,
//                         ),
//                         'Fees_Page_Entry',
//                       );
//                     },
//                     icon: Icons.payment,
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: ColumnReusableCardButton(
//                   // height: 65,
//                   tileColor: Colors.deepOrangeAccent,
//                   label: 'Fees View',
//                   onPressed: () {
//                     kopenPage(
//                       context,
//                       FeesPageDash(
//                         student: widget.user,
//                       ),
//                       'Fees_Page',
//                     );
//                     // analytics.logSelectContent(
//                     //     contentType: 'Fees Page Dashboard', itemId: null);
//                   },
//                   icon: Icons.equalizer,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // class DecoratedTextFieldd extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       height: 50,
// //       alignment: Alignment.center,
// //       padding: const EdgeInsets.all(10),
// //       margin: const EdgeInsets.all(10),
// //       decoration: BoxDecoration(
// //         color: Colors.grey[300],
// //         borderRadius: BorderRadius.circular(10),
// //       ),
// //       child: TextField(
// //         decoration:
// //             InputDecoration.collapsed(hintText: 'Enter your reference number'),
// //       ),
// //     );
// //   }
// // }
