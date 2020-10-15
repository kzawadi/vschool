import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ourESchool/UI/resources/utility.dart';
import 'package:ourESchool/core/Models/library/library_model.dart';
import 'package:ourESchool/core/services/Services.dart';
import 'package:ourESchool/UI/Utility/networkexception.dart';

class LibraryServices extends Services {
  static const _DEFAULT_TIMEOUT = Duration(seconds: 10);

  List<Classlibrary> libraryList = [];

  void uploadLibary({Classlibrary classlibrary}) async {
    String cls = classlibrary.standard.toUpperCase() +
        classlibrary.division.toUpperCase();

    DocumentReference _libraryRef = (await schoolRefwithCode())
        .doc('library')
        .collection(cls)
        .doc(classlibrary.day);

    await _libraryRef.set(classlibrary.toJson()).timeout(
          _DEFAULT_TIMEOUT,
          onTimeout: () => Future.error(
            NetworkException(
                "Unable to Post your data. Please check your network connection."),
          ),
        );
    cprint('Libray posted succeful ${classlibrary.toJson()}',
        event: 'adding a Library in firestore');
  }

  Future<Null> getLibrary({String cls}) async {
    var _libraryRefGet = (await schoolRefwithCode())
        .doc('library')
        //todo remember to get class dynamicaly from the user of something like that
        .collection('8C')
        .get()
        .timeout(
          _DEFAULT_TIMEOUT,
          onTimeout: () => Future.error(
            NetworkException(
                "Unable to retrieve your data. Please check your network connection."),
          ),
        );

    await _libraryRefGet.then(
      (collection) => {
        collection.docs.forEach((doc) {
          var day = Classlibrary.fromJson(doc.data());
          cprint('docs ' + day.toString());
          libraryList.add(day);
        })
      },
    );
  }
}
