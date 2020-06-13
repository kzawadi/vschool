import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/material.dart';
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
        until: () => Future.delayed(Duration(microseconds: 500)),
        startAnimation: 'Alarm',
        next: (_) => MyApp(),
      ),
    );
  }
}
