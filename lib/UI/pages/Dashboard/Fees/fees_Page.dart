import 'package:ourESchool/UI/pages/Dashboard/Fees/dashboard.dart';
import 'package:ourESchool/core/Models/fees/fees_model.dart';
import 'package:ourESchool/core/viewmodel/fees/fees_page_model.dart';
import 'package:ourESchool/imports.dart';
import 'package:stacked/stacked.dart';

class FeesPage extends StatefulWidget {
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

class _WallPageState extends State<FeesPage> {
  String targeteid;
  ScrollController controller;
  FeesPageModel model = FeesPageModel();

  @override
  Widget build(BuildContext context) {
    targeteid = widget.user.id;

    return ViewModelBuilder<FeesPageModel>.reactive(
      viewModelBuilder: () => FeesPageModel(),
      onModelReady: (model) => model.getFees(targeteid),
      builder: (context, model, child) {
        this.model = model;
        return model.isBusy
            ? kBuzyPage(color: Theme.of(context).primaryColor)
            : FeesPageDash(
                fees: Fees.fromSnapshot(model.feessnapshot),
              );
      },
    );
  }
}
