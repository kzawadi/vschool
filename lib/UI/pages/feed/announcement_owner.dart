import 'package:ourESchool/core/Models/User.dart';
import 'package:ourESchool/imports.dart';
import 'package:stacked/stacked.dart';

class OwnerViewModel extends FutureViewModel<User> {
  final UserType userType;
  final String id;

  OwnerViewModel([this.userType, this.id]);
  // RxValue<String> _id = RxValue<String>(initial: null);
  // String get id => _id.value;
  // RxValue<UserType> _userType = RxValue<UserType>(initial: null);
  // UserType get userType => _userType.value;

  // OwnerViewModel() {
  //   listenToReactiveValues([_id, _userType]);
  // }

  // final UserType usertype;
  // final String id;
  // OwnerViewModel([this.usertype, this.id]);

  Future<User> getUser() => locator<ProfilePageModel>()
      .getUserProfileDataByIdForAnnouncement(userType, id);
  @override
  Future<User> futureToRun() => getUser();
}
