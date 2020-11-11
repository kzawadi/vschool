import 'package:ourESchool/UI/Widgets/customLoader.dart';
import 'package:ourESchool/UI/resources/customWidgets.dart';
import 'package:ourESchool/imports.dart';
import 'package:stacked/stacked.dart';
import 'package:ourESchool/UI/resources/utility.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key key}) : super(key: key);
  static String pageName = string.chat;

  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  String _standard = '';
  String _division = '';
  bool studentLoaded = false;

  @override
  Widget build(BuildContext context) {
    UserType userType = Provider.of<UserType>(context, listen: false);
    if (userType == UserType.TEACHER) {
      return ViewModelBuilder<ChatUsersListPageModel>.reactive(
        viewModelBuilder: () => ChatUsersListPageModel(),
        onModelReady: (model) =>
            model.getAllStudent(division: _division, standard: _standard),
        builder: (context, model, child) {
          return model.isBusy
              ? customScreenLoader(context)
              : Scaffold(
                  backgroundColor: Theme.of(context).backgroundColor,
                  appBar: TopBar(
                    title: 'Chats',
                    child: null,
                    onPressed: null,
                    buttonHeroTag: 'studentChats',
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListView.builder(
                      itemCount: model.studentsSnapshot.length,
                      itemBuilder: (context, i) {
                        var key = model.studentsSnapshot.keys.elementAt(i);
                        var snapshot = model.studentsSnapshot[key];
                        return ChatStudentListWidget(
                          heroTag: snapshot.id,
                          snapshot: snapshot,
                          model: model,
                        );
                      },
                    ),
                  ),
                );
        },
      );
    } else if (userType == UserType.PARENT) {
      // User children = User();
      return ViewModelBuilder<ChatUsersListPageModel>.reactive(
          viewModelBuilder: () => ChatUsersListPageModel(),
          onModelReady: (model) => model.getChildrens(),
          builder: (context, model, child) {
            return Scaffold(
              backgroundColor: Theme.of(context).backgroundColor,
              appBar: TopBarAlternative(
                title: 'Chats',
                // child: null,
                onPressed: null,
                buttonHeroTag: 'Parent/TechersChats',
              ),
              body: Container(
                // height: 610,
                // color: Colors.red,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 11,
                      child: model.selectedChild.isEmpty()
                          ? Container(
                              child: Center(
                                child: Text(
                                  'No Child Selected',
                                  style: ktitleStyle.copyWith(fontSize: 20),
                                ),
                              ),
                            )
                          : model.isBusy
                              ? customScreenLoader(context)
                              : Container(
                                  // color: Colors.yellow,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: ListView.builder(
                                      itemCount: model.teachersSnapshot.length,
                                      itemBuilder: (context, i) {
                                        // values.keys.elementAt(index);
                                        var key = model.teachersSnapshot.keys
                                            .elementAt(i);
                                        var snapshot =
                                            model.teachersSnapshot[key];
                                        cprint(snapshot.id);
                                        return ChatTeachersListWidget(
                                          heroTag: snapshot.id,
                                          snapshot: snapshot,
                                          model: model,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                    ),
                    Expanded(
                      flex: 2,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: model.childrens.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              model.selectedChild = model.childrens[index];
                              cprint(model.childrens[index].division);
                              model.getAllTeachers(
                                  division: model.selectedChild.division,
                                  standard: model.selectedChild.standard);
                            },
                            // enableFeedback: true,
                            // highlightColor: Theme.of(context).accentColor,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(26),
                                  // bottomLeft: Radius.circular(26),
                                  // bottomRight: Radius.circular(26),
                                ),
                              ),
                              elevation: 0,
                              margin: EdgeInsets.only(bottom: 60),
                              child: Container(
                                decoration: new BoxDecoration(
                                  // borderRadius: BorderRadius.only(
                                  //     topRight: Radius.circular(26),
                                  //     topLeft: Radius.circular(26)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black38,
                                        spreadRadius: 0,
                                        blurRadius: 10),
                                  ],
                                  gradient: new LinearGradient(
                                    colors: [
                                      Theme.of(context).primaryColor,
                                      Theme.of(context).accentColor,
                                    ],
                                    begin: const FractionalOffset(1.0, 1.5),
                                    end: const FractionalOffset(1.0, 0.0),
                                    stops: [0.0, 1.0],
                                    tileMode: TileMode.clamp,
                                  ),
                                ),
                                width: (fullWidth(context) / 2) - 60,
                                child: Row(
                                  // mainAxisSize: ,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      FontAwesomeIcons.child,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      model.childrens[index].displayName,
                                      style:
                                          Theme.of(context).textTheme.subtitle2,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
    } else {
      return Scaffold(
        appBar: TopBar(
          title: 'Chats',
          child: null,
          onPressed: null,
          buttonHeroTag: 'nochats',
        ),
        body: Center(
          child: Text(
            'No UserType Found',
            style: ktitleStyle,
          ),
        ),
      );
    }
  }
}
