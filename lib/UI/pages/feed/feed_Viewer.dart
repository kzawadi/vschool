import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ourESchool/UI/Widgets/TopBar.dart';
import 'package:ourESchool/UI/pages/feed/feed_viewModel.dart';
import 'package:provider/provider.dart';

import 'package:ourESchool/UI/Utility/constants.dart';
import 'package:ourESchool/UI/Widgets/swipedetector.dart';
import 'package:ourESchool/core/Models/Announcement.dart';
import 'package:ourESchool/core/enums/UserType.dart';

import '../../../locator.dart';

class FeedViewer extends StatelessWidget {
  final Announcement feed;

  FeedViewer({
    Key key,
    this.feed,
  }) : super(key: key);
  bool isAteacher = false;
  final FeedViewModel feedModel = locator<FeedViewModel>();

  @override
  Widget build(BuildContext context) {
    var userType = Provider.of<UserType>(context, listen: false);
    if (userType == UserType.TEACHER) {
      isAteacher = true;
    }
    return SwipeDetector(
      // onSwipeDown: () {
      //   Navigator.pop(context);
      // },
      onSwipeRight: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        appBar: TopBar(
          title: "Viewer",
          child: kBackBtn,
          onPressed: () {},
        ),
        body: Container(
          child: SafeArea(
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Hero(
                      transitionOnUserGestures: true,
                      tag: feed.id + 'photo',
                      child: CachedNetworkImage(
                        fit: BoxFit.contain,
                        imageUrl: feed.photoUrl,
                        placeholder: (context, url) => kBuzyPage(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        fadeOutDuration: const Duration(microseconds: 400),
                        fadeInDuration: const Duration(microseconds: 400),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Hero(
                        transitionOnUserGestures: false,
                        tag: feed.id + 'roww',
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                //Announcement by section
                                Text(
                                  feed.by,
                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                //TimeStamp section
                                Text(
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
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 172,
                            ),
                            Visibility(
                              visible: isAteacher,
                              child: IconButton(
                                tooltip: 'Delete post',
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red[200],
                                ),
                                onPressed: () => filterDialogBox(context),
                              ),
                            ),
                          ],
                        ),
                      ),
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
                            tag: feed.id + 'captionn',
                            child: AutoSizeText(
                              feed.caption,
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(fontSize: 16.5),
                              ),
                              maxFontSize: 18,
                              minFontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future filterDialogBox(BuildContext context) {
    return
        // flutter defined function
        showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text("Delete A Feed"),
          content: Text(
            "Your about to DELETE  a Feed, Are you Sure You Want to DELETE",
          ),
          actions: <Widget>[
            MaterialButton(
              child: Text('Delete'),
              onPressed: () async {
                String id = feed.id;
                String stdDivGlobal;
                if (feed.forClass == 'Global') {
                  stdDivGlobal = feed.forClass;
                } else
                  stdDivGlobal = feed.forClass + feed.forDiv;
                await feedModel.deleteFeed(id, stdDivGlobal);

                Navigator.of(context).pop();
              },
            ),
            SizedBox(width: 100),
            // usually buttons at the bottom of the dialog
            FlatButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
