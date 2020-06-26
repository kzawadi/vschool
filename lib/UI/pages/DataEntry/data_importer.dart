import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ourESchool/UI/Widgets/TopBar.dart';
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
    // var students = Provider.of<ValueNotifier>(context);
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
                    itemCount: model.userdata.length,
                    itemBuilder: (context, index) {
                      UserEntryData project = model.userdata[index];
                      return Column(
                        children: <Widget>[
                          Text(project.id),
                          SizedBox(
                            height: 20,
                          ),
                          Text(project.email),
                          SizedBox(
                            height: 20,
                          ),
                          Text(project.childId),
                          SizedBox(
                            height: 20,
                          ),
                          Text(project.isATeacher),
                        ],
                      );
                    },
                  ),
            // onRefresh: () {},

            floatingActionButton: FloatingActionButton(
              onPressed: () => model.getData(),

              // DataEntryService().postData,
            ),
          );
        });
  }
}
