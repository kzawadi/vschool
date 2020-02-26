import 'package:ourESchool/UI/pages/Dashboard/Wall/CreateWall.dart';
import 'package:ourESchool/UI/pages/shared/wallViewer.dart';
import 'package:ourESchool/core/Models/school_wall/wall_model.dart';
import 'package:ourESchool/core/viewmodel/Wall/WallPageModel.dart';
import 'package:ourESchool/imports.dart';

class WallPage extends StatefulWidget with AnalyticsScreen {
  WallPage({
    Key key,
    this.announcementFor = '',
  }) : super(key: key) {
    // setCurrentScreen();
  }

  final String announcementFor;

  @override
  _WallPageState createState() => _WallPageState();

  @override
  String get screenName => string.wall + 'Page';
}

class _WallPageState extends State<WallPage>
    with AutomaticKeepAliveClientMixin {
  bool isTeacher = false;

  ScrollController controller;
  WallPageModel model = WallPageModel();
  String stdDiv_Global = 'Global';
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLast = false;
  bool isLoaded = false;
  String buttonLabel = 'Global';
  Wall wall;

  @override
  void initState() {
    controller = ScrollController()..addListener(_scrollListener);
    super.initState();
    stdDiv_Global =
        widget.announcementFor == '' ? 'Global' : widget.announcementFor;
  }

  @override
  void dispose() {
    controller.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    if (model.state == ViewState.Idle) {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        // setState(() => _isLoading = true);
        model.getAnnouncements(stdDiv_Global);
        // scaffoldKey.currentState.widget
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var userType = Provider.of<UserType>(context);
    User currentUser = Provider.of<User>(context);
    if (userType == UserType.TEACHER) {
      isTeacher = true;
    } else if (userType == UserType.PARENT) {
    } else if (userType == UserType.STUDENT) {
      if (!isLoaded) {
        stdDiv_Global =
            currentUser.standard + currentUser.division.toUpperCase();
        isLoaded = true;
      }

      print(stdDiv_Global);
    }
    return BaseView<WallPageModel>(
        onModelReady: (model) => model.getAnnouncements(stdDiv_Global),
        builder: (context, model, child) {
          this.model = model;
          return Scaffold(
            key: scaffoldKey,
            appBar: TopBar(
                buttonHeroTag: string.announcement,
                title: stdDiv_Global + " Posts",
                child: kBackBtn,
                onPressed: () {
                  kbackBtn(context);
                }),
            // floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
            floatingActionButton: Stack(
              children: <Widget>[
                Visibility(
                  visible: isTeacher,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(
                      elevation: 12,
                      onPressed: () {
                        kopenPageSlide(context, CreateWall(),
                            duration: Duration(milliseconds: 200));
                      },
                      child: Icon(Icons.add),
                      backgroundColor: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
            body: Center(
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: 700,
                ),
                child: model.wall.data == null
                    ? model.state == ViewState.Busy
                        ? kBuzyPage(color: Theme.of(context).accentColor)
                        : Container(
                            child: Center(
                              child: Text(
                                'No info available....!',
                                style: ksubtitleStyle.copyWith(fontSize: 25),
                              ),
                            ),
                            // color: Colors.red,
                          )
                    : WallViewer(
                        wall: Wall.fromSnapshot(model.wall),
                      ),
              ),
            ),
          );
        });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
