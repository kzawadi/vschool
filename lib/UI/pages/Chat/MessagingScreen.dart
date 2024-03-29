import 'package:ourESchool/UI/Utility/constants.dart';
import 'package:ourESchool/UI/Utility/ui_helpers.dart';
import 'package:ourESchool/UI/Widgets/TopBar.dart';
import 'package:flutter/material.dart';
import 'package:ourESchool/UI/resources/colors.dart';
import 'package:ourESchool/core/Models/User.dart';
import 'package:ourESchool/imports.dart';

class MessagingScreen extends StatefulWidget {
  MessagingScreen({Key key, this.student, this.parentORteacher})
      : super(key: key);
  final User parentORteacher;
  final User student;

  _MessagingScreenState createState() => _MessagingScreenState();
}

class _MessagingScreenState extends State<MessagingScreen> {
  TextEditingController _messageController;
  bool sendButtonEnable = false;
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();
    _scrollController.addListener(() {
      // if (_scrollController.position.pixels !=
      //     _scrollController.position.maxScrollExtent) {
      //   _scrollController.animateTo(
      //     _scrollController.position.maxScrollExtent,
      //     duration: const Duration(milliseconds: 10),
      //     curve: Curves.easeOut,
      //   );
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context, listen: false);

    return BaseView<MessagingScreenPageModel>(
      onModelReady: (model) => model.setState2(ViewState.Busy),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          extendBody: true,
          appBar: TopBar(
            buttonHeroTag: 'smsPage',
            onTitleTapped: () {},
            title: widget.parentORteacher.displayName,
            child: kBackBtn(context),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          body: SafeArea(
            child: Column(
              children: <Widget>[
                Flexible(
                  child: StreamBuilder<List<Message>>(
                    stream: model.chatServices.getMessages(
                      loggedIn: user,
                      other: widget.parentORteacher,
                      student: widget.student,
                      scrollController: _scrollController,
                    ),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData || snapshot.data == null) {
                        return Center(
                          child:
                              kBuzyPage(color: Theme.of(context).primaryColor),
                        );
                      }
                      return MessagesListViewBuilder(
                        messagesList: snapshot.data,
                        scrollController: _scrollController,
                        read: model.delivery(
                          messagesList: snapshot.data,
                          student: widget.student,
                          user: user,
                        ),
                      );
                    },
                  ),
                ),
                Hero(
                  transitionOnUserGestures: true,
                  tag: widget.parentORteacher.id,
                  child: _buildMessageSender(model, user),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  delivery({
    List<Message> messagesList,
    // Message message,
    User student,
    MessagingScreenPageModel model,
    User user,
  }) async {
    // var snapshot;
    await model.delivery(
      messagesList: messagesList,
      student: widget.student,
      user: user,
    );
    // print(messagesList.toString());
  }

  sendButtonTapped(MessagingScreenPageModel model, User user) async {
    Message message = Message(
      to: widget.parentORteacher.id,
      for_: widget.student.id,
      from: user.id,
      message: """${_messageController.text}""",
      timeStamp: Timestamp.now(),
      readReceipt: false,
    );

    await model.sendMessage(message: message, student: widget.student);
    _messageController.clear();
    setState(() {
      sendButtonEnable = false;
    });
    _scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 10),
      curve: Curves.easeOut,
    );
  }

  Widget _buildMessageSender(MessagingScreenPageModel model, User user) {
    final Color fieldBackGround =
        isThemeCurrentlyDark(context) ? MyColors.dark : MyColors.kinderGreen;

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Material(
              borderRadius: BorderRadius.circular(14),
              child: Container(
                decoration: BoxDecoration(
                    color: fieldBackGround,
                    borderRadius: BorderRadius.circular(14)),
                constraints: BoxConstraints(
                  maxHeight: 150,
                  // maxWidth: MediaQuery.of(context).size.width - 66,
                ),
                // width: MediaQuery.of(context).size.width - 65,
                child: TextFormField(
                  controller: _messageController,
                  keyboardType: TextInputType.multiline,
                  onChanged: (message) {
                    if (message.trim().length > 0) {
                      setState(() {
                        sendButtonEnable = true;
                      });
                    } else {
                      setState(() {
                        sendButtonEnable = false;
                      });
                    }
                  },
                  // maxLength: 1000,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'Type a message....',
                    hintStyle: TextStyle(
                      height: 1.5,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 14.0, horizontal: 14.0),
                    prefixIcon: Icon(Icons.chat),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
        ),
        sendButtonEnable
            ? Align(
                alignment: Alignment.center,
                child: Card(
                  color: Colors.greenAccent,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  elevation: 1,
                  shape: kCardCircularShape,
                  child: Container(
                    width: 50,
                    height: 50,
                    child: Stack(
                      children: <Widget>[
                        model.state == ViewState.Busy
                            ? SpinKitRing(
                                color: MyColors.accent,
                                // size: 50,
                                lineWidth: 4,
                              )
                            : Container(),
                        model.state == ViewState.Idle
                            ? MaterialButton(
                                height: 40,
                                shape: kCardCircularShape,
                                onPressed: () {
                                  sendButtonTapped(model, user);
                                },
                                child: Icon(
                                  Icons.send,
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
