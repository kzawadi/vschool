import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:ourESchool/UI/Utility/constants.dart';
import 'dart:convert';
import 'package:ourESchool/core/Models/school_wall/wall_model.dart';
import 'package:ourESchool/core/services/Services.dart';
import 'package:ourESchool/core/services/StorageServices.dart';
import 'package:ourESchool/locator.dart';
import 'package:path/path.dart' as p;

class Wallservices extends Services {
  StorageServices _storageServices = locator<StorageServices>();
  DocumentSnapshot lastPostSnapshot = null;
  List<DocumentSnapshot> postDocumentSnapshots = new List<DocumentSnapshot>();

  Wallservices() {
    getFirebaseUser();
    getSchoolCode();
  }

  init() async {
    if (firebaseUser == null) await getFirebaseUser();
    if (schoolCode == null) await getSchoolCode();
  }

  getAnnouncements(
    String stdDivGlobal,
  ) async {
    // List<DocumentSnapshot> _data = new List<DocumentSnapshot>();

    if (schoolCode == null) await getSchoolCode();

    var _wallRef = (await wallRef());
    QuerySnapshot data;
    //  = await _schoolRef.getDocuments();
    if (lastPostSnapshot == null)
      data = await _wallRef
          .orderBy('timeStamp', descending: true)
          .limit(10)
          .getDocuments();
    else
      data = await _wallRef
          .orderBy('timeStamp', descending: true)
          .startAfter([lastPostSnapshot['timeStamp']])
          .limit(5)
          .getDocuments();

    if (data != null && data.documents.length > 0) {
      lastPostSnapshot = data.documents[data.documents.length - 1];
      postDocumentSnapshots.addAll(data.documents);
    } else {
      //No More post Available
    }
  }

  postAnnouncement(Wall wall) async {
    // if (firebaseUser == null) await getFirebaseUser();
    if (schoolCode == null) await getSchoolCode();

    //Timestmap will be directly set by Firebase Functions(througn REST Api)
    // i am trying not to use function
    wall.timestamp = Timestamp.now();

    String fileName = "";
    String filePath = "";

    if (wall.photoUrl != '') {
      fileName = createCryptoRandomString(8) +
          createCryptoRandomString(8) +
          p.extension(wall.photoUrl);

      wall.photoUrl =
          await _storageServices.uploadWallPhoto(wall.photoUrl, fileName);

      filePath = '${Services.country}/$schoolCode/Walls/$fileName';
    }
    wall.photoPath = filePath;
    Map wallMap = wall.toJson();

    var body = json.encode({
      //"schoolCode": schoolCode.toUpperCase(),
      //"country": Services.country,
      "wall": wallMap
    });

    print(body.toString());

    final response = await http.post(
      postAnnouncemnetUrl,
      body: body,
      headers: headers,
    );

    if (response.statusCode == 200) {
      print("Post posted Succesfully");
      print(json.decode(response.body).toString());
    } else {
      print("Post posting failed");
    }
  }
}
