import 'package:ourESchool/core/Models/data_entry/data_entry.dart';
import 'package:ourESchool/core/services/data_Entry/data_entry_service.dart';
import 'package:ourESchool/locator.dart';
import 'package:stacked/stacked.dart';

class DataEntryViewModel extends FutureViewModel<List<UserEntryData>> {
  DataEntryService _dataEntryService = locator<DataEntryService>();

  // DataEntryViewModel();
  // List<UserEntryData> get userdata => _dataEntryService.userData;

  // getData() {
  //   setBusy(true);
  //   _dataEntryService.clearData();
  //   _dataEntryService.getData();
  //   notifyListeners();
  //   setBusy(false);
  // }

  postData({List<UserEntryData> userEntryData}) async {
    setBusy(true);
    await _dataEntryService.postData(userEntryData: userEntryData);
    setBusy(false);
  }

  @override
  Future<List<UserEntryData>> futureToRun() => _dataEntryService.getData();
}
