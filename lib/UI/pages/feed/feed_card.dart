import 'package:animations/animations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:framy_annotation/framy_annotation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ourESchool/UI/pages/feed/feed_page.dart';
import 'package:stacked/stacked.dart';

import 'package:ourESchool/UI/Utility/Resources.dart';
import 'package:ourESchool/UI/Utility/constants.dart';
import 'package:ourESchool/UI/Widgets/PostIconsRow.dart';
import 'package:ourESchool/UI/pages/feed/announcement_owner.dart';
import 'package:ourESchool/UI/pages/feed/feed_Viewer.dart';
import 'package:ourESchool/UI/pages/feed/feed_viewModel.dart';
import 'package:ourESchool/UI/pages/feed/tweetImage.dart';
import 'package:ourESchool/UI/resources/customWidgets.dart';
import 'package:ourESchool/core/enums/UserType.dart';
import 'package:ourESchool/imports.dart';

class FeedCard extends StatelessWidget {
  FeedCard({Key key, this.feed, this.feedModel}) : super(key: key);

  final Announcement feed;
  final FeedViewModel feedModel;
  bool isAteacher = false;
  @override
  Widget build(BuildContext context) {
    var userType = Provider.of<UserType>(context, listen: false);
    if (userType == UserType.TEACHER) {
      isAteacher = true;
    }
    return ViewModelBuilder<OwnerViewModel>.reactive(
      disposeViewModel: false,
      createNewModelOnInsert: false,
      onModelReady: (model) => model.futureToRun,
      viewModelBuilder: () => OwnerViewModel(UserType.TEACHER, feed.by),
      builder: (context, model, child) => FeedCardWidget(
        feed: feed,
        feedModel: feedModel,
        // isAteacher: isAteacher,
      ),
    );
  }
}

@FramyWidget()
class FeedCardWidget extends ViewModelWidget<OwnerViewModel> {
  final Announcement feed;
  final FeedViewModel feedModel;
  // bool isAteacher = false;
  const FeedCardWidget({Key key, this.feed, this.feedModel})
      : super(key: key, reactive: true);

  @override
  Widget build(BuildContext context, OwnerViewModel viewModel) {
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
                  Row(
                    children: <Widget>[
                      //User profile image section
                      viewModel.isBusy
                          ? CircleAvatar(
                              radius: 25.0,
                              backgroundImage:
                                  AssetImage(assetsString.teacher_welcome),
                              backgroundColor: Colors.transparent,
                            )
                          : CircleAvatar(
                              radius: 25.0,
                              backgroundImage:
                                  viewModel.data.photoUrl == 'default'
                                      ? AssetImage(assetsString.teacher_welcome)
                                      : customAdvanceNetworkImage(
                                          viewModel.data.photoUrl),
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
                          viewModel.isBusy
                              ? Text('Loading...')
                              : Text(
                                  viewModel.data.displayName,
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
                              backgroundColor: Theme.of(context).accentColor,
                              child: Text(
                                feed.type
                                    .toString()
                                    .substring(
                                        feed.type.toString().indexOf('.') + 1)
                                    .substring(0, 1),
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    color: Theme.of(context).primaryColor,
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
            Padding(
              padding: EdgeInsets.only(left: fullWidth(context) / 2),
              child: PostIconsRow(
                model: feedModel,
                feed: feed,
              ),
            ),
          ],
        ),
        onTap: () {
          OpenContainer(
            closedColor: Colors.blue,
            openColor: Colors.yellow,
            closedElevation: 10.0,
            openElevation: 15.0,
            closedShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            transitionType: ContainerTransitionType.fade,
            transitionDuration: const Duration(milliseconds: 500),
            openBuilder: (context, action) {
              return FeedViewer(
                feed: feed,
              );
            },
            closedBuilder: (context, action) {
              return FeedPage();
            },
          );
          // kopenPageBottom(
          //   context,
          //   FeedViewer(
          //     feed: feed,
          //   ),
          // );
        },
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
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text(
          "Post Type",
          style: TextStyle(
            fontSize: 22,
            color: Theme.of(context).primaryColor,
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
                      color: Theme.of(context).primaryColor,
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
                      color: Theme.of(context).primaryColor,
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
                      color: Theme.of(context).primaryColor,
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
