// import 'package:eva_icons_flutter/eva_icons_flutter.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:ourESchool/UI/Utility/ui_helpers.dart';
// import 'package:ourESchool/UI/Widgets/good_tile.dart';
// import 'package:ourESchool/UI/resources/colors.dart';
// import 'package:ourESchool/UI/resources/text_styles.dart';
// import 'package:ourESchool/UI/Utility/Resources.dart';
// import 'package:ourESchool/core/Models/fees/fees_model.dart';

// class FeesViewer extends StatelessWidget {
//   final Fees fees;

//   const FeesViewer({Key key, this.fees}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     print('the fees coming from server is $fees'.toString());
//     return Scaffold(
//       backgroundColor: invertInvertColorsStrong(context),
//       body: Container(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             Padding(
//               padding: EdgeInsets.only(
//                 left: 10.0,
//                 top: 50.0,
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: <Widget>[
//                   IconButton(
//                     icon: Icon(EvaIcons.arrowIosBack),
//                     tooltip: 'Go back',
//                     color: invertColorsStrong(context),
//                     iconSize: 26.0,
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                   ),
//                   Material(
//                     color: Colors.transparent,
//                     child: Center(
//                       child: Text(
//                         string.fees,
//                         style: isThemeCurrentlyDark(context)
//                             ? TitleStylesDefault.white
//                             : TitleStylesDefault.black,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: ListView(
//                 physics: BouncingScrollPhysics(),
//                 children: <Widget>[
//                   GoodTile(
//                     child: Padding(
//                       padding: EdgeInsets.all(20.0),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: <Widget>[
//                           Text(
//                             fees.description,
//                             style: HeadingStylesDefault.accent,
//                             textAlign: TextAlign.center,
//                             softWrap: true,
//                             overflow: TextOverflow.fade,
//                           ),
//                           SizedBox(
//                             height: 20.0,
//                           ),
//                           Text(
//                             fees.description,
//                             style: isThemeCurrentlyDark(context)
//                                 ? BodyStylesDefault.white
//                                 : BodyStylesDefault.black,
//                             textAlign: TextAlign.left,
//                             softWrap: true,
//                             overflow: TextOverflow.fade,
//                           ),
//                         ],
//                       ),
//                     ),
//                     splashColor: MyColors.accent,
//                   ),
//                   GoodTile(
//                     child: Padding(
//                       padding: EdgeInsets.all(20.0),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: <Widget>[
//                           Text(
//                             fees.description,
//                             style: HeadingStylesDefault.accent,
//                             textAlign: TextAlign.center,
//                             softWrap: true,
//                             overflow: TextOverflow.fade,
//                           ),
//                           SizedBox(
//                             height: 20.0,
//                           ),
//                           Text(
//                             fees.description,
//                             style: isThemeCurrentlyDark(context)
//                                 ? BodyStylesDefault.white
//                                 : BodyStylesDefault.black,
//                             textAlign: TextAlign.left,
//                             softWrap: true,
//                             overflow: TextOverflow.fade,
//                           ),
//                         ],
//                       ),
//                     ),
//                     splashColor: MyColors.accent,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
