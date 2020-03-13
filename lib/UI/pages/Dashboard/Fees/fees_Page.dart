import 'package:ourESchool/UI/pages/Dashboard/Fees/dashboard.dart';
import 'package:ourESchool/core/Models/fees/fees_model.dart';
import 'package:ourESchool/core/viewmodel/fees/fees_page_model.dart';
import 'package:ourESchool/imports.dart';

class FeesPage extends StatefulWidget with AnalyticsScreen {
  FeesPage({
    Key key,
    this.targetId,
    this.user,
    this.fees,
  }) : super(key: key) {
    // setCurrentScreen();
  }

  final String targetId;
  final User user;
  final Fees fees;

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
    targeteid = widget.user.id;

    return BaseView<FeesPageModel>(
      onModelReady: (model) => model.getFees(targeteid),
      builder: (context, model, child) {
        this.model = model;
        return model.state == ViewState.Busy
            ? kBuzyPage(color: Theme.of(context).primaryColor)
            : FeesPageDash(
                fees: Fees.fromSnapshot(model.feessnapshot),
              );
      },
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
