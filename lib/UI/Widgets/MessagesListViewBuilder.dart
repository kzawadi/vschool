import '../../imports.dart';
import 'package:intl/intl.dart';

// List<String> messageDates = [];
// typedef void Read();
class MessagesListViewBuilder extends StatelessWidget {
  MessagesListViewBuilder({
    this.messagesList,
    this.scrollController,
    void read,
  });

  // List<String> messageDates = [];
  final List<Message> messagesList;
  String previusDate = '';
  final ScrollController scrollController;
  VoidCallback read;

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context, listen: false);
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      reverse: true,
      controller: scrollController,
      itemCount: messagesList.length,
      itemBuilder: (context, index) {
        bool showDate = false;
        print(messagesList.length.toString() + " " + index.toString());

        String currentDate = '';
        if (index == messagesList.length - 1) {
          if (previusDate == '') {
            previusDate = DateFormat("d MMM y").format(
              DateTime.parse(
                messagesList[index].timeStamp.toDate().toLocal().toString(),
              ),
            );
          }
          currentDate = DateFormat("d MMM y").format(
            DateTime.parse(
              messagesList[index].timeStamp.toDate().toLocal().toString(),
            ),
          );
          showDate = true;
          // if (previusDate != currentDate) {
          //   messageDates.add(
          //     DateFormat("d MMM y").format(
          //       DateTime.parse(
          //         messagesList[index].timeStamp.toDate().toLocal().toString(),
          //       ),
          //     ),
          //   );
          //   showDate = true;
          //   previusDate = currentDate;
          // }
        } else {
          if (previusDate == '') {
            previusDate = DateFormat("d MMM y").format(
              DateTime.parse(
                messagesList[index + 1].timeStamp.toDate().toLocal().toString(),
              ),
            );
          }
          currentDate = DateFormat("d MMM y").format(
            DateTime.parse(
              messagesList[index + 1].timeStamp.toDate().toLocal().toString(),
            ),
          );
          if (previusDate != currentDate) {
            // messageDates.add(
            //   DateFormat("d MMM y").format(
            //     DateTime.parse(
            //       messagesList[index + 1]
            //           .timeStamp
            //           .toDate()
            //           .toLocal()
            //           .toString(),
            //     ),
            //   ),
            // );
            showDate = true;
            previusDate = currentDate;
          }
        }

        // print(messageDates);
        // print(showDate);
        ///to do a list of id to be updated  for read receipts
        // print(messagesList[index].from);
        // print(user.id.toString());

        if (messagesList[index].from == user.id) {
          return MyMessageWidget(
            message: messagesList[index],
            showDate: showDate,
          );
        } else {
          return OtherMessageWidget(
            message: messagesList[index],
            showDate: showDate,
          );
        }
      },
    );
  }
}

class OtherMessageWidget extends StatelessWidget {
  const OtherMessageWidget(
      {Key key, @required this.message, this.showDate = false})
      : super(key: key);

  final Message message;
  final bool showDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        showDate ? _buildDateHeader(message.timeStamp) : SizedBox(),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 2),
          padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
              color: Color.fromARGB(0xff, 33, 40, 42)), //rgb(32,70,81)
          child: Wrap(
            alignment: WrapAlignment.end,
            crossAxisAlignment: WrapCrossAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 12, bottom: 2),
                child: Text(message.message, style: TextStyle(fontSize: 16)),
              ),
              SizedBox(width: 4),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Opacity(
                    opacity: 0.6,
                    child: Text(
                      DateFormat("E").add_jm().format(
                            DateTime.parse(
                              message.timeStamp.toDate().toLocal().toString(),
                            ),
                          ),
                      style: ksubtitleStyle.copyWith(fontSize: 11),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MyMessageWidget extends StatelessWidget {
  const MyMessageWidget(
      {Key key, @required this.message, this.showDate = false})
      : super(key: key);

  final Message message;
  final bool showDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        showDate ? _buildDateHeader(message.timeStamp) : SizedBox(),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 2),
          padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
              color: Color.fromARGB(0xff, 7, 94, 84)),
          child: Wrap(
            alignment: WrapAlignment.end,
            crossAxisAlignment: WrapCrossAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 12, bottom: 2),
                child: Text(message.message, style: TextStyle(fontSize: 16)),
              ),
              SizedBox(width: 4),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Opacity(
                    opacity: 0.6,
                    child: Text(
                      DateFormat("E").add_jm().format(
                            DateTime.parse(
                              message.timeStamp.toDate().toLocal().toString(),
                            ),
                          ),
                      style: ksubtitleStyle.copyWith(fontSize: 11),
                    ),
                  ),
                  SizedBox(width: 5),
                  Chatdecorations.doubleCheck(message.readReceipt, true),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Widget _buildDateHeader(Timestamp timeStamp) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Card(
        elevation: 0,
        child: Container(
          margin: EdgeInsets.only(left: 6, right: 6),
          height: 30,
          // width: MediaQuery.of(context).size.width,
          child: Center(
            child: Text(
              DateFormat("d MMM y").format(
                DateTime.parse(
                  timeStamp.toDate().toLocal().toString(),
                ),
              ),
              style: ksubtitleStyle.copyWith(fontSize: 10),
            ),
          ),
        ),
      ),
    ],
  );
}

class Chatdecorations {
  static Widget doubleCheck(bool read, bool small) {
    return Container(
      width: 25,
      height: small ? 12 : 14,
      child: Stack(
        children: [
          Icon(Icons.check,
              size: small ? 14 : 18,
              color: read ? Colors.blue[400] : Colors.grey[500]),
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: ClipPath(
              clipper: ClipCheck(small),
              child: Icon(Icons.check,
                  size: small ? 14 : 18,
                  color: read ? Colors.blue[400] : Colors.grey[500]),
            ),
          ),
        ],
      ),
    );
  }
}

class ClipCheck extends CustomClipper<Path> {
  final small;

  ClipCheck(this.small);

  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(small ? 4 : 5.5, 0);
    path.lineTo(small ? 4 : 5.5, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
