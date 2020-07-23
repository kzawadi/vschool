import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ourESchool/core/Models/fees/fees_model.dart';
import 'package:ourESchool/core/services/Services.dart';

class FeesServices extends Services {
  DocumentSnapshot feessnapshot;
  List<DocumentSnapshot> first;

  // FeesServices() {
  //   getFirebaseUser();
  //   getSchoolCode();
  // }

  // init() async {
  //   if (firebaseUser == null) await getFirebaseUser();
  //   if (schoolCode == null) await getSchoolCode();
  // }

  getFees(
    String studentId,
  ) async {
    if (schoolCode == null) await getSchoolCode();

    CollectionReference _feesRef = schoolRef
        .collection(schoolCode.toUpperCase().trim())
        .document('fees')
        .collection(studentId);

    /// this fetch the latest document in collection

    QuerySnapshot data = await _feesRef
        .limit(1)
        .orderBy('timestamp', descending: true)
        .getDocuments();
    first = data.documents;
    feessnapshot = first.first;

    print('fees retrived is $data'.toString());
    print('fees retrived is $feessnapshot'.toString());
  }

  postFees(Fees fees, String studentId) async {
    if (schoolCode == null) await getSchoolCode();

    fees.timestamp = Timestamp.now();

    CollectionReference _feesRef = schoolRef
        .collection(schoolCode.toUpperCase().trim())
        .document('fees')
        .collection(studentId);
    //.document();

    fees.to = studentId;

    Map feesMap = fees.toJson();

    await _feesRef.add(feesMap);
    print(feesMap.toString());
  }
}
