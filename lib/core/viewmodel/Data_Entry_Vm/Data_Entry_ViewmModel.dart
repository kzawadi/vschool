import 'package:ourESchool/core/Models/data_entry/data_entry.dart';
import 'package:ourESchool/core/services/data_Entry/data_entry_service.dart';
import 'package:ourESchool/imports.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DataEntryViewModel extends BaseViewModel {
  DataEntryService _dataEntryService = locator<DataEntryService>();
  DialogService _dialogService = locator<DialogService>();
  DataEntryViewModel();
  List<UserEntryData> get userdata => _dataEntryService.userData;

  getData() async {
    setBusy(true);
    await _dataEntryService.getData();
    notifyListeners();
    setBusy(false);
  }
}
