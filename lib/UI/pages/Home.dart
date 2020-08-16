import 'package:ourESchool/UI/Utility/ui_helpers.dart';
import 'package:ourESchool/UI/pages/feed/feed_page.dart';
import 'package:ourESchool/UI/resources/colors.dart';
import 'package:ourESchool/imports.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:ourESchool/UI/Utility/firebase_notifications.dart';

class Home extends StatefulWidget {
  static const id = 'Home';
  Home({Key key}) : super(key: key);

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with Services {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _currentIndex = 0;
  Color background = Colors.white;
  FirebaseNotifications _notifications = locator<FirebaseNotifications>();

  String pageName = string.home;

  List<Widget> pages = [
    FeedPage(),
    MainDashboard(),
    ChatPage(),
    // NotificationPage(),
    // Settings()
    SettingPage()
  ];

  @override
  void initState() {
    _notifications.firebaseNotificationServices();
    _notifications.configLocalNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      bottomNavigationBar: bnb(),
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
    );
  }

  List<BottomNavyBarItem> bottomBarItemsNew = [
    BottomNavyBarItem(
      activeColor: Colors.teal[700],
      icon: Icon(
        Icons.home,
      ),
      inactiveColor: Colors.teal[700],
      title: Text(string.dashboard),
    ),
    BottomNavyBarItem(
      activeColor: Colors.blue,
      icon: Icon(
        Icons.dashboard,
      ),
      inactiveColor: Colors.blue,
      title: Text(string.dashboard),
    ),
    BottomNavyBarItem(
      activeColor: Colors.pink[300],
      icon: Icon(
        CustomIcons.chat_bubble,
        // size: 25,
      ),
      inactiveColor: Colors.pink[300],
      title: Text(string.chat),
    ),
    BottomNavyBarItem(
      inactiveColor: Colors.orange,
      icon: Icon(
        Icons.settings,
      ),
      activeColor: Colors.orange,
      title: Text(
        string.setting,
      ),
    )
  ];

  BottomNavyBar bnb() {
    return BottomNavyBar(
      curve: Curves.easeIn,
      itemCornerRadius: 50,
      iconSize: 24,
      containerHeight: 56,
      backgroundColor: isThemeCurrentlyDark(context)
          ? Theme.of(context).primaryColor
          : Theme.of(context).accentColor,
      // animationDuration: Duration(milliseconds: 260), it is the default
      selectedIndex: _currentIndex,
      showElevation: false, // use this to remove appBar's elevation
      onItemSelected: (v) {
        setState(() {
          // HapticFeedback.selectionClick();
          if (v == 0) {
            pageName = FeedPage.pageName;
          } else if (v == 1) {
            pageName = MainDashboard.pageName;
          } else if (v == 2) {
            pageName = ChatPage.pageName;
          } else if (v == 3) {
            pageName = SettingPage.pageName;
          }
          _currentIndex = v;
        });
        // }
      },
      items: bottomBarItemsNew,
    );
  }
}
