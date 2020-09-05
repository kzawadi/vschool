import 'package:cached_network_image/cached_network_image.dart';
import 'package:ourESchool/UI/Utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:ourESchool/UI/resources/customWidgets.dart';
import 'package:ourESchool/core/Models/User.dart';
import 'package:ourESchool/imports.dart';

class ChildrenGridViewCard extends StatelessWidget {
  final User user;
  final Function onTap;

  ChildrenGridViewCard({
    this.onTap,
    @required this.user,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool registerd = user.id == '' ? false : true;
    return SafeArea(
      // constraints: BoxConstraints(maxHeight: 100, maxWidth: 100),
      child: InkWell(
        enableFeedback: true,
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(2),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            elevation: 1,
            child: Stack(
              children: <Widget>[
                Hero(
                    tag: user.firebaseUuid,
                    transitionOnUserGestures: true,
                    child: customNetworkImage(user.photoUrl)),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      borderRadius: new BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0)),
                    ),
                    child: Column(
                      children: <Widget>[
                        Text(
                          // user.displayName,
                          //this showd Not registerd in the list of children
                          //becouse it had a boolean which was true when
                          //firebase uid was there but we have changed our model
                          //.....................
                          registerd ? user.displayName : "Not Registered Yet",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .button
                              .copyWith(color: Colors.white),
                        ),
                        Text(
                          registerd
                              ? user.standard + '-' + user.division
                              : user.id,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: Colors.white),
                        ),
                      ],
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

  ImageProvider<dynamic> setImage(User user) {
    if (user.photoUrl.contains('https')) {
      return NetworkImage(user.photoUrl);
    } else {
      return AssetImage(assetsString.student_welcome);
    }
  }
}
