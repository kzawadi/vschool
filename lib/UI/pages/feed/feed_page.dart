import 'package:flutter/gestures.dart';
import 'package:ourESchool/UI/Widgets/creation_aware_list_item.dart';
import 'package:ourESchool/UI/pages/feed/createFeed.dart';
import 'package:ourESchool/UI/pages/feed/feed_card.dart';
import 'package:ourESchool/UI/pages/feed/feed_viewModel.dart';
import 'package:ourESchool/UI/resources/customWidgets.dart';
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

class _FeedPageState extends State<FeedPage>
    with AutomaticKeepAliveClientMixin {
  bool isTeacher = false;

  // ScrollController controller;
  FeedViewModel model = FeedViewModel();
  String stdDivGlobal = 'Global';
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoaded = false;
  String buttonLabel = 'Global';

  TextEditingController _standardController = TextEditingController();
  TextEditingController _divisionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var userType = Provider.of<UserType>(context, listen: false);
    // User currentUser = Provider.of<User>(context, listen: false);
    if (userType == UserType.TEACHER) {
      isTeacher = true;
    }
    return ViewModelBuilder<FeedViewModel>.reactive(
      viewModelBuilder: () => FeedViewModel(stdDivGlobal: stdDivGlobal),
      onModelReady: (model) => model.stream,
      builder: (context, model, child) {
        this.model = model;
        return Scaffold(
          key: scaffoldKey,
          appBar: TopBar(
            buttonHeroTag: string.announcement,
            title: stdDivGlobal + " Posts",
            child: Image.asset(
              'assets/logowhite.png',
              fit: BoxFit.contain,
              height: 40,
              color: Theme.of(context).accentColor,
            ),
            onPressed: null,
          ),
          // floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(
              left: 22,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FloatingActionButton.extended(
                  label: Text('Filter'),
                  // heroTag: 'abc',
                  elevation: 5,
                  onPressed: () {
                    //Filter Posts Code Here
                    filterDialogBox(context, model);
                  },
                  icon: Icon(
                    Icons.filter_list,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Visibility(
                  visible: isTeacher,
                  child: FloatingActionButton(
                    heroTag: 'abc',
                    elevation: 5,
                    onPressed: () {
                      kopenPageSlide(
                        context,
                        CreateFeed(),
                        'Creating_Feed',
                        duration: Duration(milliseconds: 200),
                      );
                    },
                    child: Icon(
                      Icons.add,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: Center(
            child: model.data == null
                ? emptyListWidget(context, 'Empty',
                    subTitle: 'Trying to fetch latest news')
                //  kBuzyPage(color: Theme.of(context).accentColor)
                : ListView.builder(
                    dragStartBehavior: DragStartBehavior.start,
                    addAutomaticKeepAlives: true,
                    physics: BouncingScrollPhysics(),
                    cacheExtent: 2000,
                    itemCount: model.data.length,
                    itemBuilder: (context, index) {
                      if (index < model.data.length) {
                        return CreationAwareListItem(
                          itemCreated: () {
                            if (index % 6 == 0)
                              model.requestMoreData(stdDivGlobal: stdDivGlobal);
                          },
                          child: FeedCard(
                            feed: model.data[index],
                          ),
                        );
                      } else {
                        return Center(
                          child: new Opacity(
                            opacity: model.isBusy ? 1.0 : 0.0,
                            child: new SizedBox(
                                width: 32.0,
                                height: 32.0,
                                child: kBuzyPage(
                                  color: Theme.of(context).primaryColor,
                                )),
                          ),
                        );
                      }
                    },
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

  @override
  bool get wantKeepAlive => true;
}
