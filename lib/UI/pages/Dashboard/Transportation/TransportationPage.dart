import 'package:flutter/material.dart';
import 'package:ourESchool/UI/Utility/Resources.dart';
import 'package:ourESchool/UI/Utility/constants.dart';
import 'package:ourESchool/UI/Widgets/TopBar.dart';

class TransportationPage extends StatelessWidget {
  const TransportationPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        buttonHeroTag: 'transportPage',
        child: kBackBtn(context),
        onPressed: () {
          kbackBtn(context);
        },
        title: string.transportation,
      ),
      body: Center(
        child: Container(
          child: Text('transportation UI to be implemented after logic'),
        ),
      ),
    );
  }
}
