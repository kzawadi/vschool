import 'package:ourESchool/UI/Utility/constants.dart';
import 'package:ourESchool/UI/Widgets/swipedetector.dart';
import 'package:flutter/material.dart';
import 'package:ourESchool/UI/resources/colors.dart';
import 'package:ourESchool/core/Models/school_wall/wall_model.dart';
import 'package:ourESchool/UI/Utility/ui_helpers.dart';
import 'package:ourESchool/UI/Widgets/sexy_tile.dart';

class WallViewer extends StatelessWidget {
  final Wall wall;

  const WallViewer({Key key, this.wall}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SwipeDetector(
      onSwipeDown: () {
        Navigator.pop(context);
      },
      onSwipeRight: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        body: Container(
          child: SafeArea(
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Hero(
                      transitionOnUserGestures: true,
                      tag: wall.id + 'photo',
                      child: Image(
                        fit: BoxFit.contain,
                        image: NetworkImage(
                          wall.photoUrl,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Hero(
                        transitionOnUserGestures: false,
                        tag: wall.id + 'roww',
                        child: Row(
                          children: <Widget>[
                            //User profile image section
                            CircleAvatar(
                              radius: 25.0,
                              backgroundImage: NetworkImage(
                                'https://www.searchpng.com/wp-content/uploads/2019/02/Deafult-Profile-Pitcher.png',
                              ),
                              backgroundColor: Colors.transparent,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                //Announcement by section
                                Text(
                                  wall.by,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    SexyTile(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              wall.caption,
                              //style: HeadingStylesDefault.accent,
                              textAlign: TextAlign.center,
                              softWrap: true,
                              overflow: TextOverflow.fade,
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(wall.caption
                                // style: isThemeCurrentlyDark(context)
                                //     ? BodyStylesDefault.white
                                //     : BodyStylesDefault.black,
                                // textAlign: TextAlign.left,
                                //softWrap: true,
                                //overflow: TextOverflow.fade,
                                ),
                          ],
                        ),
                      ),
                      splashColor: MyColors.accent,
                    ),

                    Expanded(
                      flex: 1,
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, bottom: 5.0, top: 5),
                          child: Hero(
                            transitionOnUserGestures: false,
                            tag: wall.id + 'captionn',
                            child: Text(
                              wall.caption,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    /// mission view
                    Expanded(
                      flex: 1,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, bottom: 5.0, top: 5),
                          child: Hero(
                            transitionOnUserGestures: false,
                            tag: wall.id + 'mission',
                            child: Text(
                              wall.mission,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, bottom: 5.0, top: 5),
                          child: Hero(
                            transitionOnUserGestures: false,
                            tag: wall.id + 'beliefs',
                            child: Text(
                              wall.beliefs,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, bottom: 5.0, top: 5),
                          child: Hero(
                            transitionOnUserGestures: false,
                            tag: wall.id + 'history',
                            child: Text(
                              wall.history,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, bottom: 5.0, top: 5),
                          child: Hero(
                            transitionOnUserGestures: false,
                            tag: wall.id + 'location',
                            child: Text(
                              wall.location,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, bottom: 5.0, top: 5),
                          child: Hero(
                            transitionOnUserGestures: false,
                            tag: wall.id + 'regNo',
                            child: Text(
                              wall.regNo,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, bottom: 5.0, top: 5),
                          child: Hero(
                            transitionOnUserGestures: false,
                            tag: wall.id + 'dirSms',
                            child: Text(
                              wall.dirSms,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, bottom: 5.0, top: 5),
                          child: Hero(
                            transitionOnUserGestures: false,
                            tag: wall.id + 'contacts',
                            child: Text(
                              wall.contacts,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  left: -0,
                  top: -0,
                  child: Card(
                    elevation: 10,
                    shape: kCardCircularShape,
                    child: MaterialButton(
                      minWidth: 20,
                      height: 10,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
