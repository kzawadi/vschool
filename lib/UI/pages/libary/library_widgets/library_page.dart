import 'package:flutter/material.dart';
import 'package:ourESchool/core/Models/User.dart';
import 'package:stacked/stacked.dart';
import 'package:ourESchool/UI/pages/libary/library_ViewModel.dart';
import 'package:ourESchool/UI/resources/customWidgets.dart';
import 'package:ourESchool/core/Models/library/library_model.dart';
import 'package:ourESchool/UI/Widgets/TopBar.dart';
import 'package:ourESchool/UI/Widgets/customLoader.dart';
import 'package:ourESchool/UI/Widgets/rounded_rectangle.dart';
import 'package:ourESchool/UI/Utility/constants.dart';

class LibraryPage extends StatelessWidget {
  final User child;

  const LibraryPage({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String cls = (child.standard + child.division).toUpperCase();
    return ViewModelBuilder<LibaryViewModel>.reactive(
      onModelReady: (model) => model.getLibrary(cls: cls),
      builder: (context, model, child) {
        print('PartialBuildsView rebuilt');
        return Scaffold(
          appBar: TopBar(
            buttonHeroTag: 'Library',
            title: "Library",
            onPressed: () {
              kbackBtn(context);
            },
            child: kBackBtn(context),
          ),
          body: Center(
            child: model.isBusy
                ? customScreenLoader(context)
                : model.library.length < 1
                    ? Container(
                        child: emptyListWidget(context, 'Empty',
                            subTitle: 'Trying to fetch latest Library'))
                    : ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: model.library.length,
                        itemBuilder: (context, index) {
                          Classlibrary library = model.library[index];
                          return EntryItem(entry: library);
                        },
                      ),
          ),
        );
      },
      viewModelBuilder: () => LibaryViewModel(),
    );
  }
}

class EntryItem extends StatelessWidget {
  const EntryItem({this.entry});
  final Classlibrary entry;

  @override
  Widget build(BuildContext context) {
    return _buildTiles(context, entry);
  }

  // This function recursively creates the multi-level list rows.
  Widget _buildTiles(BuildContext context, Classlibrary root) {
    if (root.subjects.isEmpty) {
      return ListTile(
        title: Text(root.by),
      );
    }
    return ExpansionTile(
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: new BoxDecoration(
          border: new Border(
            right: new BorderSide(width: 1.0, color: Colors.white24),
          ),
        ),
        child: Icon(Icons.ac_unit, color: Colors.black),
      ),
      key: PageStorageKey<Classlibrary>(root),
      title: Column(
        children: [
          RoundedContainer(
            color: Theme.of(context).accentColor,
            child: Text(
              root.day,
              style: Theme.of(context).textTheme.button.copyWith(fontSize: 17),
            ),
          ),
          SizedBox(height: 20),
          Text(
            root.description,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(height: 30),
        ],
      ),
      children: (root.subjects.map(
        (s) {
          var w = Padding(
            padding: EdgeInsets.only(left: 8, top: 10, right: 30),
            child: Column(
              children: [
                RoundedContainer(
                  color: Theme.of(context).colorScheme.primaryVariant,
                  width: MediaQuery.of(context).size.width - 40,

                  margin: EdgeInsets.symmetric(horizontal: 60),
                  // padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Text(s,
                      style: Theme.of(context).accentTextTheme.bodyText2),
                ),
              ],
            ),
          );

          return w;
        },
      ).toList()),
    );
  }
}
