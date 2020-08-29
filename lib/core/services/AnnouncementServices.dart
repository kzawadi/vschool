import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ourESchool/UI/Utility/constants.dart';
import 'package:ourESchool/core/Models/Announcement.dart';
import 'package:ourESchool/core/services/Services.dart';
import 'package:ourESchool/core/services/StorageServices.dart';
import 'package:ourESchool/locator.dart';
import 'package:path/path.dart' as p;

class AnnouncementServices extends Services {
  StorageServices _storageServices = locator<StorageServices>();
  DocumentSnapshot lastPostSnapshot = null;
  List<DocumentSnapshot> postDocumentSnapshots = new List<DocumentSnapshot>();

  /// This function retrive the post either global or class
  /// and it limits to 10 if no anything and limit to 5 if
  /// it has already done so
  getAnnouncements(
    String stdDivGlobal,
  ) async {
    var _postRef =
        (await schoolRefwithCode()).doc('Posts').collection(stdDivGlobal);
    QuerySnapshot data;
    //  = await _schoolRef.getDocuments();
    if (lastPostSnapshot == null)
      data =
          await _postRef.orderBy('timeStamp', descending: true).limit(40).get();
    else
      data = await _postRef
          .orderBy('timeStamp', descending: true)
          .startAfter([lastPostSnapshot.data()['timeStamp']])
          .limit(5)
          .get();

    if (data != null && data.docs.length > 0) {
      lastPostSnapshot = data.docs[data.docs.length - 1];
      postDocumentSnapshots.addAll(data.docs);
    } else {
      //No More post Available
    }
  }

  /// This function post the post either global or class
  /// oriented it uses a cloud function to do so
  postAnnouncement(Announcement announcement) async {
    // if (firebaseUser == null) await getFirebaseUser();
    if (schoolCode == null) await getSchoolCode();

    //Timestmap will be directly set by Firebase Functions(througn REST Api)
    // announcement.timestamp = Timestamp.now();

    String fileName = "";
    String filePath = "";
    String standard;

    if (announcement.photoUrl != '') {
      fileName = createCryptoRandomString(8) +
          createCryptoRandomString(8) +
          p.extension(announcement.photoUrl);

      announcement.photoUrl = await _storageServices.uploadAnnouncemantPhoto(
          announcement.photoUrl, fileName);

      filePath = '${Services.country}/$schoolCode/Posts/$fileName';
    }
    announcement.photoPath = filePath;
    Map announcementMap = announcement.toJson();

    if (announcement.forClass == 'Global') {
      standard = 'Global';
    } else
      standard = announcement.forClass + announcement.forDiv;

    var _postRef =
        (await schoolRefwithCode()).doc('Posts').collection(standard);

    _postRef.add(announcementMap);
    print('feed posted succeful');
  }

  deleteAnnouncement(String id, String stdDivGlobal) async {
    // Map announcementMap = announcement.toJson();

    var _postRef = (await schoolRefwithCode())
        .doc('Posts')
        .collection(stdDivGlobal)
        .doc(id);

    await _postRef.delete();
  }
}
