import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:ourESchool/UI/Utility/ui_helpers.dart';
import 'package:ourESchool/main.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({
    Key key,
  }) : super(key: key);
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen.navigate(
        name: 'assets/flare_anim/Loading.flr',
        until: () => _appEngineStarted(),
        //Future.delayed(Duration(microseconds: 500)),
        startAnimation: 'Alarm',
        backgroundColor: //todo figure out why it doesnt change with theme
            isThemeCurrentlyDark(context) ? Colors.pink[100] : Colors.black,
        next: (_) => MyApp(),
      ),
    );
  }

  _appEngineStarted() {
    WidgetsFlutterBinding.ensureInitialized();
  }
}
