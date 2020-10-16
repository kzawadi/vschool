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
  // bool _ageHasError = false;

  String _day = '';
  List _subjectss;

  void moveFocus(BuildContext context) => FocusScope.of(context).nextFocus();

  @override
  Widget buildViewModelWidget(BuildContext context, LibaryViewModel model) {
    User currentUser = Provider.of<User>(context, listen: false);
    final Color fieldBackGround = Theme.of(context).highlightColor;

    final _description = useTextEditingController();
    final _standard = useTextEditingController();
    final _division = useTextEditingController();

    return Scaffold(
        backgroundColor: Theme.of(context).primaryColorLight,
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
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: fieldBackGround,
                          borderRadius: BorderRadius.circular(14)),
                      child: FormBuilderTextField(
                        attribute: 'Standard',
                        controller: _standard,
                        textCapitalization: TextCapitalization.words,
                        // style: Theme.of(context).textTheme.bodyText2,
                        decoration: InputDecoration(
                          labelText: 'Standard',

                          // suffixIcon: _ageHasError
                          //     ? Icon(Icons.error, color: Colors.red)
                          //     : Icon(Icons.check, color: Colors.green),
                          helperStyle: Theme.of(context)
                              .inputDecorationTheme
                              .helperStyle,
                          hintStyle:
                              Theme.of(context).inputDecorationTheme.labelStyle,
                          // hintText: 'e.g, 8C',
                          // labelText: string.confirm_password,
                          prefixIcon: Icon(Icons.edit_location),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                        onChanged: (val) {
                          print(val);
                        },
                        validators: [FormBuilderValidators.required()],
                        keyboardType: TextInputType.number,
                        onFieldSubmitted: (v) => moveFocus(context),
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: fieldBackGround,
                          borderRadius: BorderRadius.circular(14)),
                      child: FormBuilderTextField(
                        attribute: '  Division',
                        controller: _division,
                        textCapitalization: TextCapitalization.characters,
                        decoration: InputDecoration(
                          labelText: 'Division',
                          // icon: Icon(Icons.class_),

                          // suffixIcon: _ageHasError
                          //     ? Icon(Icons.error, color: Colors.red)
                          //     : Icon(Icons.check, color: Colors.green),
                          helperStyle: Theme.of(context)
                              .inputDecorationTheme
                              .helperStyle,
                          hintStyle:
                              Theme.of(context).inputDecorationTheme.labelStyle,
                          // hintText: 'e.g, 8C',
                          // labelText: string.confirm_password,
                          prefixIcon: Icon(Icons.class_),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                        onChanged: (val) {
                          print(val);
                        },
                        validators: [FormBuilderValidators.required()],
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (v) => moveFocus(context),
                      ),
                    ),
                    SizedBox(height: 15),
                    SizedBox(height: 15),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: fieldBackGround,
                          borderRadius: BorderRadius.circular(14)),
                      child: FormBuilderTextField(
                        attribute: 'Description',
                        controller: _description,
                        decoration: InputDecoration(
                          labelText: 'Description',
                          // icon: Icon(Icons.description),

                          // suffixIcon: _ageHasError
                          //     ? Icon(Icons.error, color: Colors.red)
                          //     : Icon(Icons.check, color: Colors.green),
                          helperStyle: Theme.of(context)
                              .inputDecorationTheme
                              .helperStyle,
                          hintStyle:
                              Theme.of(context).inputDecorationTheme.labelStyle,
                          // hintText: 'e.g, 8C',
                          // labelText: string.confirm_password,
                          prefixIcon: Icon(Icons.description),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                        onChanged: (val) {
                          print(val);
                        },
                        validators: [FormBuilderValidators.required()],
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (v) => moveFocus(context),
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: fieldBackGround,
                          borderRadius: BorderRadius.circular(14)),
                      child: FormBuilderDropdown(
                        attribute: 'day',
                        decoration: const InputDecoration(
                          // icon: Icon(Icons.view_comfy_rounded),
                          labelText: 'Choose a week day',

                          // hintText: 'e.g, 8C',
                          // labelText: string.confirm_password,
                          prefixIcon: Icon(Icons.view_comfy_rounded),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),

                        hint: Text('Select a day'),
                        dropdownColor: Theme.of(context).colorScheme.surface,
                        validators: [FormBuilderValidators.required()],
                        items: Choices.days
                            .map(
                              (day) => DropdownMenuItem(
                                value: day,
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                        color: Theme.of(context).primaryColor,
                                        style: BorderStyle.solid,
                                        width: 0.80),
                                  ),
                                  child: Text(
                                    '$day',
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        // allowClear: true,
                        onChanged: (day) {
                          _day = day;
                        },
                        onSaved: (day) {
                          _day = day;
                        },
                      ),
                    ),
                    SizedBox(height: 15),
                    FormBuilderCheckboxGroup(
                      decoration: InputDecoration(
                          labelText: 'Select the subjects of the day'),
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
                      color: Theme.of(context).errorColor,
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
