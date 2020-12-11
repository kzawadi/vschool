import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:framy_annotation/framy_annotation.dart';
import 'package:ourESchool/UI/Utility/constants.dart';
import 'package:ourESchool/UI/Widgets/TopBar.dart';
import 'package:ourESchool/UI/Widgets/creation_aware_list_item.dart';
import 'package:ourESchool/UI/pages/feed/feed_card.dart';
import 'package:ourESchool/UI/pages/feed/feed_viewModel.dart';
import 'package:ourESchool/UI/resources/colors.dart';
import 'package:ourESchool/UI/resources/customWidgets.dart';
import 'package:ourESchool/core/enums/UserType.dart';
import 'package:ourESchool/locator.dart';
import 'package:provider/provider.dart';
import 'package:ourESchool/UI/Utility/Resources.dart';
import 'package:stacked/stacked.dart';
import 'package:ourESchool/UI/Widgets/customLoader.dart';

@FramyWidget()
class FeedPage extends StatelessWidget {
  FeedPage({Key key, reactive: false}) : super(key: key);
  // final scaffoldKey = GlobalKey<ScaffoldState>();

  // String buttonLabel = 'Global';

  @override
  Widget build(BuildContext context) {
    // var userType = Provider.of<UserType>(context, listen: false);
    return ViewModelBuilder<FeedViewModel>.reactive(
      fireOnModelReadyOnce: true,
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      onModelReady: (model) => model.stream,
      builder: (context, model, child) {
        return Scaffold(
          extendBody: true,
          backgroundColor: Theme.of(context).backgroundColor,
          // key: scaffoldKey,
          appBar: TopBar(
            buttonHeroTag: string.announcement,
            title: model.counter + " Posts",
            child: Image.asset(
              'assets/logowhite.png',
              fit: BoxFit.contain,
              height: 40,
              color: Theme.of(context).accentColor,
            ),
            onPressed: null,
          ),
          body: Center(
            child: model.isBusy
                //todo this is wierd when opening the app and feed get fetched
                ? customScreenLoader(context)
                : model.data == null
                    ? emptyListWidget(context, 'Empty',
                        subTitle: 'Trying to fetch latest news')
                    : Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: <Widget>[
                          ListView.builder(
                            key: PageStorageKey("feed"),
                            dragStartBehavior: DragStartBehavior.start,
                            addAutomaticKeepAlives: true,
                            physics: BouncingScrollPhysics(),
                            cacheExtent: 2000,
                            itemCount: model.data.length,
                            itemBuilder: (context, index) {
                              if (index < model.data.length) {
                                return CreationAwareListItem(
                                  itemCreated: () {
                                    //todo change this in production to reflect
                                    if (index % 6 == 0) model.requestMoreData();
                                  },
                                  child: FeedCard(
                                    feed: model.data[index],
                                    feedModel: model,
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
                          Hero(
                            tag: 'abc',
                            child: Container(
                              padding: EdgeInsets.fromLTRB(200, 40, 0, 60),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          right: 12,
                                          left: fullWidth(context) / 4,
                                          top: 3,
                                          bottom: 3),
                                      child: RaisedButton(
                                        padding: EdgeInsets.all(14.5),
                                        color:
                                            Theme.of(context).bottomAppBarColor,
                                        textColor: black,
                                        onPressed: model.showCustomDialog,
                                        child: Text(
                                          "Filter",
                                          style: TextStyle(
                                            color: black,
                                            fontSize: 15.0,
                                          ),
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(16.0),
                                            side: BorderSide(
                                                color: Theme.of(context)
                                                    .accentColor,
                                                width: 1.0)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
          ),
        );
      },
      viewModelBuilder: () => locator<FeedViewModel>(),
    );
  }
}
