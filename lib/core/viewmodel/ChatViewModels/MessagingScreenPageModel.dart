import 'package:ourESchool/imports.dart';

class MessagingScreenPageModel extends BaseModel {
  ChatServices _chatServices = locator<ChatServices>();
  MessagingScreenPageModel();

  sendMessage({Message message, User student}) async {
    setState(ViewState.Busy);
    await _chatServices.sendMessage(message, student);
    setState(ViewState.Idle);
  }

  /// This will pass a filtered list of messages which have been fetched and viewd
  /// to the user and filtered them if alread marked and also if it does not belong
  /// to a sender by comparing the`user.id`
  delivery({List<Message> messagesList, User student, User user}) async {
    // todo shifting this logic to its service
    List<Message> filteredsms = messagesList
        .where(
          (e) => e.readReceipt == false && e.from != user.id,
        )
        .toList();
    if (filteredsms.isNotEmpty) {
      await _chatServices.delivery(filteredsms, student);
    }
  }

  Map<String, Message> messages = Map<String, Message>();

  set addNewMessage(Message newMessage) {
    messages.putIfAbsent(newMessage.id, () => newMessage);
    notifyListeners();
  }

  ChatServices get chatServices => _chatServices;

  // getMessages(
  //     {User other,
  //     User student,
  //     User loggedIn,
  //     ScrollController scrollController}) async* {
  //   setState2(ViewState.Busy);
  //   Stream<List<Message>> messages =
  //       _chatServices.getMessages(other, student, loggedIn);

  //   messages.listen((newMessages) {
  //     newMessages.forEach((newMessage) => {addNewMessage = newMessage});
  //   });
  // }
}
