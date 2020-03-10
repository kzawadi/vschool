import 'package:ourESchool/UI/pages/Dashboard/Fees/dashboard.dart';
import 'package:ourESchool/UI/pages/shared/fees_viewer.dart';
import 'package:ourESchool/core/Models/fees/fees_model.dart';
import 'package:ourESchool/core/viewmodel/fees/fees_page_model.dart';
import 'package:ourESchool/imports.dart';

class FeesPage extends StatefulWidget with AnalyticsScreen {
  FeesPage({
    Key key,
    this.targetId,
    this.user,
  }) : super(key: key) {
    // setCurrentScreen();
  }

  final String targetId;
  final User user;

  @override
  _WallPageState createState() => _WallPageState();

  @override
  String get screenName => string.fees + 'Page';
}

class _WallPageState extends State<FeesPage>
    with AutomaticKeepAliveClientMixin {
  String targeteid;
  bool isTeacher = false;

  ScrollController controller;
  FeesPageModel model = FeesPageModel();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLast = false;
  bool isLoaded = false;
  String buttonLabel = 'Global';
  Fees fees;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var userType = Provider.of<UserType>(context, listen: false);
    targeteid = widget.user.id;
    User currentUser = Provider.of<User>(context, listen: false);
    if (userType == UserType.TEACHER) {
      isTeacher = true;
    } else if (userType == UserType.PARENT) {}
    if (userType == UserType.STUDENT) {
      if (!isLoaded) {
        // stdDiv_Global =
        //     currentUser.standard + currentUser.division.toUpperCase();
        isLoaded = true;
      }

      print(currentUser.id);
    }
    return BaseView<FeesPageModel>(
      onModelReady: (model) => model.getFees(targeteid),
      builder: (context, model, child) {
        this.model = model;
        return FeesPageDash(
          fees: Fees.fromSnapshot(model.feessnapshot),
        );
      },
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
