import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:ourESchool/UI/Utility/Resources.dart';
import 'package:ourESchool/UI/Utility/constants.dart';
import 'package:ourESchool/UI/Utility/ui_helpers.dart';
import 'package:ourESchool/UI/pages/Dashboard/Announcement/announcement_owner.dart';
import 'package:ourESchool/UI/pages/shared/AnnouncementViewer.dart';
import 'package:ourESchool/UI/resources/colors.dart';
import 'package:ourESchool/core/Models/Announcement.dart';
import 'package:ourESchool/core/enums/UserType.dart';
import 'package:ourESchool/imports.dart';
import 'package:ourESchool/locator.dart';
import 'package:stacked/stacked.dart';

class AnnouncementCard extends StatelessWidget {
  AnnouncementCard({
    Key key,
    this.announcement,
  }) : super(key: key);

  final Announcement announcement;

  final AnnouncementPageModel announcementModel =
      locator<AnnouncementPageModel>();

  // bool isAteacher = false;

  @override
  Widget build(BuildContext context) {
    bool isAteacher = false;

    var userType = Provider.of<UserType>(context, listen: false);
    if (userType == UserType.TEACHER) {
      isAteacher = true;
    }
    return ViewModelBuilder<OwnerViewModel>.reactive(
      disposeViewModel: false,
      createNewModelOnInsert: false,
      onModelReady: (model) => model.futureToRun(),
      viewModelBuilder: () => OwnerViewModel(UserType.TEACHER, announcement.by),
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
                      tag: announcement.id + 'row',
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
                                      : NetworkImage(model.data.photoUrl),
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
                                model.isBusy
                                    ? 'Loading...'
                                    : model.data.displayName,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                ),
                              ),
                              //TimeStamp section
                              Text(
                                // 'data',
                                DateFormat("MMM d, E").add_jm().format(
                                    DateTime.parse(announcement.timestamp
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
                    //Announcement Type section
                    Visibility(
                      visible: announcement.type == null ? false : true,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              print(announcement.timestamp.toString());
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
                                  announcement.type
                                      .toString()
                                      .substring(announcement.type
                                              .toString()
                                              .indexOf('.') +
                                          1)
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
                  tag: announcement.id + 'photo',
                  child: Material(
                    child: InkWell(
                      onTap: () {
                        kopenPageBottom(
                          context,
                          AnnouncementViewer(
                            announcement: announcement,
                          ),
                        );
                      },
                      child: announcement.photoUrl == ''
                          ? Container(
                              height: 0,
                            )
                          : CachedNetworkImage(
                              fit: BoxFit.contain,
                              imageUrl: announcement.photoUrl,
                              placeholder: (context, url) => kBuzyPage(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                              fadeOutDuration:
                                  const Duration(microseconds: 200),
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
                    tag: announcement.id + 'caption',
                    child: AutoSizeText(
                      announcement.caption,
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
              AnnouncementViewer(
                announcement: announcement,
              ),
            );
          },
        ),
      ),
    );
  }
}

//todo remember to implement a UI to tell about the types of announcement
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
          "Announcement Type",
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
