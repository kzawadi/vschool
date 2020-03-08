import 'package:get_it/get_it.dart';
import 'package:ourESchool/core/viewmodel/fees/fees_entry_model.dart';
import 'package:ourESchool/core/viewmodel/fees/fees_page_model.dart';

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
}
