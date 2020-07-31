import 'package:ourESchool/UI/Utility/ui_helpers.dart';
import 'package:ourESchool/UI/Widgets/creation_aware_list_item.dart';
import 'package:ourESchool/UI/pages/feed/createFeed.dart';
import 'package:ourESchool/UI/pages/feed/feed_card.dart';
import 'package:ourESchool/UI/pages/feed/feed_viewModel.dart';
import 'package:ourESchool/UI/resources/colors.dart';
import 'package:ourESchool/imports.dart';
import 'package:stacked/stacked.dart';

class FeedPage extends StatefulWidget {
  FeedPage({
    Key key,
    this.announcementFor = '',
  }) : super(key: key) {
    // setCurrentScreen();
  }

  final String announcementFor;
  static String pageName = string.announcement;

  @override
  _FeedPageState createState() => _FeedPageState();

  String get screenName => string.announcement + 'Page';
}

class _FeedPageState extends State<FeedPage> {
  bool isTeacher = false;

  ScrollController controller;
  FeedViewModel model = FeedViewModel();
  String stdDivGlobal = 'Global';
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoaded = false;
  String buttonLabel = 'Global';

  TextEditingController _standardController = TextEditingController();
  TextEditingController _divisionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var userType = Provider.of<UserType>(context, listen: false);
    User currentUser = Provider.of<User>(context, listen: false);
    if (userType == UserType.TEACHER) {
      isTeacher = true;
    }
    return ViewModelBuilder<FeedViewModel>.reactive(
      viewModelBuilder: () => FeedViewModel(),
      // disposeViewModel: false,
      createNewModelOnInsert: true,
      onModelReady: (model) => model.listenToPosts(stdDivGlobal: stdDivGlobal),
      builder: (context, model, child) {
        this.model = model;
        return Scaffold(
          key: scaffoldKey,
          appBar: TopBar(
            buttonHeroTag: string.announcement,
            title: stdDivGlobal + " Posts",
            child: Row(
              children: [
                isThemeCurrentlyDark(context)
                    ? Image.asset(
                        'assets/logowhite.png',
                        fit: BoxFit.fill,
                        height: 40,
                        color: Colors.tealAccent,
                      )
                    : Image.asset(
                        'assets/logowhite.png',
                        fit: BoxFit.fill,
                        height: 40,
                        color: Colors.teal,
                      ),
                Text(
                  'VSCHOOL',
                  style: ktitleStyle.copyWith(fontSize: 13),
                ),
              ],
            ),
            onPressed: null,
          ),
          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          floatingActionButton: Stack(
            children: <Widget>[
              Visibility(
                visible: isTeacher,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    elevation: 5,
                    onPressed: () {
                      kopenPageSlide(context, CreateFeed(),
                          duration: Duration(milliseconds: 200));
                    },
                    child: Icon(Icons.add),
                    backgroundColor: MyColors.okay,
                    // isThemeCurrentlyDark(context)
                    //     ? MyColors.okay
                    //     : Colors.teal[300],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 31),
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: FloatingActionButton.extended(
                      label: Text('Filter'),
                      heroTag: 'abc',
                      elevation: 12,
                      onPressed: () {
                        //Filter Posts Code Here
                        filterDialogBox(context, model);
                      },
                      icon: Icon(Icons.filter_list),
                      backgroundColor: MyColors.okay,
                      //  isThemeCurrentlyDark(context)
                      //     ? Colors.tealAccent
                      //     : Colors.teal[300],
                    )
                    // : Container(),
                    ),
              ),
            ],
          ),
          body: Center(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 700,
              ),
              // child: RefreshIndicator(
              child: model.feed == null
                  ? kBuzyPage(color: Theme.of(context).accentColor)
                  // : Container(
                  //     child: Center(
                  //       child: Text(
                  //         'No Posts available....!',
                  //         style: ksubtitleStyle.copyWith(fontSize: 25),
                  //       ),
                  //     ),
                  //     // color: Colors.red,
                  //   )
                  : ListView.builder(
                      physics: BouncingScrollPhysics(),
                      cacheExtent: model.feed.length + 0.1,
                      controller: controller,
                      itemCount: model.feed.length,
                      itemBuilder: (context, index) {
                        if (index < model.feed.length) {
                          return CreationAwareListItem(
                            itemCreated: () {
                              if (index % 6 == 0)
                                model.requestMoreData(
                                    stdDivGlobal: stdDivGlobal);
                            },
                            child: Stack(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 6),
                                  child: FeedCard(
                                    feed: model.feed[index],
                                  ),
                                ),
                                Positioned(
                                  top: 0.0,
                                  bottom: 0.0,
                                  left: 3.0,
                                  child: new Container(
                                    height: double.infinity,
                                    width: 5.0,
                                    color: isThemeCurrentlyDark(context)
                                        ? Colors.teal
                                        : Colors.teal[300],
                                  ),
                                ),
                                Positioned(
                                  top: 100.0,
                                  bottom: 15.0,
                                  left: 0.0,
                                  child: new Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: MyColors.white,
                                    ),
                                    child: new Container(
                                      margin: new EdgeInsets.all(5.0),
                                      height: 30.0,
                                      width: 30.0,
                                      decoration: new BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: MyColors.github,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Center(
                            child: new Opacity(
                              opacity: model.isBusy ? 1.0 : 0.0,
                              child: new SizedBox(
                                  width: 32.0,
                                  height: 32.0,
                                  child: kBuzyPage(color: Colors.transparent)),
                            ),
                          );
                        }
                      },
                    ),
              //   onRefresh: () async {
              //     await model.onRefresh(stdDivGlobal);
              //   },
              // ),
            ),
          ),
        );
      },
    );
  }

  Future filterDialogBox(BuildContext context, FeedViewModel model) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            string.show_announcement_of,
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                string.filter_announcement,
                // style: TextStyle(fontFamily: 'Subtitle'),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  controller: _standardController,
                  onChanged: (standard) {},
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  // decoration: InputDecoration(
                  //     hintText: "Master Pass",
                  //     hintStyle: TextStyle(fontFamily: "Subtitle"),
                  //     ),
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: string.standard_hint,
                    labelText: string.standard,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  controller: _divisionController,
                  onChanged: (division) {},
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: string.division_hint,
                    labelText: string.division,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            Hero(
              tag: 'abc',
              child: Row(
                children: <Widget>[
                  FlatButton(
                    child: Text(string.cancel),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  FlatButton(
                    child: Text('Global'.toUpperCase()),
                    onPressed: () async {
                      setState(() {
                        stdDivGlobal = 'Global';
                      });
                      model.filteredFeed(std: stdDivGlobal);
                      // model.listenToPosts(stdDivGlobal: stdDivGlobal);
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  FlatButton(
                    child: Text(string.filter),
                    onPressed: () async {
                      setState(() {
                        stdDivGlobal = _standardController.text.trim() +
                            _divisionController.text.trim().toUpperCase();
                      });
                      model.filteredFeed(std: stdDivGlobal);
                      // model.requestMoreData();
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
