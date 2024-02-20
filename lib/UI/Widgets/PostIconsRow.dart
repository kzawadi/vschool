import 'package:flutter/material.dart';
import 'package:ourESchool/UI/pages/feed/feed_viewModel.dart';
import 'package:ourESchool/UI/resources/constant.dart';
import 'package:ourESchool/UI/resources/customWidgets.dart';
import 'package:ourESchool/core/Models/Announcement.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:stacked/stacked.dart';

class PostIconsRow extends ViewModelWidget<FeedViewModel> {
  PostIconsRow({Key key, this.model, this.feed})
      : super(key: key, reactive: true);

  final Announcement feed;
  // final String firebaseUser;
  final FeedViewModel model;

  Widget _likeCommentsIcons(BuildContext context, {Announcement feed}) {
    // var authState = Provider.of<AuthState>(context, listen: false);
    var firebaseUser = Provider.of<auth.User>(context, listen: false);

    return Container(
      // color: Colors.transparent,
      padding: EdgeInsets.only(bottom: 0, top: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _iconWidget(
            context,
            text: feed.likeCount.toString(),
            icon: feed.likeList.any((userId) => userId == firebaseUser.uid)
                ? AppIcon.heartFill
                : AppIcon.heartEmpty,
            onPressed: () {
              model.addLikeToTweet(
                  feed: feed, firebaseUserId: firebaseUser.uid);
            },
            iconColor: feed.likeList.any((userId) => userId == firebaseUser.uid)
                ? Colors.red[300]
                : Color.fromRGBO(224, 36, 94, 1.0),
            size: 20,
          ),
        ],
      ),
    );
  }

  Widget _iconWidget(BuildContext context,
      {String text,
      int icon,
      Function onPressed,
      IconData sysIcon,
      Color iconColor,
      double size = 20}) {
    return Expanded(
      child: Container(
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: () {
                if (onPressed != null) onPressed();
              },
              icon: sysIcon != null
                  ? Icon(sysIcon, color: iconColor, size: size)
                  : customIcon(
                      context,
                      size: size,
                      icon: icon,
                      istwitterIcon: true,
                      iconColor: iconColor,
                    ),
            ),
            customText(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: iconColor,
                fontSize: size - 5,
              ),
              context: context,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, FeedViewModel viewModel) {
    return Container(
        child: Column(
      children: <Widget>[_likeCommentsIcons(context, feed: feed)],
    ));
  }
}
