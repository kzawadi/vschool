import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:ourESchool/UI/Utility/constants.dart';
import 'package:ourESchool/UI/pages/Chat/MessagingScreen.dart';
import 'package:ourESchool/UI/resources/customWidgets.dart';
import 'package:ourESchool/core/viewmodel/ChatViewModels/ChatUsersListPageModel.dart';

class ChatTeachersListWidget extends StatefulWidget {
  // final Function onPressed;
  final String heroTag;
  final DocumentSnapshot snapshot;
  final ChatUsersListPageModel model;

  ChatTeachersListWidget({this.snapshot, this.heroTag, this.model});

  @override
  _ChatTeachersListWidgetState createState() => _ChatTeachersListWidgetState();
}

class _ChatTeachersListWidgetState extends State<ChatTeachersListWidget> {
  @override
  void initState() {
    super.initState();
    if (SchedulerBinding.instance.schedulerPhase ==
        SchedulerPhase.persistentCallbacks) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        print('Here');
        return widget.model.getSingleTeacherData(widget.snapshot);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.model.isBusy
        ? kBuzyPage(color: Theme.of(context).primaryColor)
        : widget.model.teachersListMap.isEmpty
            ? Container(
                child: Center(
                  child: Text('No Teachers'),
                ),
              )
            : ListTile(
                onTap: () {
                  kopenPage(
                      context,
                      MessagingScreen(
                        student: widget.model.selectedChild,
                        parentORteacher:
                            widget.model.teachersListMap[widget.snapshot.id],
                      ),
                      'Messaging_Screen');
                },
                leading: CircleAvatar(
                  foregroundColor: Theme.of(context).primaryColor,
                  backgroundColor: Colors.grey,
                  backgroundImage: customAdvanceNetworkImage(
                    widget.model.teachersListMap[widget.snapshot.id].photoUrl,
                  ),
                ),
                title: Text(
                  widget.model.teachersListMap[widget.snapshot.id].displayName,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                subtitle: Container(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    'Class ${widget.model.teachersListMap[widget.snapshot.id].standard + widget.model.teachersListMap[widget.snapshot.id].division}',
                    style: TextStyle(color: Colors.grey, fontSize: 15.0),
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 8),
              );
  }
}
