import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:ourESchool/imports.dart';

class Home extends StatefulWidget {
  static const id = 'Home';
  Home({Key key}) : super(key: key);

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with Services {
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
    getFirebaseUser();
    super.initState();
    if (Platform.isIOS) {
      iosSubscription = cloudmesaging.onIosSettingsRegistered.listen((data) {
        print(data);
        _saveDeviceToken();
      });

      cloudmesaging.requestNotificationPermissions(IosNotificationSettings());
    } else {
      _saveDeviceToken();
    }

    cloudmesaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        // final snackbar = SnackBar(
        //   content: Text(message['notification']['title']),
        //   action: SnackBarAction(
        //     label: 'Go',
        //     onPressed: () => null,
        //   ),
        // );

        // Scaffold.of(context).showSnackBar(snackbar);
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: ListTile(
              title: Text(message['notification']['title']),
              subtitle: Text(message['notification']['body']),
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.amber,
                child: Text('Ok'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
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
  }

  @override
  void dispose() {
    if (iosSubscription != null) iosSubscription.cancel();
    super.dispose();
  }

  _saveDeviceToken() async {
    // FirebaseUser currentUser =
    //     Provider.of<FirebaseUser>(context, listen: false);

    // Get the current user
    //String uid = 'jeffd23';
    // FirebaseUser user = await _auth.currentUser();

    // Get the token for this device
    String fcmToken = await cloudmesaging.getToken();
    if (firebaseUser == null) await getFirebaseUser();

    // FirebaseUser curent = await getFirebaseUser();
    print('curent user id is $firebaseUser'.toString());

    // Save it to Firestore
    if (fcmToken != null) {
      var tokens = firestore
          .collection('users')
          .document(firebaseUser.uid)
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

  /// Subscribe the user to a topic
  _subscribeToTopic() async {
    // Subscribe the user to a topic
    cloudmesaging.subscribeToTopic('puppies');
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
    return Container(
      child: Scaffold(
        appBar: TopBar(
          buttonHeroTag: 'profileeee',
          title: pageName,
          child: Image(
            height: 30,
            width: 30,
            image: setImage(user),
          ),
          onPressed: () {
            if (userType == UserType.PARENT) {
              kopenPage(context, GuardianProfilePage());
            } else {
              kopenPage(context, ProfilePage());
            }
          },
        ),
        floatingActionButton: Visibility(
          visible: isTeacher,
          child: FloatingActionButton(
            onPressed: () {
              kopenPageSlide(context, CreateAnnouncement());
            },
            child: Icon(Icons.add),
            backgroundColor: Colors.red,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
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
      ),
    );
  }

  List<BubbleBottomBarItem> studentItems = [
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
