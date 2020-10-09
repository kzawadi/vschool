// ViewModel
import 'package:ourESchool/UI/pages/libary/library_services.dart';
import 'package:ourESchool/core/Models/library/library_model.dart';
import 'package:ourESchool/core/services/analytics_service.dart';
import 'package:ourESchool/locator.dart';
import 'package:stacked/stacked.dart';

class LibaryViewModel extends BaseViewModel {
  final LibraryServices _libraryServices = locator<LibraryServices>();
  final AnalyticsService _analyticsService = locator<AnalyticsService>();

  List get library => _libraryServices.libraryList;

  postLibrary({Classlibrary classlibrary}) {
    setBusy(true);
    _libraryServices.uploadLibary(classlibrary: classlibrary);
    setBusy(false);
  }

  Future<Null> getLibrary() async {
    setBusy(true);
    await _libraryServices.getLibrary();
    notifyListeners();
    setBusy(false);
  }
}
