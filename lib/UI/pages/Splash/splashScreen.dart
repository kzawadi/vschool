import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:ourESchool/UI/Utility/ui_helpers.dart';
import 'package:ourESchool/UI/resources/colors.dart';
import 'package:ourESchool/imports.dart';
import 'package:ourESchool/main.dart';

// class Splashscreen extends StatefulWidget {
//   const Splashscreen({
//     Key key,
//   }) : super(key: key);
//   @override
//   _SplashState createState() => _SplashState();
// }

class SplaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent, // transparent status bar
          systemNavigationBarColor: Colors.transparent, // navigation bar color
          statusBarIconBrightness: isThemeCurrentlyDark(context)
              ? Brightness.light //todo fixed theme preferences not reloading
              : Brightness.dark, // status bar icons' color
          systemNavigationBarIconBrightness:
              Brightness.dark, //navigation bar icons' color
        ),
        child: SplashScreen.navigate(
          alignment: Alignment.center,
          name: 'assets/flare_anim/Loading.flr',
          until: () => Future.delayed(Duration(seconds: 0)),
          loopAnimation: 'Loading.flr',
          //Future.delayed(Duration(microseconds: 500)),
          startAnimation: 'Alarm',
          // todo theme is not reloading so this below code is kinder lame will work on it
          backgroundColor: MyColors.welcomeTeacherColor,
          // isThemeCurrentlyDark(context) ? Colors.pink[50] : Colors.black,
          //Colors.pink[100] : Colors.black,
          next: (_) => MyApp(),
        ),
      ),
    );
  }

  // _appEngineStarted() {
  //   WidgetsFlutterBinding.ensureInitialized();
  // }
}
