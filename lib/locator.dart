import 'package:get_it/get_it.dart';
import 'package:ourESchool/UI/Utility/firebase_notifications.dart';
import 'package:ourESchool/UI/pages/feed/announcement_owner.dart';
import 'package:ourESchool/UI/pages/feed/feed_viewModel.dart';
import 'package:ourESchool/UI/pages/libary/library_ViewModel.dart';
import 'package:ourESchool/UI/pages/libary/library_services.dart';
// import 'package:ourESchool/UI/Utility/data_importer.dart';
import 'package:ourESchool/core/services/analytics_service.dart';
import 'package:ourESchool/core/services/data_Entry/data_entry_service.dart';
import 'package:ourESchool/core/services/feed_services/feed_services.dart';
import 'package:ourESchool/core/services/student_data_Entry/student_data_entry_service.dart';
import 'package:ourESchool/core/services/data_Entry/Data_Entry_ViewmModel.dart';
import 'package:ourESchool/core/services/student_data_Entry/student_Data_Entry_VM.dart';
import 'package:ourESchool/core/viewmodel/fees/fees_entry_model.dart';
import 'package:ourESchool/core/viewmodel/fees/fees_page_model.dart';
import 'package:stacked_services/stacked_services.dart';

import 'core/viewmodel/Wall/CreateWallModel.dart';
import 'core/viewmodel/Wall/WallPageModel.dart';
import 'imports.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // locator.registerLazySingleton(() => MainPageModel());
  // locator.registerSingleton(Services());z

  locator.registerLazySingleton(() => AnnouncementServices());
  locator.registerFactory(() => CreateAnnouncementModel());
  locator.registerFactory(() => AnnouncementPageModel());

  locator.registerLazySingleton(() => WallServices());
  locator.registerFactory(() => CreateWallModel());
  locator.registerFactory(() => WallPageModel());

  locator.registerLazySingleton(() => FeesServices());
  locator.registerFactory(() => CreateFeesModel());
  locator.registerFactory(() => FeesPageModel());

  locator.registerLazySingleton(() => SharedPreferencesHelper());
  locator.registerFactory(() => QuizStateModel());

  locator.registerLazySingleton(() => RepositoryCalendarific());
  locator.registerFactory(() => HolidayModel());

  locator.registerLazySingleton(() => AuthenticationServices());
  locator.registerFactory(() => LoginPageModel());

  locator.registerLazySingleton(() => ProfileServices());
  locator.registerLazySingleton(() => ProfilePageModel());

  locator.registerLazySingleton(() => StorageServices());

  locator.registerLazySingleton(() => AssignmentServices());
  locator.registerFactory(() => AssignmentPageModel());

  locator.registerLazySingleton(() => ChatServices());
  locator.registerFactory(() => ChatUsersListPageModel());
  locator.registerFactory(() => MessagingScreenPageModel());

  locator.registerLazySingleton(() => AnalyticsService());
  locator.registerLazySingleton(() => DataEntryService());
  locator.registerLazySingleton(() => StudentDataEntryService());

  locator.registerLazySingleton(() => DataEntryViewModel());
  locator.registerLazySingleton(() => StudentDataEntryViewModel());

  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => OwnerViewModel());

  locator.registerLazySingleton(() => FeedServices());
  locator.registerLazySingleton(() => FeedViewModel());

  // locator.registerLazySingleton(() => FirebaseNotifications());

  locator.registerLazySingleton(() => LibraryServices());
  locator.registerLazySingleton(() => LibaryViewModel());
}
