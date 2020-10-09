import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:ourESchool/UI/pages/libary/library_ViewModel.dart';
import 'package:ourESchool/UI/resources/customWidgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ourESchool/core/Models/library/library_model.dart';
import 'package:ourESchool/UI/Widgets/TopBar.dart';

class LibraryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LibaryViewModel>.reactive(
      onModelReady: (model) => model.getLibrary(),
      builder: (context, model, child) {
        print('PartialBuildsView rebuilt');
        return Scaffold(
          appBar: TopBar(
            buttonHeroTag: 'Library',
            title: "Library",
            onPressed: null,
            child: null,
          ),
          body: Center(
            child: model.isBusy
                ? Container(child: Text('Fetching Library Data'))
                : model.library.isEmpty
                    ? emptyListWidget(context, 'Empty',
                        subTitle: 'Trying to fetch latest Library')
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
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              height: 65,
              width: double.maxFinite,
              child: Card(
                elevation: 0,
                child: Center(
                  child: Text(
                    root.day,
                    style: Theme.of(context)
                        .textTheme
                        .button
                        .copyWith(fontSize: 17),
                  ),
                ),
              ),
            ),
            // Text(
            //   root.day,
            //   style: Theme.of(context).textTheme.button.copyWith(fontSize: 17),
            // ),
            SizedBox(height: 20),
            Text(root.description),
            SizedBox(height: 30),
          ],
        ),
        children: root.subjects.map((e) {
          var w = Padding(
            padding: EdgeInsets.only(left: 10.0, top: 10),
            child: Column(
              children: [
                // Text(root.description),
                // SizedBox(
                //   height: 20,
                // ),
                Text(e),
              ],
            ),
          );

          return w;
        }).toList());
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(context, entry);
  }
}
