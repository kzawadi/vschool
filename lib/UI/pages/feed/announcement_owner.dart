import 'package:ourESchool/core/Models/User.dart';
import 'package:ourESchool/imports.dart';
import 'package:stacked/stacked.dart';

class OwnerViewModel extends FutureViewModel<User> {
  final UserType usertype;
  final String id;
  OwnerViewModel([this.usertype, this.id]);

  Future<User> getUser() => locator<ProfilePageModel>()
      .getUserProfileDataByIdForAnnouncement(usertype, id);
  @override
  Future<User> futureToRun() => getUser();
}
