import 'package:flutter/scheduler.dart';
import 'package:ourESchool/UI/resources/customWidgets.dart';
import 'package:ourESchool/imports.dart';

class ChatStudentListWidget extends StatefulWidget {
  // final Function onPressed;
  final String heroTag;
  final DocumentSnapshot snapshot;
  final ChatUsersListPageModel model;

  ChatStudentListWidget({this.snapshot, this.heroTag, this.model});

  @override
  _ChatStudentListWidgetState createState() => _ChatStudentListWidgetState();

  // void onLoad()
}

class _ChatStudentListWidgetState extends State<ChatStudentListWidget> {
  @override
  void initState() {
    super.initState();
    if (SchedulerBinding.instance.schedulerPhase ==
        SchedulerPhase.persistentCallbacks) {
      SchedulerBinding.instance.addPostFrameCallback(
          (_) => widget.model.getSingleStudentData(widget.snapshot));
    }
  }

  Color color(var context) => Theme.of(context).textTheme.bodyText2.color;

  @override
  Widget build(BuildContext context) {
    return widget.model.isBusy
        ? kBuzyPage(color: Theme.of(context).primaryColor)
        : widget.model.studentListMap.isEmpty
            ? Container(
                child: Center(
                  child: Text('No Students'),
                ),
              )
            : ListTile(
                onTap: () {
                  kopenPage(
                    context,
                    StudentConnectionPage(
                      model: widget.model,
                      documentSnapshot: widget.snapshot,
                      // color: color,
                    ),
                    'Student_Connection_Page',
                  );
                },
                leading: CircleAvatar(
                  foregroundColor: Theme.of(context).primaryColor,
                  backgroundColor: Colors.grey,
                  backgroundImage: customAdvanceNetworkImage(
                    widget.model.studentListMap[widget.snapshot.id].photoUrl,
                  ),
                ),
                title: Text(
                  widget.model.studentListMap.containsKey(widget.snapshot.id)
                      ? widget
                          .model.studentListMap[widget.snapshot.id].displayName
                      : "loading...",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                subtitle: Container(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    'Class ${widget.model.studentListMap[widget.snapshot.id].standard + widget.model.studentListMap[widget.snapshot.id].division}',
                    style: TextStyle(color: Colors.grey, fontSize: 15.0),
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 8),
              );
  }
}
