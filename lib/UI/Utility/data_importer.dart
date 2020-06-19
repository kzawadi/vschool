import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert'; //to convert json to maps and vice versa
import 'package:file_picker/file_picker.dart';
import 'package:ourESchool/UI/Widgets/TopBar.dart';

class DataImpoter extends StatefulWidget {
  @override
  State createState() => new DataImpoterState();
}

class DataImpoterState extends State<DataImpoter> {
  File jsonFile;
  Directory dir;
  String fileName = "myJSONFile.json";
  bool fileExists = false;
  Map<String, dynamic> fileContent;

  @override
  Widget build(BuildContext context) {
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
      body: Center(
        child: Container(
          child: Column(
            children: [
              Text('Data importer'),
              SizedBox(height: 300),
              Expanded(
                child: Text(
                  fileContent.toString(),
                  // overflow: TextOverflow.visible,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getData,
      ),
    );
  }

  void _getData() async {
    File file = await FilePicker.getFile();
    jsonFile = File(file.path);
    fileExists = jsonFile.existsSync();
    if (fileExists)
      this.setState(() {
        fileContent = json.decode(jsonFile.readAsStringSync());
        print(jsonFile.toString());
      });
    else
      return;
  }
}
