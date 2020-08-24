import 'package:ourESchool/UI/resources/customWidgets.dart';
import 'package:ourESchool/imports.dart';
import 'package:stacked/stacked.dart';

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
              ? kBuzyPage(color: Theme.of(context).primaryColor)
              : Scaffold(
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
                          heroTag: snapshot.documentID,
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
              appBar: TopBarAlternative(
                title: 'Chats',
                // child: null,
                onPressed: null,
                buttonHeroTag: 'Parent/TechersChats',
              ),
              body: Container(
                // color: Colors.red,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 12,
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
                              ? kBuzyPage(color: Theme.of(context).primaryColor)
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
                                        return ChatTeachersListWidget(
                                          heroTag: snapshot.documentID,
                                          snapshot: snapshot,
                                          model: model,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                    ),
                    Expanded(
                      flex: 1,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: model.childrens.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              model.selectedChild = model.childrens[index];
                              model.getAllTeachers(
                                  division: model.selectedChild.division,
                                  standard: model.selectedChild.standard);
                            },
                            // enableFeedback: true,
                            // highlightColor: Theme.of(context).accentColor,
                            child: Card(
                              elevation: 0,
                              margin: EdgeInsets.all(2),
                              child: Container(
                                decoration: new BoxDecoration(
                                  gradient: new LinearGradient(
                                    colors: [
                                      Theme.of(context).colorScheme.secondary,
                                      Theme.of(context).canvasColor,
                                    ],
                                    begin: const FractionalOffset(1.0, 1.5),
                                    end: const FractionalOffset(1.0, 0.0),
                                    stops: [0.0, 1.0],
                                    tileMode: TileMode.clamp,
                                  ),
                                ),
                                width: (fullWidth(context) / 2) - 4,
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
