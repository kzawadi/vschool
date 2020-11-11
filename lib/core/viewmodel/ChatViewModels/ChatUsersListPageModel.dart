// import 'package:ourESchool/imports.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ourESchool/core/Models/User.dart';
import 'package:ourESchool/core/services/ChatServices.dart';
import 'package:ourESchool/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:ourESchool/UI/resources/utility.dart';

class ChatUsersListPageModel extends BaseViewModel {
  ChatUsersListPageModel();

  ChatServices _chatServices = locator<ChatServices>();
  // ProfileServices _profileServices = locator<ProfileServices>();

  Map<String, DocumentSnapshot> get studentsSnapshot =>
      _chatServices.studentsDocumentSnapshots;

  Map<String, DocumentSnapshot> get teachersSnapshot =>
      _chatServices.teachersDocumentSnapshots;

  Map<String, User> get studentListMap => _chatServices.studentListMap;

  Map<String, User> get teachersListMap => _chatServices.teachersListMap;

  Map<String, List<User>> get studentsParentListMap =>
      _chatServices.studentsParentListMap;

  List<User> get childrens => _chatServices.childrens;

  User _selectedChild = User();

  User get selectedChild => _selectedChild;

  set selectedChild(User newUser) {
    _selectedChild = newUser;
    notifyListeners();
  }

  getChildrens() async {
    setBusy(true);
    await _chatServices.getChildrens();
    setBusy(false);
  }

  getAllStudent({String standard = '', String division = ''}) async {
    setBusy(true);
    await _chatServices.getStudents(standard: standard, division: division);
    setBusy(false);
  }

  getSingleStudentData(DocumentSnapshot documentSnapshot) async {
    // setState(ViewState.Busy);
    User user = await _chatServices.getUser(documentSnapshot);
    _chatServices.studentListMap.putIfAbsent(documentSnapshot.id, () => user);
    // await _chatServices.getParents(documentSnapshot);
    notifyListeners();
    // setState(ViewState.Idle);
  }

  getParents(DocumentSnapshot documentSnapshot) async {
    setBusy(true);
    print('Parent Data Fetching Started');
    await _chatServices.getParents(documentSnapshot);
    setBusy(false);
    print('Parent Data Fetched');
  }

  getAllTeachers({String standard = '', String division = ''}) async {
    setBusy(true);
    cprint("...activated...");
    teachersListMap.clear();
    teachersSnapshot.clear();
    await _chatServices.getTeachers(division: division, standard: standard);
    setBusy(false);
  }

  Future<User> getSingleTeacherData(DocumentSnapshot documentSnapshot) async {
    // setState(ViewState.Busy);
    User user = await _chatServices.getUser(documentSnapshot);
    _chatServices.teachersListMap.putIfAbsent(documentSnapshot.id, () => user);
    await _chatServices.getParents(documentSnapshot);
    notifyListeners();
    return user;
    // setState(ViewState.Idle);
  }

  onRefereshStudent({String standard, String division}) async {
    _chatServices.studentsDocumentSnapshots.clear();
    await getAllStudent(standard: standard, division: division);
  }
}
