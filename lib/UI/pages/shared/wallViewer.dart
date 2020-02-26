import 'package:ourESchool/UI/Utility/constants.dart';
import 'package:ourESchool/UI/Widgets/swipedetector.dart';
import 'package:flutter/material.dart';
import 'package:ourESchool/core/Models/school_wall/wall_model.dart';

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
                    Expanded(
                      flex: 1,
                      child: SingleChildScrollView(
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
