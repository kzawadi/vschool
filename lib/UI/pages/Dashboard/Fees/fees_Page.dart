import 'package:ourESchool/UI/resources/colors.dart';

import 'package:stacked/stacked.dart';

import 'package:ourESchool/UI/pages/Dashboard/Fees/dashboard.dart';
import 'package:ourESchool/core/Models/fees/fees_model.dart';
import 'package:ourESchool/core/viewmodel/fees/fees_page_model.dart';
import 'package:ourESchool/imports.dart';

class FeesPage extends StatelessWidget {
  final User student;
  final Fees fees;

  FeesPage({Key key, this.student, this.fees}) : super(key: key);
  String get screenName => string.fees + 'Page';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FeesPageModel>.reactive(
      viewModelBuilder: () => FeesPageModel(studentId: student.id),
      onModelReady: (model) => model.futureToRun(),
      builder: (context, model, child) {
        return model.isBusy
            ? kBuzyPage(color: MyColors.magicMint)
            : FeesPageDash(
                fees: model.data,
              );
      },
    );
  }
}
