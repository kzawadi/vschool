import 'package:ourESchool/core/Models/student_data_entry/student_data_entry.dart';
import 'package:ourESchool/core/services/student_data_Entry/student_data_entry_service.dart';
import 'package:ourESchool/imports.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StudentDataEntryViewModel extends BaseViewModel {
  StudentDataEntryService _dataEntryService =
      locator<StudentDataEntryService>();
  DialogService _dialogService = locator<DialogService>();
  StudentDataEntryViewModel();
  List<StudentEntryData> get userdata => _dataEntryService.userData;

  getData() async {
    setBusy(true);
    await _dataEntryService.getData();
    notifyListeners();
    setBusy(false);
  }

  postData({List<StudentEntryData> userEntryData}) async {
    setBusy(true);
    await _dataEntryService.postData(userEntryData: userEntryData);
    setBusy(false);
  }
}
