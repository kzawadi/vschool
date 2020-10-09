import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:ourESchool/UI/pages/libary/library_ViewModel.dart';
import 'package:ourESchool/UI/resources/customWidgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ourESchool/core/Models/library/library_model.dart';

class LibraryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LibaryViewModel>.reactive(
      onModelReady: (model) => model.getLibrary(),
      builder: (context, model, child) {
        print('PartialBuildsView rebuilt');
        return Scaffold(
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
                          return SingleChildScrollView(
                            child: Card(
                              child: ExpansionTile(
                                title: Text(
                                  library.day,
                                ),
                                subtitle: Text(library.description),
                                children: <Widget>[
                                  ListView.builder(
                                    itemCount: library.subjects.length,
                                    itemBuilder: (context, index) {
                                      var s = library.subjects[index];
                                      return Card(
                                        child: Text(s),
                                      );
                                    },
                                  ),
                                  // ListTile(
                                  //   title: Text(
                                  //     library.description,
                                  //     textAlign: TextAlign.center,
                                  //   ),
                                  // subtitle: ListView.builder(
                                  //   itemCount: library.subjects.length,
                                  //   itemBuilder: (context, index) {
                                  //     var s = library.subjects[index];
                                  //     return Card(
                                  //       child: Text(s),
                                  //     );
                                  //   },
                                  // ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
          ),
        );
      },
      viewModelBuilder: () => LibaryViewModel(),
    );
  }
}
