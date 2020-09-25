import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ourESchool/UI/Widgets/TopBar.dart';
import 'package:ourESchool/core/Models/student_data_entry/student_data_entry.dart';
import 'package:ourESchool/core/services/student_data_Entry/student_Data_Entry_VM.dart';
import 'package:ourESchool/imports.dart';
import 'package:stacked/stacked.dart';

class StudentDataImpoter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StudentDataEntryViewModel>.reactive(
      viewModelBuilder: () => StudentDataEntryViewModel(),
      // onModelReady: (model) => null,
      builder: (context, model, child) {
        return Scaffold(
          appBar: TopBar(
            buttonHeroTag: 'data_importer',
            title: " Data Importer",
            onPressed: null,
            child: null,
          ),
          body: !model.dataReady
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
                  itemCount: model.data.length,
                  itemBuilder: (context, index) {
                    StudentEntryData studentData = model.data[index];
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
                              AutoSizeText(studentData.parentId),
                            ],
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          SizedBox(
                            height: 40,
                          )
                        ],
                      ),
                    );
                  },
                ),
          persistentFooterButtons: <Widget>[
            RaisedButton(
              elevation: 10.0,
              onPressed: () => model.futureToRun(),
              color: Colors.green,
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(200, 0, 30, 0),
              child: RaisedButton(
                elevation: 10.0,
                onPressed: () => model.postData(userEntryData: model.data),
                color: Colors.blueGrey,
                child: Icon(
                  Icons.cloud,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
