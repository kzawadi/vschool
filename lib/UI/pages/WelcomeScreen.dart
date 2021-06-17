import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ourESchool/UI/Utility/Resources.dart';
import 'package:flutter/material.dart';
// import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:ourESchool/UI/Utility/constants.dart';
import 'package:ourESchool/UI/resources/colors.dart';
import 'package:ourESchool/UI/resources/customWidgets.dart';
import 'package:ourESchool/core/services/analytics_service.dart';

import 'package:ourESchool/locator.dart';
import 'Login/LoginPage.dart';

class WelcomeScreen extends StatelessWidget {
  static const id = 'WelcomeScreen';
  final AnalyticsService _analyticsService = locator<AnalyticsService>();

  List<PageViewModel> page(BuildContext context) {
    return [
      PageViewModel(
        bubbleBackgroundColor: MyColors.black,
        pageColor: MyColors.welcomeTeacherColor,
        title: Container(),
        body: Column(
          children: <Widget>[
            AutoSizeText(
              string.teacher,
              style: GoogleFonts.montserrat(color: Colors.black),
            ),
            AutoSizeText(
              string.teacher_welcome_text,
              style: GoogleFonts.lato(color: Colors.black, fontSize: 18),
            ),
          ],
        ),
        mainImage: Image.asset(
          assetsString.teacher_welcome,
          // fit: BoxFit.none,
          width: MediaQuery.of(context).size.width - 60,
          alignment: Alignment.center,
        ),
        textStyle: TextStyle(color: Colors.white),
      ),
      PageViewModel(
        bubbleBackgroundColor: MyColors.black,
        pageColor: MyColors.kinderGreen,
        title: Container(),
        body: Column(
          children: <Widget>[
            AutoSizeText(
              string.student,
              style: GoogleFonts.montserrat(color: Colors.black),
            ),
            AutoSizeText(string.student_welcome_text,
                style: GoogleFonts.lato(color: Colors.black, fontSize: 18)),
          ],
        ),
        mainImage: Image.asset(
          assetsString.student_welcome,
          // fit: BoxFit.none,
          width: MediaQuery.of(context).size.width - 60,
          alignment: Alignment.center,
        ),
        textStyle: TextStyle(color: Colors.white),
      ),
      PageViewModel(
        bubbleBackgroundColor: MyColors.black,
        pageColor: MyColors.magicMint,
        title: Container(),
        body: Column(
          children: <Widget>[
            Text(
              string.parents,
              style: GoogleFonts.montserrat(color: Colors.black),
            ),
            Text(
              string.parent_welcome_text,
              style: GoogleFonts.lato(color: Colors.black, fontSize: 18),
            ),
          ],
        ),
        mainImage: Image.asset(
          assetsString.parents_welcome,
          // fit: BoxFit.none,
          width: MediaQuery.of(context).size.width - 60,
          alignment: Alignment.center,
        ),
        textStyle: TextStyle(color: Colors.white),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          IntroViewsFlutter(
            page(context),
            onTapDoneButton: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => LoginPage(),
                ),
              );
              await _analyticsService.logScreen(screenName: 'Login');
            },
            showNextButton: true,
            showBackButton: true,
            skipText: Text(
              '↠',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),
            ),
            backText: Text(
              '←',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),
            ),
            nextText: Text(
              '→',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),
            ),
            doneText: Text(
              'Go',
              style: GoogleFonts.quicksand(
                color: Theme.of(context).primaryColor,
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            background: Theme.of(context).primaryColor,
            showSkipButton: true,
            fullTransition: 130,
            doneButtonPersist: true,
          ),
          Positioned(
            bottom: 60.0,
            left: fullWidth(context) / 4,
            width: fullWidth(context) / 2,
            // left: MediaQuery.of(context).size.width / 2 - 40,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Hero(
                tag: 'login',
                transitionOnUserGestures: true,
                child: MaterialButton(
                  height: 48,
                  minWidth: MediaQuery.of(context).size.width - 100,
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  onPressed: () async {
                    kopenPageSlide(context, LoginPage(), 'Login');

                    await _analyticsService.logScreen(screenName: 'Login');
                  },
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    string.get_started,
                    style: GoogleFonts.montserrat(
                      color: Theme.of(context).accentColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
