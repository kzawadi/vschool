import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ourESchool/UI/Utility/networkexception.dart';
import 'package:ourESchool/UI/resources/utility.dart';
import 'package:ourESchool/core/Models/fees/fees_model.dart';
import 'package:ourESchool/core/services/Services.dart';

class FeesServices extends Services {
  DocumentSnapshot feessnapshot;
  List<DocumentSnapshot> first;
  static const _DEFAULT_TIMEOUT = Duration(seconds: 10);

  Future<Fees> getFees({String studentId}) async {
    if (schoolCode == null) {
      await getSchoolCode();
    }

    /// this fetch the latest document in collection

    final QuerySnapshot _feessnapshot = await schoolRef
        .collection(schoolCode.toUpperCase().trim())
        .document('fees')
        .collection(studentId)
        .limit(1)
        .orderBy('timestamp', descending: true)
        .getDocuments()
        .timeout(
          _DEFAULT_TIMEOUT,
          onTimeout: () => Future.error(
            NetworkException(
                "Unable to retrieve your data. Please check your network connection."),
          ),
        );

    cprint(_feessnapshot.documents.first.data.toString(),
        event: 'fees retrived is');

    return Fees.fromSnapshot(_feessnapshot.documents.first);
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
