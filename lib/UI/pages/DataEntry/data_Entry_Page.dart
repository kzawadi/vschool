import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ourESchool/UI/Widgets/TopBar.dart';
import 'package:ourESchool/UI/resources/colors.dart';
import 'package:ourESchool/core/Models/data_entry/data_entry.dart';
import 'package:ourESchool/core/viewmodel/Data_Entry_Vm/Data_Entry_ViewmModel.dart';
import 'package:ourESchool/imports.dart';
import 'package:stacked/stacked.dart';

class DataImpoter extends StatefulWidget {
  DataImpoter();
  @override
  State createState() => new DataImpoterState();
}

class DataImpoterState extends State<DataImpoter> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DataEntryViewModel>.reactive(
        viewModelBuilder: () => DataEntryViewModel(),
        // onModelReady: (model) => null,
        builder: (context, model, child) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(48),
              child: TopBar(
                buttonHeroTag: 'data_importer',
                title: " Data Importer",
                onPressed: null,
                child: null,
              ),
            ),
            body: model.busy(model.userdata)
                ?
                //  kBuzyPage(color: Theme.of(context).accentColor)
                Container(
                    child: Center(
                      child: Text(
                        'No Data file Selected....!',
                        style: ksubtitleStyle.copyWith(fontSize: 25),
                      ),
                    ),
                    // color: Colors.red,
                  )
                : ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: model.userdata.length,
                    itemBuilder: (context, index) {
                      UserEntryData studentData = model.userdata[index];
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(40, 0, 20, 0),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              children: [
                                AutoSizeText('NAME'),
                                AutoSizeText(studentData.id),
                              ],
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Column(
                              children: [
                                AutoSizeText('e-MAIL'),
                                Text(studentData.email),
                              ],
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Column(
                              children: [
                                AutoSizeText('PARENTS'),
                                Text(studentData.childId),
                              ],
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(studentData.isATeacher),
                            SizedBox(
                              height: 40,
                            )
                          ],
                        ),
                      );
                    },
                  ),
            // onRefresh: () {},

            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              backgroundColor: MyColors.accent,
              onPressed: () => model.getData(),

              // DataEntryService().postData,
            ),
          );
        });
  }
}
