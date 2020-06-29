import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ourESchool/UI/Utility/ui_helpers.dart';
import 'package:ourESchool/UI/resources/colors.dart';
import 'package:ourESchool/imports.dart';
import 'package:ourESchool/core/helpers/shared_preferences_helper.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class Home extends StatefulWidget {
  static const id = 'Home';
  Home({Key key}) : super(key: key);

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with Services {
  var _scaffoldKey;

  SharedPreferencesHelper _sharedPreferencesHelper =
      locator<SharedPreferencesHelper>();
  StreamSubscription iosSubscription;

  int _currentIndex = 0;
  Color background = Colors.white;
  static Color inactiveColor = Color(0xff4B4743); //0xffdd2c00
  // AuthenticationServices _auth = locator<AuthenticationServices>();
  bool isTeacher = false;
  // MainPageModel mainPageModel;

  // _auth.userType == UserType.STUDENT ? false : true;
  String pageName = string.home;

  List<Widget> pages = [
    AnnouncementPage(),
    MainDashboard(),
    ChatPage(),
    // NotificationPage(),
    SettingPage()
  ];

  List<Widget> studentPages = [
    StudentDashboard(),
    SettingPage(),
  ];

  @override
  void initState() {
    //getFirebaseUser();
    super.initState();
    _scaffoldKey = GlobalKey<ScaffoldState>();
    if (Platform.isIOS) {
      iosSubscription = cloudmesaging.onIosSettingsRegistered.listen((data) {
        print(data);
        _saveDeviceToken();
      });

      cloudmesaging.requestNotificationPermissions(
          IosNotificationSettings(sound: true, badge: true, alert: true));
    } else {
      _saveDeviceToken();
    }

    cloudmesaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        // print("onMessage: $message");
        // _scaffoldKey.currentState.showSnackBar(
        //   ksnackBar(context, message['notification']['title']),
        // );

        // print('RECIEVED NOTIFICATION IS $message'.toString());
        print('onMessage: $message');
        Platform.isAndroid
            ? showNotification(message['notification'])
            : showNotification(message['aps']['alert']);
        return;
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        // TODO optional
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        // TODO optional
      },
    );
    configLocalNotification();
  }

  @override
  void dispose() {
    if (iosSubscription != null) iosSubscription.cancel();
    super.dispose();
  }

  _saveDeviceToken() async {
    String fcmToken = await cloudmesaging.getToken();
    String id = await _sharedPreferencesHelper.getLoggedInUserId();

    print('curent user id is $firebaseUser'.toString());

    // Save it to Firestore
    if (fcmToken != null) {
      DocumentReference tokens = firestore
          .collection('users')
          .document(id)
          .collection('tokens')
          .document(fcmToken);

      await tokens.setData({
        'token': fcmToken,
        'createdAt': FieldValue.serverTimestamp(), // optional
        'platform': Platform.operatingSystem // optional
      });
    }
    print('the token is $fcmToken'.toString());
  }

  /// Subscribe the user to a topic for notifications from firebase cloud messaging
  _subscribeToTopic() async {
    // Subscribe the user to a topic
    cloudmesaging.subscribeToTopic('daily');
  }

  void configLocalNotification() {
    var initializationSettingsAndroid =
        new AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    localNotifications.initialize(initializationSettings);
  }

  void showNotification(message) async {
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
      Platform.isAndroid
          ? 'com.mappdeveloper.usa.our_e_school'
          // todo be replaced by ios project id
          : 'com.mappdeveloper.usa.our_e_school',
      'e school chat demo',
      'General notifications channel descriptions',
      playSound: true,
      enableVibration: true,
      importance: Importance.max,
      priority: Priority.high,
    );
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    print(message);
//    print(message['body'].toString());
//    print(json.encode(message));

    await localNotifications.show(0, message['title'].toString(),
        message['body'].toString(), platformChannelSpecifics,
        payload: json.encode(message));

//    await flutterLocalNotificationsPlugin.show(
//        0, 'plain title', 'plain body', platformChannelSpecifics,
//        payload: 'item x');
  }

  ImageProvider<dynamic> setImage(User user) {
    return user.photoUrl != 'default'
        ? NetworkImage(
            user.photoUrl,
          )
        : AssetImage(assetsString.student_welcome);
  }

  @override
  Widget build(BuildContext context) {
    var userType = Provider.of<UserType>(context, listen: false);
    if (userType == UserType.TEACHER) {
      isTeacher = true;
    }
    // User user = Provider.of<User>(context, listen: false);
    return Scaffold(
      key: _scaffoldKey,
      bottomNavigationBar: bnb(userType: userType),
      body: userType == UserType.STUDENT
          ? IndexedStack(
              index: _currentIndex,
              children: studentPages,
            )
          : IndexedStack(
              index: _currentIndex,
              children: pages,
            ),
    );
  }

  List<BubbleBottomBarItem> studentItems = [
    BubbleBottomBarItem(
      backgroundColor: Colors.red,
      icon: Icon(
        Icons.home,
      ),
      activeIcon: Icon(
        Icons.home,
        color: Colors.red,
      ),
      title: Text(string.dashboard),
    ),
    BubbleBottomBarItem(
      backgroundColor: Colors.red,
      icon: Icon(
        Icons.dashboard,
      ),
      activeIcon: Icon(
        Icons.home,
        color: Colors.red,
      ),
      title: Text(string.dashboard),
    ),
    BubbleBottomBarItem(
      backgroundColor: Colors.orange,
      icon: Icon(
        Icons.settings,
      ),
      activeIcon: Icon(
        Icons.settings,
        color: Colors.orange,
      ),
      title: Text(
        string.setting,
      ),
    )
  ];
  List<BottomNavyBarItem> studentItemsNew = [
    BottomNavyBarItem(
      activeColor: Colors.red,
      icon: Icon(
        Icons.home,
      ),
      inactiveColor: inactiveColor,
      title: Text(string.dashboard),
    ),
    BottomNavyBarItem(
      activeColor: Colors.red,
      icon: Icon(
        Icons.dashboard,
      ),
      inactiveColor: inactiveColor,
      title: Text(string.dashboard),
    ),
    BottomNavyBarItem(
      activeColor: Colors.orange,
      icon: Icon(
        Icons.settings,
      ),
      inactiveColor: inactiveColor,
      title: Text(
        string.setting,
      ),
    )
  ];

  List<BubbleBottomBarItem> bottomBarItems = [
    BubbleBottomBarItem(
      backgroundColor: Colors.teal,
      icon: Icon(
        Icons.home,
      ),
      activeIcon: Icon(
        Icons.home,
        color: Colors.teal,
      ),
      title: Text(string.dashboard),
    ),
    BubbleBottomBarItem(
      backgroundColor: Colors.red,
      icon: Icon(
        Icons.dashboard,
      ),
      activeIcon: Icon(
        Icons.dashboard,
        color: Colors.red,
      ),
      title: Text(string.dashboard),
    ),
    BubbleBottomBarItem(
      backgroundColor: Colors.deepPurple,
      icon: Icon(
        CustomIcons.chat_bubble,
        // size: 25,
      ),
      activeIcon: Icon(
        CustomIcons.chat_bubble,
        color: Colors.deepPurple,
      ),
      title: Text(string.chat),
    ),
    BubbleBottomBarItem(
      backgroundColor: Colors.orange,
      icon: Icon(
        Icons.settings,
      ),
      activeIcon: Icon(
        Icons.settings,
        color: Colors.orange,
      ),
      title: Text(
        string.setting,
      ),
    )
  ];
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

  BubbleBottomBar buildBubbleBottomBar(UserType userType) {
    return BubbleBottomBar(
      backgroundColor: Theme.of(context).canvasColor,
      opacity: .2,
      currentIndex: _currentIndex,
      onTap: (v) {
        if (userType == UserType.STUDENT) {
          setState(() {
            if (v == 0) {
              pageName = StudentDashboard.pageName;
            } else {
              pageName = SettingPage.pageName;
            }
            _currentIndex = v;
          });
        } else {
          setState(() {
            if (v == 0) {
              pageName = AnnouncementPage.pageName;
            } else if (v == 1) {
              pageName = MainDashboard.pageName;
            } else if (v == 2) {
              pageName = ChatPage.pageName;
            } else if (v == 3) {
              pageName = SettingPage.pageName;
            }
            _currentIndex = v;
          });
        }
      },
      borderRadius: BorderRadius.circular(16),
      // BorderRadius.vertical(
      //   top: Radius.circular(16),
      // ),
      elevation: 10,
      fabLocation: isTeacher ? BubbleBottomBarFabLocation.end : null, //new
      hasNotch: isTeacher, //new
      hasInk: true, //new, gives a cute ink effect
      inkColor: Colors.black12, //optional, uses theme color if not specified
      items: userType == UserType.STUDENT ? studentItems : bottomBarItems,
    );
  }

  BottomNavyBar bnb({UserType userType}) {
    return BottomNavyBar(
      curve: Curves.easeIn,
      itemCornerRadius: 50,
      iconSize: 22,
      containerHeight: 53,
      backgroundColor:
          isThemeCurrentlyDark(context) ? MyColors.github : MyColors.white,
      // animationDuration: Duration(milliseconds: 260), it is the default
      selectedIndex: _currentIndex,
      showElevation: false, // use this to remove appBar's elevation
      onItemSelected: (v) {
        if (userType == UserType.STUDENT) {
          setState(() {
            if (v == 0) {
              pageName = StudentDashboard.pageName;
            } else {
              pageName = SettingPage.pageName;
            }
            _currentIndex = v;
          });
        } else {
          setState(() {
            if (v == 0) {
              pageName = AnnouncementPage.pageName;
            } else if (v == 1) {
              pageName = MainDashboard.pageName;
            } else if (v == 2) {
              pageName = ChatPage.pageName;
            } else if (v == 3) {
              pageName = SettingPage.pageName;
            }
            _currentIndex = v;
          });
        }
      },
      items: userType == UserType.STUDENT ? studentItemsNew : bottomBarItemsNew,
    );
  }
}
