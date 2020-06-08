import 'package:ourESchool/UI/Utility/constants.dart';
import 'package:ourESchool/UI/Widgets/TopBar.dart';
import 'package:flutter/material.dart';
import 'package:ourESchool/UI/Widgets/creation_aware_list_item.dart';
import 'package:ourESchool/UI/pages/shared/viewmodel_provider.dart';
import 'package:ourESchool/UI/resources/colors.dart';
import 'package:ourESchool/core/Models/User.dart';
import 'package:ourESchool/core/viewmodel/messaging/MessagingPageModel.dart';
import 'package:ourESchool/imports.dart';
import 'package:stacked/stacked.dart';

class MessagingScreenNew extends StatefulWidget {
  MessagingScreenNew({Key key, this.student, this.parentORteacher})
      : super(key: key);
  final User parentORteacher;
  final User student;

  _MessagingScreenNewState createState() => _MessagingScreenNewState();
}

class _MessagingScreenNewState extends State<MessagingScreenNew> {
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

    return ViewModelProvider<MessagingPageModel>.withConsumer(
      viewModel: MessagingPageModel(),
      onModelReady: (model) => model.listenToSms(
        loggedIn: user,
        other: widget.parentORteacher,
        student: widget.student,
        scrollController: _scrollController,
      ),
      builder: (context, model, child) {
        return Scaffold(
          extendBody: true,
          appBar: TopBar(
            onTitleTapped: () {},
            title: widget.parentORteacher.displayName,
            child: kBackBtn,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          body: SafeArea(
            child: Column(
              children: <Widget>[
                Flexible(
                  child: model.sms != null
                      ? ListView.builder(
                          // controller: _scrollController,
                          physics: BouncingScrollPhysics(),
                          // shrinkWrap: true,
                          // reverse: true,
                          itemCount: model.sms.length,
                          itemBuilder: (context, index) =>
                              CreationAwareListItem(
                            itemCreated: () {
                              if (index % 5 == 0)
                                model.requestMoreData(
                                  loggedIn: user,
                                  other: widget.parentORteacher,
                                  student: widget.student,
                                  scrollController: _scrollController,
                                );
                            },
                            child: MessagesListViewBuilder(
                              messagesList: model.sms,
                              scrollController: _scrollController,
                              read: model.delivery(
                                messagesList: model.sms,
                                student: widget.student,
                                user: user,
                              ),
                            ),
                          ),
                        )
                      : Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(
                                Theme.of(context).primaryColor),
                          ),
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

  sendButtonTapped(MessagingPageModel model, User user) async {
    Message message = Message(
      to: widget.parentORteacher.id,
      for_: widget.student.id,
      from: user.id,
      message: """${_messageController.text}""",
      timeStamp: Timestamp.now(),
      readReceipt: false,
    );

    // await model.sendMessage(message: message, student: widget.student);
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

  Widget _buildMessageSender(MessagingPageModel model, User user) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 10),
            child: Container(
              constraints: BoxConstraints(
                maxHeight: 150,
                // maxWidth: MediaQuery.of(context).size.width - 66,
              ),
              // width: MediaQuery.of(context).size.width - 65,
              child: TextField(
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
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
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
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  elevation: 5,
                  shape: kCardCircularShape,
                  child: Container(
                    width: 50,
                    height: 50,
                    child: Stack(
                      children: <Widget>[
                        model.isBusy
                            ? SpinKitRing(
                                color: MyColors.accent,
                                // size: 50,
                                lineWidth: 4,
                              )
                            : Container(),
                        model.isBusy
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
