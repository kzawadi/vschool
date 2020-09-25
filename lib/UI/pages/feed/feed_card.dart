import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ourESchool/UI/Utility/Resources.dart';
import 'package:ourESchool/UI/Utility/constants.dart';
import 'package:ourESchool/UI/Utility/ui_helpers.dart';
import 'package:ourESchool/UI/pages/feed/announcement_owner.dart';
import 'package:ourESchool/UI/pages/feed/feed_Viewer.dart';
import 'package:ourESchool/UI/pages/feed/tweetImage.dart';
import 'package:ourESchool/UI/resources/colors.dart';
import 'package:ourESchool/UI/resources/customWidgets.dart';
import 'package:ourESchool/core/enums/UserType.dart';
import 'package:ourESchool/imports.dart';
import 'package:stacked/stacked.dart';

class FeedCard extends StatelessWidget {
  FeedCard({
    Key key,
    this.feed,
  }) : super(key: key);

  final Announcement feed;
  // final feed feed;
  bool isAteacher = false;

  @override
  Widget build(BuildContext context) {
    var userType = Provider.of<UserType>(context, listen: false);
    if (userType == UserType.TEACHER) {
      isAteacher = true;
    }
    return ViewModelBuilder.reactive(
      disposeViewModel: false,
      createNewModelOnInsert: false,
      onModelReady: (model) => model.futureToRun(),
      viewModelBuilder: () => OwnerViewModel(UserType.TEACHER, feed.by),
      builder: (context, model, child) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
        child: InkWell(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                height: 60,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Hero(
                      transitionOnUserGestures: false,
                      tag: feed.id + 'row',
                      child: Row(
                        children: <Widget>[
                          //User profile image section
                          model.isBusy
                              ? CircleAvatar(
                                  radius: 25.0,
                                  backgroundImage:
                                      AssetImage(assetsString.teacher_welcome),
                                  backgroundColor: Colors.transparent,
                                )
                              : CircleAvatar(
                                  radius: 25.0,
                                  backgroundImage: model.data.photoUrl ==
                                          'default'
                                      ? AssetImage(assetsString.teacher_welcome)
                                      : customAdvanceNetworkImage(
                                          model.data.photoUrl),
                                  backgroundColor: Colors.transparent,
                                ),
                          SizedBox(
                            width: 5,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              //feed by section
                              model.isBusy
                                  ? Text('Loading...')
                                  : Text(
                                      model.data.displayName,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15,
                                      ),
                                    ),
                              // TimeStamp section
                              Text(
                                // 'data',
                                DateFormat("MMM d, E").add_jm().format(
                                    DateTime.parse(feed.timestamp
                                        .toDate()
                                        .toLocal()
                                        .toString())),
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    fontSize: 12.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    //feed Type section
                    Visibility(
                      visible: feed.type == null ? false : true,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              // print(feed.timestamp.toString());
                              buildShowDialogBox(context);
                            },
                            child: Card(
                              shape: kCardCircularShape,
                              elevation: 1,
                              child: CircleAvatar(
                                backgroundColor: isThemeCurrentlyDark(context)
                                    ? ShadowColors.light
                                    : MyColors.blakwhitish,
                                child: Text(
                                  feed.type
                                      .toString()
                                      .substring(
                                          feed.type.toString().indexOf('.') + 1)
                                      .substring(0, 1),
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      color: isThemeCurrentlyDark(context)
                                          ? MyColors.accent
                                          : MyColors.black,
                                      fontSize: 12.5,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              FeedImage(feed: feed),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  constraints: BoxConstraints(maxHeight: 80, minHeight: 10),
                  width: MediaQuery.of(context).size.width,
                  child: Hero(
                    transitionOnUserGestures: false,
                    tag: feed.id + 'caption',
                    child: AutoSizeText(
                      feed.caption,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      minFontSize: 16,
                      maxFontSize: 16,
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          onTap: () {
            kopenPageBottom(
              context,
              FeedViewer(
                feed: feed,
              ),
            );
          },
        ),
      ),
    );
  }
}

//todo remember to implement a UI to tell about the types of feed
//thinking of Emergency or school type situations

Future buildShowDialogBox(BuildContext context) {
  double elavation = 1;
  double fontSize = 15;
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        backgroundColor: Theme.of(context).colorScheme.primaryVariant,
        title: Text(
          "feed Type",
          style: TextStyle(
            fontSize: 22,
            color: Theme.of(context).accentColor,
          ),
        ),
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
                  elevation: elavation,
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColorLight,
                    child: Text(
                      'C',
                      style: GoogleFonts.roboto(
                        color: Theme.of(context).primaryColor,
                        textStyle: TextStyle(
                          fontSize: 12.5,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  'CIRCULAR',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: fontSize,
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Card(
                  shape: kCardCircularShape,
                  elevation: elavation,
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColorLight,
                    child: Text(
                      'E',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 12.5,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  'EVENT',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: fontSize,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Card(
                  shape: kCardCircularShape,
                  elevation: elavation,
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColorLight,
                    child: Text(
                      'A',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 12.5,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  'ACTIVITY',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: fontSize,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
        actions: <Widget>[],
      );
    },
  );
}
