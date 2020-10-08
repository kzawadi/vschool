import 'package:ourESchool/UI/resources/utility.dart';
import 'package:ourESchool/core/Models/library/library_model.dart';
import 'package:ourESchool/core/services/Services.dart';

class LibraryServices extends Services {
  void uploadLibary({Classlibrary classlibrary}) async {
    String cls = classlibrary.standard.toUpperCase() +
        classlibrary.division.toUpperCase();

    var _libraryref = (await schoolRefwithCode())
        .doc('library')
        .collection(cls)
        .doc(classlibrary.day);

    await _libraryref.set(classlibrary.toJson());
    cprint('Libray posted succeful ${classlibrary.toJson()}',
        event: 'adding a Library in firestore');
  }
}
