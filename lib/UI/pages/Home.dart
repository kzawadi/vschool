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

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _currentIndex = 0;
  Color background = Colors.white;
  FirebaseNotifications _notifications = locator<FirebaseNotifications>();

  String pageName = string.home;

  List<Widget> _pages = [
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

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.pending), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard_outlined), label: "Panel"),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_outline_rounded), label: "Chat"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings"),
          ],
          currentIndex: _currentIndex,
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
          backgroundColor: Theme.of(context).backgroundColor,
          type: BottomNavigationBarType.shifting,
        ),
        body: Center(
          child: _pages.elementAt(_currentIndex),
        )
        // IndexedStack(
        //   index: _currentIndex,
        //   children: pages,
        // ),
        );
  }

  // List<BottomNavyBarItem> bottomBarItemsNew = [
  //   BottomNavyBarItem(
  //     activeColor: MyColors.primary,
  //     icon: Icon(
  //       Icons.home,
  //     ),
  //     inactiveColor: MyColors.primary,
  //     title: Text(string.feed),
  //   ),
  //   BottomNavyBarItem(
  //     activeColor: MyColors.persian_green,
  //     icon: Icon(
  //       Icons.dashboard,
  //     ),
  //     inactiveColor: MyColors.persian_green,
  //     title: Text(string.dashboard),
  //   ),
  //   BottomNavyBarItem(
  //     activeColor: MyColors.dark,
  //     icon: Icon(
  //       CustomIcons.chat_bubble,
  //       // size: 25,
  //     ),
  //     inactiveColor: MyColors.dark,
  //     title: Text(string.chat),
  //   ),
  //   BottomNavyBarItem(
  //     inactiveColor: Colors.teal,
  //     icon: Icon(
  //       Icons.settings,
  //     ),
  //     activeColor: Colors.teal,
  //     title: Text(
  //       string.setting,
  //     ),
  //   )
  // ];

  // BottomNavyBar bnb() {
  //   return BottomNavyBar(
  //     curve: Curves.easeIn,
  //     itemCornerRadius: 50,
  //     iconSize: 24,
  //     containerHeight: 56,
  //     backgroundColor: Theme.of(context).accentColor,
  //     selectedIndex: _currentIndex,
  //     showElevation: false, // use this to remove appBar's elevation
  //     onItemSelected: (v) {
  //       setState(() {
  //         // HapticFeedback.selectionClick();
  //         if (v == 0) {
  //           pageName = FeedPage.pageName;
  //         } else if (v == 1) {
  //           pageName = MainDashboard.pageName;
  //         } else if (v == 2) {
  //           pageName = ChatPage.pageName;
  //         } else if (v == 3) {
  //           pageName = SettingPage.pageName;
  //         }
  //         _currentIndex = v;
  //       });
  //     },
  //     items: bottomBarItemsNew,
  //   );
  // }
}
