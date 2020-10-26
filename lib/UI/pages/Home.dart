import 'package:ourESchool/UI/pages/feed/feed_page.dart';
import 'package:ourESchool/UI/resources/colors.dart';
import 'package:ourESchool/imports.dart';
import 'package:ourESchool/UI/Utility/firebase_notifications.dart';

class Home extends StatefulWidget {
  static const id = 'Home';
  Home({Key key}) : super(key: key);

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _currentIndex = 0;
  Color background = Colors.white;
  // FirebaseNotifications _notifications = locator<FirebaseNotifications>();

  String pageName = string.home;

  List<Widget> _pages = [
    FeedPage(),
    MainDashboard(),
    ChatPage(),
    SettingPage()
  ];

  @override
  void initState() {
    // configLocalNotification();
    // firebaseNotificationServices();
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      extendBody: true,
      key: _scaffoldKey,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(26), topLeft: Radius.circular(26)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.pending),
                label: "Home",
                backgroundColor: Theme.of(context).bottomAppBarColor,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard_outlined),
                label: "Panel",
                backgroundColor: Theme.of(context).bottomAppBarColor,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_outline_rounded),
                label: "Chat",
                backgroundColor: Theme.of(context).bottomAppBarColor,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "Settings",
                backgroundColor: Theme.of(context).bottomAppBarColor,
              ),
            ],
            currentIndex: _currentIndex,
            iconSize: 22,
            onTap: _onItemTapped,
            selectedItemColor: wood_smoke,
            unselectedItemColor: trout,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedIconTheme: IconThemeData(color: wood_smoke, opacity: 1),
            unselectedIconTheme: IconThemeData(color: trout, opacity: 0.6),
            selectedLabelStyle: TextStyle(
                color: wood_smoke, fontSize: 12, fontWeight: FontWeight.w800),
            unselectedLabelStyle: TextStyle(
                color: trout, fontSize: 12, fontWeight: FontWeight.w800),
            backgroundColor: Theme.of(context).bottomAppBarColor,
            type: BottomNavigationBarType.shifting,
          ),
        ),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
    );
  }
}
