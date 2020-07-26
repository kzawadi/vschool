import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ourESchool/UI/resources/colors.dart';
import 'package:ourESchool/core/viewmodel/Announcement/AnnouncementPageModel.dart';
import 'package:provider/provider.dart';

import 'package:ourESchool/UI/Utility/constants.dart';
import 'package:ourESchool/UI/Widgets/swipedetector.dart';
import 'package:ourESchool/core/Models/Announcement.dart';
import 'package:ourESchool/core/enums/UserType.dart';

import '../../../locator.dart';

class AnnouncementViewer extends StatelessWidget {
  final Announcement announcement;

  AnnouncementViewer({
    Key key,
    this.announcement,
  }) : super(key: key);
  bool isAteacher = false;
  final AnnouncementPageModel announcementModel =
      locator<AnnouncementPageModel>();

  @override
  Widget build(BuildContext context) {
    var userType = Provider.of<UserType>(context, listen: false);
    if (userType == UserType.TEACHER) {
      isAteacher = true;
    }
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
                      tag: announcement.id + 'photo',
                      child: CachedNetworkImage(
                        fit: BoxFit.contain,
                        imageUrl: announcement.photoUrl,
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
                        tag: announcement.id + 'roww',
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
                                  announcement.by,
                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                //TimeStamp section
                                Text(
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
                                onPressed: () async {
                                  String id = announcement.id;
                                  String stdDivGlobal;
                                  if (announcement.forClass == 'Global') {
                                    stdDivGlobal = announcement.forClass;
                                  } else
                                    stdDivGlobal = announcement.forClass +
                                        announcement.forDiv;
                                  await announcementModel.deleteAnnouncements(
                                      id, stdDivGlobal);
                                },
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
                            tag: announcement.id + 'captionn',
                            child: AutoSizeText(
                              announcement.caption,
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
                        size: 14,
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
