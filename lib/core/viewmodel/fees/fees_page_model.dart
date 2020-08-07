import 'package:ourESchool/core/Models/fees/fees_model.dart';
import 'package:ourESchool/core/services/feesServices/feesServices.dart';
import 'package:ourESchool/locator.dart';
import 'package:stacked/stacked.dart';

class FeesPageModel extends FutureViewModel<Fees> {
  final studentId;
  FeesServices _feesServices = locator<FeesServices>();

  FeesPageModel({this.studentId});

  Future<Fees> getFees() async {
    return _feesServices.getFees(studentId: studentId);
  }

  @override
  Future<Fees> futureToRun() => getFees();
}
