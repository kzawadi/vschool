import 'package:ourESchool/UI/Utility/ui_helpers.dart';
import 'package:ourESchool/UI/pages/Profiles/TeacherProfilePage.dart';
import 'package:ourESchool/UI/resources/colors.dart';
import 'package:ourESchool/core/services/analytics_service.dart';

import 'UI/pages/Splash/splashScreen.dart';
import 'imports.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  // debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

  Provider.debugCheckInvalidValueType = null;
  setupLocator();
  runApp(
    SplaScreen(),
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
      child: DynamicTheme(
          defaultBrightness: Brightness.light,
          data: (brightness) => ThemeData(
                pageTransitionsTheme: PageTransitionsTheme(
                  builders: {
                    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
                    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                  },
                ),
                fontFamily: "Nunito",
                primaryColor: MyColors.primary,
                accentColor: MyColors.accent,
                primaryColorDark: MyColors.primaryDark,
                brightness: brightness,
              ),
          themedWidgetBuilder: (context, theme) => OurSchoolApp(theme: theme)),
    );
  }
}

// ignore: must_be_immutable
class OurSchoolApp extends StatelessWidget with Services {
  OurSchoolApp({
    Key key,
    @required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vitone School App',
      theme: theme,
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
          systemNavigationBarColor: Colors.transparent, // navigation bar color
          statusBarIconBrightness: isThemeCurrentlyDark(context)
              ? Brightness.light //todo fixed theme preferences not reloading
              : Brightness.dark, // status bar icons' color
          systemNavigationBarIconBrightness:
              Brightness.dark, //navigation bar icons' color
        ),
      ),
      navigatorObservers: [
        locator<AnalyticsService>().getAnalyticsObserver(),
      ],
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
