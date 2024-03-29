import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ourESchool/UI/Utility/constants.dart';
import 'package:ourESchool/core/Models/school_wall/wall_model.dart';
import 'package:ourESchool/core/services/Services.dart';
import 'package:ourESchool/core/services/StorageServices.dart';
import 'package:ourESchool/locator.dart';
import 'package:path/path.dart' as p;

class WallServices extends Services {
  StorageServices _storageServices = locator<StorageServices>();
  DocumentSnapshot wallsnapshot;

  WallServices() {
    getFirebaseUser();
    getSchoolCode();
  }

  init() async {
    if (firebaseUser == null) await getFirebaseUser();
    if (schoolCode == null) await getSchoolCode();
  }

  getWall(
    String stdDivGlobal,
  ) async {
    if (schoolCode == null) await getSchoolCode();

    DocumentReference wall =
        wallRef.collection(schoolCode.toUpperCase().trim()).doc('wall');

    DocumentSnapshot data = await wall.get();

    wallsnapshot = data;
    print('wall retrived is $wall'.toString());
    print('wall retrived is $wallsnapshot'.toString());
  }

  postWall(Wall wall) async {
    SetOptions options = SetOptions(merge: true);
    if (schoolCode == null) await getSchoolCode();

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
    DocumentReference _wallPostRef =
        wallRef.collection(schoolCode.toUpperCase().trim()).doc('wall');

    wall.photoPath = filePath;
    Map wallMap = wall.toJson();

    await _wallPostRef.set(wallMap, options);
    print(wallMap.toString());
  }
}
