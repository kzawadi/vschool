import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import 'package:ourESchool/UI/Utility/themes/theme_manager.dart';
import 'package:ourESchool/UI/Utility/ui_helpers.dart';
import 'package:ourESchool/UI/pages/Home.dart';
import 'package:ourESchool/UI/pages/Profiles/GuardianProfile.dart';
import 'package:ourESchool/UI/pages/Profiles/ProfilePage.dart';
import 'package:ourESchool/UI/pages/Profiles/TeacherProfilePage.dart';
import 'package:ourESchool/UI/pages/WelcomeScreen.dart';
import 'package:ourESchool/core/Models/User.dart';
import 'package:ourESchool/core/enums/UserType.dart';
import 'package:ourESchool/core/services/AuthenticationServices.dart';
import 'package:ourESchool/core/services/ProfileServices.dart';
import 'package:ourESchool/core/services/Services.dart';
import 'package:ourESchool/core/services/analytics_service.dart';
import 'package:ourESchool/locator.dart';
import 'package:provider/provider.dart';

void main() {
  final _logger = Logger('VSchool');
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });

  Provider.debugCheckInvalidValueType = null;
  setupLocator();
  _logger.info('Going into splash screen');
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<User>.value(
          initialData: User(),
          value: locator<ProfileServices>().loggedInUserStream.stream,
        ),
        StreamProvider<FirebaseUser>.value(
          initialData: null,
          value: locator<AuthenticationServices>()
              .fireBaseUserStream
              .stream
              .asBroadcastStream(),
        ),
        StreamProvider<UserType>.value(
          initialData: UserType.UNKNOWN,
          value: locator<AuthenticationServices>().userTypeStream.stream,
        ),
        StreamProvider<bool>.value(
          initialData: false,
          value: locator<AuthenticationServices>().isUserLoggedInStream.stream,
        ),
      ],
      child: OurSchoolApp(),
    );
  }
}

// ignore: must_be_immutable
class OurSchoolApp extends StatelessWidget with Services {
  OurSchoolApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      //Here we provide our ThemeManager to child widget tree
      create: (_) => ThemeManager(),
      child: Consumer<ThemeManager>(
        builder: (context, manager, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Vitone School App',
            theme: manager.themeData,
            routes: {
              WelcomeScreen.id: (context) => WelcomeScreen(),
              Home.id: (context) => Home(),
              ProfilePage.id: (context) => ProfilePage(),
              TeacherProfilePage.id: (context) => TeacherProfilePage(),
              GuardianProfilePage.id: (context) => GuardianProfilePage(
                    title: 'Guardian Profile',
                  ),
            },
            home: AnnotatedRegion<SystemUiOverlayStyle>(
              child: getHome(context),
              value: SystemUiOverlayStyle(
                statusBarColor: Colors.transparent, // transparent status bar
                systemNavigationBarColor:
                    Colors.transparent, // navigation bar color
                statusBarIconBrightness: isThemeCurrentlyDark(context)
                    ? Brightness.dark
                    : Brightness.light, // status bar icons' color
                systemNavigationBarIconBrightness: isThemeCurrentlyDark(context)
                    ? Brightness.light
                    : Brightness.dark, //navigation bar icons' color
              ),
            ),
            navigatorObservers: [
              locator<AnalyticsService>().getAnalyticsObserver(),
            ],
          );
        },
      ),
    );
  }

  Widget getHome(BuildContext context) {
    User currentUser = Provider.of<User>(context, listen: false);
    UserType userType = Provider.of<UserType>(context, listen: false);

    if (Provider.of<bool>(context, listen: false)) {
      if (userType == UserType.STUDENT) {
        return currentUser.isEmpty() ? ProfilePage() : Home();
      } else {
        return Home();
      }
    } else {
      return WelcomeScreen();
    }
  }
}
