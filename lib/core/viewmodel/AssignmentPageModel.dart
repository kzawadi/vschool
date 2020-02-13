import 'package:ourESchool/imports.dart';

class AssignmentPageModel extends BaseModel {
  AssignmentServices _assignmentServices = locator<AssignmentServices>();

  List<DocumentSnapshot> get assignmentSnapshotList =>
      _assignmentServices.assignmnetDocumentSnapshots;

  AssignmentPageModel() {
    print('Assignment Page Model Created');
  }

  getAssignments(String stdDivGlobal) async {
    setState(ViewState.Busy);
    await _assignmentServices.getAssignments(stdDivGlobal);
    setState(ViewState.Idle);
  }

  addAssignment(Assignment assignment) async {
    setState(ViewState.Busy);
    await _assignmentServices.uploadAssignment(assignment);
    await Future.delayed(const Duration(seconds: 3), () {});
    setState(ViewState.Idle);
  }

  onRefresh(String stdDivGlobal) async {
    await getAssignments(stdDivGlobal);
  }

  @override
  void dispose() {
    assignmentSnapshotList.clear();
    _assignmentServices.lastAssignmnetSnapshot = null;
    super.dispose();
    print('Assignment Page Model Disposed');
  }
}
