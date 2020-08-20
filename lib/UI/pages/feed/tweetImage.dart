import 'package:flutter/material.dart';
import 'package:ourESchool/UI/Utility/constants.dart';
import 'package:ourESchool/UI/pages/feed/feed_Viewer.dart';
import 'package:ourESchool/UI/resources/customWidgets.dart';
import 'package:ourESchool/core/Models/Announcement.dart';

class FeedImage extends StatelessWidget {
  const FeedImage({Key key, this.feed}) : super(key: key);

  final Announcement feed;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      alignment: Alignment.center,
      child: feed.photoUrl == ''
          ? SizedBox.shrink()
          : Padding(
              padding: EdgeInsets.only(
                top: 8,
              ),
              child: InkWell(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
                onTap: () {
                  kopenPageBottom(
                    context,
                    FeedViewer(
                      feed: feed,
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  child: Container(
                    width: fullWidth(context) * .95,
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                    ),
                    child: AspectRatio(
                      aspectRatio: 4 / 3,
                      child:
                          customNetworkImage(feed.photoUrl, fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
