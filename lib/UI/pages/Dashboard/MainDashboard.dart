import 'package:ourESchool/UI/pages/Dashboard/Wall/WallPage.dart';
import 'package:ourESchool/imports.dart';

class MainDashboard extends StatefulWidget {
  MainDashboard({Key key}) : super(key: key) {
    // setCurrentScreen();
  }
  static String pageName = string.dashboard;

  _MainDashboardState createState() => _MainDashboardState();

  @override
  String get screenName => 'ParentAndTeacher Dashboard';
}

class _MainDashboardState extends State<MainDashboard> with Services {
  final double separation = 5;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // extendBody: true,
        body: AnnouncementPage(),
      ),
    );
  }
}
