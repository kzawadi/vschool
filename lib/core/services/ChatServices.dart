import 'package:ourESchool/imports.dart';

class ChatServices extends Services {
  ProfileServices _profileServices = locator<ProfileServices>();
  User _currentUser = User();

  Map<String, DocumentSnapshot> studentsDocumentSnapshots =
      Map<String, DocumentSnapshot>();

  Map<String, DocumentSnapshot> teachersDocumentSnapshots =
      Map<String, DocumentSnapshot>();

  Map<String, User> studentListMap = Map();

  Map<String, User> teachersListMap = Map();

  Map<String, List<User>> studentsParentListMap = Map();

  List<User> get childrens => _profileServices.childrens;
  // SharedPreferencesHelper _sharedPreferencesHelper =
  //     locator<SharedPreferencesHelper>();
  List<String> childrensId = [];
  List<String> parentsId = [];

  ChatServices() {
    // getSchoolCode();
    getFirebaseUser();
  }

  getChildrens() async {
    await _profileServices.getChildrens();
  }

  getTeachers({String standard = '', String division = ''}) async {
    teachersDocumentSnapshots.clear();
    teachersListMap.clear();
    String _standard = standard + division.toUpperCase();

    // String _parents = await sharedPreferencesHelper.getParentsIds();
    // if (_parents == 'N.A') {
    //   this.parentsId = [];
    //   return;
    // }

    // Map<String, String> parentIds = Map.from(
    //   jsonDecode(_parents).map(
    //     (key, values) {
    //       String value = values.toString();
    //       return MapEntry(key, value);
    //     },
    //   ),
    // );
    // childrensId = parentIds.values.toList();
    // print('the parente usernames which are ID  $childrensId');

    var ref = (await schoolRefwithCode()).doc('Teachers').collection(_standard);

    QuerySnapshot data = await ref.get();

    if (data != null && data.docs.length > 0) {
      print('Data Added');
      print(data.docs.first.id);

      data.docs.forEach(
        (document) => {
          teachersDocumentSnapshots.putIfAbsent(document.id, () => document)
        },
      );
    }
  }

  _getCurrentUser(User user) {
    _currentUser = user;
  }

  getStudents({String standard = '', String division = ''}) async {
    String _standard;
    if (standard == '' && division == '') {
      String userDataModel = await sharedPreferencesHelper.getUserDataModel();
      if (userDataModel == 'N.A') {
        //! this is how they listen to a stream
        _profileServices.loggedInUserStream.stream.listen(_getCurrentUser);
      } else {
        _currentUser = User.fromJson(json.decode(userDataModel));
      }
      print('The student in getStudents are  $_currentUser');

      _standard = _currentUser.standardDivision();
      if (_standard == '') {
        _standard = 'N.A';
        return;
      }
    } else {
      _standard = standard + division.toUpperCase();
    }

    String _childrens = await sharedPreferencesHelper.getChildIds();
    if (_childrens == 'N.A') {
      this.childrensId = [];
      return;
    }

    Map<String, String> childIds = Map.from(
      jsonDecode(_childrens).map(
        (key, values) {
          String value = values.toString();
          return MapEntry(key, value);
        },
      ),
    );
    childrensId = childIds.values.toList();
    print('the childe usernames which are ID  $childrensId');

    for (String id in childrensId) {
      final Query _studentsRef = (await schoolRefwithCode())
          .doc("Students")
          .collection(_standard)
          .where("userId", isEqualTo: id);

      QuerySnapshot data = await _studentsRef.get();

      if (data != null && data.docs.length > 0) {
        data.docs.forEach((document) => {
              studentsDocumentSnapshots.putIfAbsent(document.id, () => document)
            });
      }
    }
  }

  Future<User> getUser(DocumentSnapshot documentSnapshot) async {
    User user = await _profileServices
        .getUserDataFromReference(documentSnapshot.data()["id"]);

    // studentListMap.putIfAbsent(documentSnapshot.documentID, () => user);

    return user;
  }

  Future<List<User>> getParents(DocumentSnapshot documentSnapshot) async {
    List<User> parents = [];
// the index is being checked and compared to documentsnapshot length -1 so to
//eliminated the field [userId] when iterating this function
//todo change a firebase function to make sure the field [userId] is always the
//todo last either by renaming it to [z_userId]
    for (int index = 1; index < documentSnapshot.data().length - 1; index++) {
      parents.add(await _profileServices.getUserDataFromReference(
          documentSnapshot.data()[index.toString()] as DocumentReference));
    }

    studentsParentListMap.putIfAbsent(documentSnapshot.id, () => parents);

    return parents;
  }

  /// this is where all the messages get fetched
  Stream<List<Message>> getMessages({
    @required User other,
    @required User student,
    @required User loggedIn,
    ScrollController scrollController,
  }) async* {
    var ref = (await schoolRefwithCode())
        .doc('Chats')
        .collection(student.standardDivision())
        .doc('Parent-Teacher')
        .collection(loggedIn.id)
        .doc(other.id);

    String chatRef = 'N.A';
    //todo change source to server and cache
    await ref
        .get()
        .then((snapShot) => {chatRef = snapShot.data()[student.id].toString()});

    await for (QuerySnapshot snap in firestore
        .collection(chatRef)
        .orderBy('timestamp', descending: true)
        .limit(100) //trying to limit the amount of query in firestore
        .snapshots()) {
      try {
        List<Message> messages =
            snap.docs.map((doc) => Message.fromSnapShot(doc)).toList();
        int smsno = messages.length;
        print('the number of sms fetched is $smsno');
        yield messages;
        Future.delayed(Duration(milliseconds: 200));
        scrollController.animateTo(
          0.0,
          duration: const Duration(milliseconds: 10),
          curve: Curves.easeOut,
        );
      } catch (e) {
        print(e);
      }
    }
  }

  Future sendMessage(Message message, User student) async {
    var ref = (await schoolRefwithCode())
        .doc('Chats')
        .collection(student.standardDivision())
        .doc('Chat')
        .collection(getChatId([message.to, message.for_, message.from]));

    await ref.add(message.toJson());

    print('Message Sent');
  }

  /// This will take in a filtered list of messages from the
  /// viewModel and call the references to change a property
  /// `readReceipt` from `false` to `true`
  delivery(
    List<Message> messagesList,
    User student,
  ) async {
    WriteBatch batch = firestore.batch();

    for (Message message in messagesList) {
      String to = message.to;
      String forr = message.for_;
      String from = message.from;
      String id = message.id;
      DocumentReference ref = (await schoolRefwithCode())
          .doc('Chats')
          .collection(student.standardDivision())
          .doc('Chat')
          .collection(getChatId([to, forr, from]))
          .doc(id);
      batch.update(ref, {"readReceipt": true});
    }
    batch.commit();
    print('Messages Delivered the batch has been commited');
  }
}
