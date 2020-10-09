// View that creates and provides the viewmodel
import 'package:flutter/material.dart';
import 'package:ourESchool/UI/pages/libary/library_ViewModel.dart';
import 'package:ourESchool/UI/pages/libary/library_widgets/library_form.dart';
import 'package:stacked/stacked.dart';

class CreateLibrary extends StatelessWidget {
  const CreateLibrary({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LibaryViewModel>.nonReactive(
      builder: (context, model, child) => Scaffold(
          body: Center(
        child: LibaryForm(),
      )),
      viewModelBuilder: () => LibaryViewModel(),
    );
  }
}
