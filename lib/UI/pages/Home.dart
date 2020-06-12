import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ourESchool/imports.dart';
import 'package:ourESchool/core/helpers/shared_preferences_helper.dart';

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

  var currentIndex = 0;
  Color background = Colors.white;
  // AuthenticationServices _auth = locator<AuthenticationServices>();
  bool isTeacher = false;
  // MainPageModel mainPageModel;

  // _auth.userType == UserType.STUDENT ? false : true;
  String pageName = string.home;

  List<Widget> pages = [
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
        initializationSettingsAndroid, initializationSettingsIOS);
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
      importance: Importance.Max,
      priority: Priority.High,
    );
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);

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
    User user = Provider.of<User>(context, listen: false);
    return Scaffold(
      key: _scaffoldKey,
      // appBar: TopBar(
      //   buttonHeroTag: 'profileeee',
      //   title: pageName,
      //   child: Container(
      //     height: 45,
      //     width: 45,
      //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      //     child: ClipRRect(
      //         borderRadius: BorderRadius.circular(20),
      //         child: Image(
      //           image: setImage(user),
      //           fit: BoxFit.cover,
      //         )),
      //   ),
      //   //  CircleAvatar(
      //   //   backgroundImage: setImage(user),
      //   //   // radius: 20,
      //   //   // child: ClipOval(
      //   //   //   child: Image(
      //   //   //     fit: BoxFit.fill,
      //   //   //     image: setImage(user),
      //   //   //   ),
      //   //   // ),
      //   // ),
      //   onPressed: () {
      //     if (userType == UserType.PARENT) {
      //       kopenPage(
      //           context, GuardianProfilePage(), 'Guardian_Profile_Page');
      //     } else {
      //       kopenPage(context, ProfilePage(), 'ProfilePage');
      //     }
      //   },
      // ),
      // floatingActionButton: Visibility(
      //   visible: isTeacher,
      //   child: FloatingActionButton(
      //     onPressed: () {
      //       kopenPageSlide(context, CreateAnnouncement());
      //     },
      //     child: Icon(Icons.add),
      //     backgroundColor: Colors.red,
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: buildBubbleBottomBar(userType),
      body: userType == UserType.STUDENT
          ? IndexedStack(
              index: currentIndex,
              children: studentPages,
            )
          : IndexedStack(
              index: currentIndex,
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

  List<BubbleBottomBarItem> bottomBarItems = [
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

  BubbleBottomBar buildBubbleBottomBar(UserType userType) {
    return BubbleBottomBar(
      backgroundColor: Theme.of(context).canvasColor,
      opacity: .2,
      currentIndex: currentIndex,
      onTap: (v) {
        if (userType == UserType.STUDENT) {
          setState(() {
            if (v == 0) {
              pageName = StudentDashboard.pageName;
            } else {
              pageName = SettingPage.pageName;
            }
            currentIndex = v;
          });
        } else {
          setState(() {
            if (v == 0) {
              pageName = MainDashboard.pageName;
            } else if (v == 1) {
              pageName = ChatPage.pageName;
            } else if (v == 2) {
              pageName = SettingPage.pageName;
            }
            currentIndex = v;
          });
        }
      },
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(16),
      ),
      elevation: 10,
      fabLocation: isTeacher ? BubbleBottomBarFabLocation.end : null, //new
      hasNotch: isTeacher, //new
      hasInk: true, //new, gives a cute ink effect
      inkColor: Colors.black12, //optional, uses theme color if not specified
      items: userType == UserType.STUDENT ? studentItems : bottomBarItems,
    );
  }
}
