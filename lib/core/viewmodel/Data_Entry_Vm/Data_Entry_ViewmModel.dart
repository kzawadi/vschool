import 'package:ourESchool/core/Models/data_entry/data_entry.dart';
import 'package:ourESchool/core/services/data_Entry/data_entry_service.dart';
import 'package:ourESchool/imports.dart';
import 'package:stacked/stacked.dart';

class DataEntryViewModel extends BaseViewModel {
  DataEntryService _dataEntryService = locator<DataEntryService>();

  DataEntryViewModel();
  List<UserEntryData> get userdata => _dataEntryService.userData;

  getData() async {
    setBusy(true);
    await _dataEntryService.getData();
    notifyListeners();
    setBusy(false);
  }

  postData({List<UserEntryData> userEntryData}) async {
    setBusy(true);
    await _dataEntryService.postData(userEntryData: userEntryData);
    setBusy(false);
  }
}
