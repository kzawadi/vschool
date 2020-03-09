import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ourESchool/core/Models/fees/fees_model.dart';
import 'package:ourESchool/core/services/Services.dart';

class FeesServices extends Services {
  //StorageServices _storageServices = locator<StorageServices>();
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

    // var fees = (await schoolRefwithCode())
    //     .document('fees')
    //     .collection(studentId)
    //     .document('fees');

    DocumentReference _feesRef = schoolRef
        .collection(schoolCode.toUpperCase().trim())
        .document('fees')
        .collection(studentId)
        .document('myfees');

    DocumentSnapshot data = await _feesRef.get();
    feessnapshot = data;

    //TODO remember to limit and fetch the lastest only
    // // QuerySnapshot data = await fees.getDocuments();

    // if (data != null && data.documents.length > 0) {
    //   // feessnapshot = data.documents[data.documents.length - 1];
    //   //feessnapshot.addAll(data.documents);

    // } else {
    //   print('no more fees');
    //   //No More post Available
    // }

    //feessnapshot = data;
    print('fees retrived is $data'.toString());
    print('fees retrived is $feessnapshot'.toString());
  }

  postFees(Fees fees, String studentId) async {
    //String studentId;
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
