// Form that makes use of the ViewModel provided above but also makes use of hooks
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ourESchool/UI/Utility/constants.dart';
import 'package:ourESchool/UI/Widgets/TopBar.dart';
import 'package:ourESchool/UI/pages/libary/library_ViewModel.dart';
import 'package:ourESchool/core/Models/User.dart';
import 'package:ourESchool/core/Models/library/library_model.dart';
import 'package:provider/provider.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:ourESchool/UI/Utility/Resources.dart';

class LibaryForm extends HookViewModelWidget<LibaryViewModel> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  final ValueChanged _onChanged = (val) => print(val);
  bool _ageHasError = false;

  String _day = '';
  List _subjectss;

  void moveFocus(BuildContext context) => FocusScope.of(context).nextFocus();

  @override
  Widget buildViewModelWidget(BuildContext context, LibaryViewModel model) {
    User currentUser = Provider.of<User>(context, listen: false);
    final _description = useTextEditingController();
    final _standard = useTextEditingController();
    final _division = useTextEditingController();

    return Scaffold(
        appBar: TopBar(
          buttonHeroTag: 'libraryEntry',
          title: 'Library',
          child: kBackBtn(context),
          onPressed: () {
            kbackBtn(context);
          },
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              FormBuilder(
                key: _fbKey,
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    SizedBox(height: 15),
                    FormBuilderTextField(
                      attribute: 'Standard',
                      controller: _standard,
                      decoration: InputDecoration(
                        labelText: 'Standard',
                        suffixIcon: _ageHasError
                            ? Icon(Icons.error, color: Colors.red)
                            : Icon(Icons.check, color: Colors.green),
                      ),
                      onChanged: (val) {
                        print(val);
                      },
                      validators: [FormBuilderValidators.required()],
                      keyboardType: TextInputType.number,
                      onFieldSubmitted: (v) => moveFocus,
                    ),
                    SizedBox(height: 15),
                    FormBuilderTextField(
                      attribute: '  Division',
                      controller: _division,
                      decoration: InputDecoration(
                        labelText: 'Division',
                        suffixIcon: _ageHasError
                            ? Icon(Icons.error, color: Colors.red)
                            : Icon(Icons.check, color: Colors.green),
                      ),
                      onChanged: (val) {
                        print(val);
                      },
                      validators: [FormBuilderValidators.required()],
                      keyboardType: TextInputType.text,
                      onFieldSubmitted: (v) => moveFocus,
                    ),
                    SizedBox(height: 15),
                    SizedBox(height: 15),
                    FormBuilderTextField(
                      attribute: 'Description',
                      controller: _description,
                      decoration: InputDecoration(
                        labelText: 'Description',
                        suffixIcon: _ageHasError
                            ? Icon(Icons.error, color: Colors.red)
                            : Icon(Icons.check, color: Colors.green),
                      ),
                      onChanged: (val) {
                        print(val);
                      },
                      validators: [FormBuilderValidators.required()],
                      keyboardType: TextInputType.text,
                      onFieldSubmitted: (v) => moveFocus,
                    ),
                    SizedBox(height: 15),
                    FormBuilderDropdown(
                      attribute: 'day',
                      decoration: const InputDecoration(
                        labelText: 'Choose a week day',
                      ),
                      // initialValue: 'Male',
                      hint: Text('Select a day'),
                      validators: [FormBuilderValidators.required()],
                      items: Choices.days
                          .map((day) => DropdownMenuItem(
                                value: day,
                                child: Text('$day'),
                              ))
                          .toList(),

                      allowClear: true,

                      onChanged: (day) {
                        _day = day;
                      },
                      onSaved: (day) {
                        _day = day;
                      },
                    ),
                    SizedBox(height: 15),
                    FormBuilderCheckboxGroup(
                      decoration: InputDecoration(
                          labelText: 'Select the subject of the day'),
                      attribute: 'Subjects',
                      options: Choices.options,
                      onChanged: (day) {
                        _day = day;
                      },
                      onSaved: (s) {
                        _subjectss = s;
                      },
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: MaterialButton(
                      color: Theme.of(context).accentColor,
                      child: Text(
                        'Reset',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        _fbKey.currentState.reset();
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: MaterialButton(
                      color: Theme.of(context).accentColor,
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        if (_fbKey.currentState.saveAndValidate()) {
                          print(_fbKey.currentState.value);
                          var library = Classlibrary(
                            description: _description.text,
                            day: _day,
                            subjects: _subjectss,
                            standard: _standard.text.toUpperCase(),
                            division: _division.text.toUpperCase(),
                            by: currentUser.id,
                            createdAt: DateTime.now(),
                          );

                          model.postLibrary(classlibrary: library);
                          // model.getLibrary();
                        } else {
                          print(_fbKey.currentState.value);
                          print('validation failed');
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
