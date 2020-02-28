import 'package:ourESchool/UI/Utility/Resources.dart';
import 'package:ourESchool/UI/Utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:ourESchool/core/Models/User.dart';
import 'package:ourESchool/core/Models/school_wall/wall_model.dart';
import 'package:ourESchool/core/enums/UserType.dart';
import 'package:ourESchool/core/viewmodel/ProfilePageModel.dart';
import 'package:ourESchool/locator.dart';
import 'package:ourESchool/UI/pages/shared/wall_viewer.dart';

class WallCard extends StatefulWidget {
  WallCard({@required this.wall});

  final Wall wall;

  @override
  _WallCardState createState() => _WallCardState();
}

class _WallCardState extends State<WallCard> {
  final ProfilePageModel model = locator<ProfilePageModel>();

  User user = User();
  bool loading = true;

  getUserData() async {
    loading = true;
    user = await model.getUserProfileDataByIdForAnnouncement(
        UserType.TEACHER, widget.wall.by);
    loading = false;
    if (mounted) setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
      child: Card(
        elevation: 4,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              // color: Colors.red[200],
              height: 60,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      //User profile image section
                      loading
                          ? CircleAvatar(
                              radius: 25.0,
                              backgroundImage:
                                  AssetImage(assetsString.teacher_welcome),
                              backgroundColor: Colors.transparent,
                            )
                          : CircleAvatar(
                              radius: 25.0,
                              backgroundImage: user.photoUrl == 'default'
                                  ? AssetImage(assetsString.teacher_welcome)
                                  : NetworkImage(user.photoUrl),
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
                            loading ? 'Loading...' : user.displayName,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //Announcemnet image Section
            Card(
              elevation: 4,
              child: Container(
                constraints: BoxConstraints(maxHeight: 300, minHeight: 0),
                width: MediaQuery.of(context).size.width,
                child: Hero(
                  transitionOnUserGestures: true,
                  tag: widget.wall.id + 'photo',
                  child: Material(
                    child: InkWell(
                      onTap: () {
                        kopenPageBottom(
                          context,
                          WallViewer(
                            wall: widget.wall,
                          ),
                        );
                      },
                      child: widget.wall.photoUrl == ''
                          ? Container(
                              height: 0,
                            )
                          : Image(
                              fit: BoxFit.contain,
                              image: NetworkImage(
                                widget.wall.photoUrl,
                              ),
                            ),
                    ),
                  ),
                ),
              ),
            ),
            //Caption Section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                constraints: BoxConstraints(maxHeight: 80, minHeight: 10),
                width: MediaQuery.of(context).size.width,
                child: Hero(
                  transitionOnUserGestures: false,
                  tag: widget.wall.id + 'captions',
                  child: Text(
                    widget.wall.schoolName,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future buildShowDialogBox(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Announcement Type"),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Card(
                  shape: kCardCircularShape,
                  elevation: 4,
                  child: CircleAvatar(
                    backgroundColor: ThemeData().canvasColor,
                    child: Text(
                      'C',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Text('CIRCULAR')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Card(
                  shape: kCardCircularShape,
                  elevation: 4,
                  child: CircleAvatar(
                    backgroundColor: ThemeData().canvasColor,
                    child: Text(
                      'E',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Text('EVENT')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Card(
                  shape: kCardCircularShape,
                  elevation: 4,
                  child: CircleAvatar(
                    backgroundColor: ThemeData().canvasColor,
                    child: Text(
                      'A',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Text('ACTIVITY')
              ],
            ),
          ],
        ),
        actions: <Widget>[],
      );
    },
  );
}
