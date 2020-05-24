import '../../imports.dart';
import 'package:intl/intl.dart';

// List<String> messageDates = [];

class MessagesListViewBuilder extends StatelessWidget {
  MessagesListViewBuilder({this.messagesList, this.scrollController});

  // List<String> messageDates = [];
  final List<Message> messagesList;
  String previusDate = '';
  final ScrollController scrollController;

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
        print(messagesList[index].id);

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
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 2, 0),
          child: ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.75),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 9, horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                  topLeft: Radius.circular(8),
                ),
              ),
              child: Text(
                message.message,
                textAlign: TextAlign.start,
                style: kchatStyle.copyWith(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            DateFormat("E").add_jm().format(
                  DateTime.parse(
                    message.timeStamp.toDate().toLocal().toString(),
                  ),
                ),
            style: ksubtitleStyle.copyWith(fontSize: 10),
          ),
        ),
        SizedBox(
          height: 4,
        )
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
        Padding(
          padding: const EdgeInsets.fromLTRB(2, 0, 15, 0),
          child: ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.75),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 9, horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.green.shade600,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                  topLeft: Radius.circular(8),
                ),
              ),
              child: Text(
                message.message,
                textAlign: TextAlign.start,
                style: kchatStyle.copyWith(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Text(
            DateFormat("E").add_jm().format(
                  DateTime.parse(
                    message.timeStamp.toDate().toLocal().toString(),
                  ),
                ),
            style: ksubtitleStyle.copyWith(fontSize: 10),
          ),
        ),
        SizedBox(
          height: 4,
        )
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
