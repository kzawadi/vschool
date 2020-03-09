import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ourESchool/core/Models/fees/fees_model.dart';
import 'package:ourESchool/core/services/Services.dart';

class FeesServices extends Services {
  DocumentSnapshot feessnapshot;

  FeesServices() {
    getFirebaseUser();
    getSchoolCode();
  }

  init() async {
    if (firebaseUser == null) await getFirebaseUser();
    if (schoolCode == null) await getSchoolCode();
  }

  getFees(
    String studentId,
  ) async {
    if (schoolCode == null) await getSchoolCode();

    DocumentReference _feesRef = schoolRef
        .collection(schoolCode.toUpperCase().trim())
        .document('fees')
        .collection(studentId)
        .document('myfees');

    DocumentSnapshot data = await _feesRef.get();
    feessnapshot = data;

    //TODO remember to limit and fetch the lastest only

    print('fees retrived is $data'.toString());
    print('fees retrived is $feessnapshot'.toString());
  }

  postFees(Fees fees, String studentId) async {
    if (schoolCode == null) await getSchoolCode();

    fees.timestamp = Timestamp.now();

    DocumentReference _feesRef = schoolRef
        .collection(schoolCode.toUpperCase().trim())
        .document('fees')
        .collection(studentId)
        .document('myfees');

    Map feesMap = fees.toJson();

    await _feesRef.setData(feesMap);
    print(feesMap.toString());
  }
}
