import 'package:animations/animations.dart';
import 'package:ourESchool/UI/pages/Home_ViewModel.dart';
import 'package:ourESchool/UI/pages/Setting/SettingPage.dart';
import 'package:ourESchool/UI/pages/feed/feed_page.dart';
import 'package:ourESchool/UI/resources/colors.dart';
import 'package:ourESchool/imports.dart';
import 'package:stacked/stacked.dart';

class Home extends StatelessWidget {
  static const id = 'Home';
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      // fireOnModelReadyOnce: true,
      // disposeViewModel: false,
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => Scaffold(   
        body: PageTransitionSwitcher(
          duration: const Duration(milliseconds: 300),
          reverse: model.reverse,
          transitionBuilder: (
            Widget child,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return SharedAxisTransition(
              child: child,
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.horizontal,
            );
          },
          child: getViewForIndex(model.currentIndex),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        extendBody: true,
        // key: _scaffoldKey,
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
              currentIndex: model.currentIndex,
              iconSize: 22,
              onTap: model.setIndex,
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
      ),
    );
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return FeedPage();
      case 1:
        return MainDashboard();
      case 2:
        return ChatPage();
      case 3:
        return SettingPage();
      default:
        return FeedPage();
    }
  }
}
