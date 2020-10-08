// ViewModel
import 'package:ourESchool/UI/pages/libary/library_services.dart';
import 'package:ourESchool/core/Models/library/library_model.dart';
import 'package:ourESchool/core/services/analytics_service.dart';
import 'package:ourESchool/locator.dart';
import 'package:stacked/stacked.dart';

class CreateLibaryViewModel extends BaseViewModel {
  final LibraryServices _feedServices = locator<LibraryServices>();
  final AnalyticsService _analyticsService = locator<AnalyticsService>();

  postLibrary({Classlibrary classlibrary}) {
    setBusy(true);
    _feedServices.uploadLibary(classlibrary: classlibrary);
    setBusy(false);
  }
}
