import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ourESchool/UI/Utility/Resources.dart';
import 'package:ourESchool/UI/Utility/constants.dart';
import 'package:ourESchool/UI/Utility/ui_helpers.dart';
import 'package:ourESchool/UI/pages/feed/feed_Viewer.dart';
import 'package:ourESchool/UI/resources/colors.dart';
import 'package:ourESchool/core/enums/UserType.dart';
import 'package:ourESchool/imports.dart';

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
    return Padding(
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
                        CircleAvatar(
                          radius: 25.0,
                          backgroundImage: feed.createrPhotoUrl == null ||
                                  feed.createrPhotoUrl == ''
                              ? AssetImage(assetsString.teacher_welcome)
                              : NetworkImage(feed.createrPhotoUrl),
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
                            Text(
                              feed.by,
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
            Container(
              constraints: BoxConstraints(maxHeight: 300, minHeight: 0),
              width: MediaQuery.of(context).size.width,
              child: Hero(
                transitionOnUserGestures: true,
                tag: feed.id + 'photo',
                child: Material(
                  child: InkWell(
                    onTap: () {
                      kopenPageBottom(
                        context,
                        FeedViewer(
                          feed: feed,
                        ),
                      );
                    },
                    child: feed.photoUrl == null
                        ? Container(
                            height: 0,
                          )
                        : CachedNetworkImage(
                            fit: BoxFit.contain,
                            imageUrl: feed.photoUrl,
                            placeholder: (context, url) => kBuzyPage(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            fadeOutDuration: const Duration(microseconds: 200),
                            fadeInDuration: const Duration(microseconds: 200),
                          ),
                  ),
                ),
              ),
            ),
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
    );
    // );
  }
}

//todo remember to implement a UI to tell about the types of feed
//thinking of Emergency or school type situations

Future buildShowDialogBox(BuildContext context) {
  double elavation = 1;
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        backgroundColor:
            isThemeCurrentlyDark(context) ? MyColors.lightMilky : MyColors.okay,
        title: Text(
          "feed Type",
          style: TextStyle(
            fontSize: 22,
            color: isThemeCurrentlyDark(context)
                ? MyColors.kindePeach
                : MyColors.dark,
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
                    backgroundColor: isThemeCurrentlyDark(context)
                        ? MyColors.accent
                        : MyColors.lightMilky,
                    child: Text(
                      'C',
                      style: GoogleFonts.roboto(
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
                      color: isThemeCurrentlyDark(context)
                          ? MyColors.kindePeach
                          : MyColors.dark,
                      fontSize: 12.5,
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
                    backgroundColor: isThemeCurrentlyDark(context)
                        ? MyColors.accent
                        : MyColors.lightMilky,
                    child: Text(
                      'E',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
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
                      fontSize: 12.5,
                      color: isThemeCurrentlyDark(context)
                          ? MyColors.kindePeach
                          : MyColors.dark,
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
                    backgroundColor: isThemeCurrentlyDark(context)
                        ? MyColors.accent
                        : MyColors.lightMilky,
                    child: Text(
                      'A',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
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
                      fontSize: 12.5,
                      color: isThemeCurrentlyDark(context)
                          ? MyColors.kindePeach
                          : MyColors.dark,
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
