import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ourESchool/UI/Utility/constants.dart';
import 'package:ourESchool/UI/Utility/input_formatters.dart';
import 'package:ourESchool/UI/Utility/ui_helpers.dart';
import 'package:ourESchool/UI/Widgets/TopBar.dart';
import 'package:ourESchool/UI/Utility/Resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ourESchool/UI/resources/text_styles.dart';
import 'package:ourESchool/core/Models/User.dart';
import 'package:ourESchool/core/Models/fees/fees_model.dart';
import 'package:ourESchool/core/viewmodel/fees/fees_entry_model.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class FeesPageEntry extends StatefulWidget {
  const FeesPageEntry({Key key, this.user, this.targeteid}) : super(key: key);
  final User user;
  final String targeteid;

  @override
  _FeesPageEntryState createState() => _FeesPageEntryState();
}

class _FeesPageEntryState extends State<FeesPageEntry> {
  TextEditingController _totalFees;
  TextEditingController _paid;
  TextEditingController _description;
  TextEditingController _due;

  bool isReadyToPost = false;

  String targeteid;

  ///nice formatting of numbers
  RegExp reg = new RegExp(
    r'(\d{1,3})(?=(\d{3})+(?!\d))',
  );
  Function mathFunc = (Match match) => '${match[1]},';

  @override
  void initState() {
    super.initState();
    targeteid = widget.targeteid == '' ? '' : widget.targeteid;
  }

  floatingButtonPressed(CreateFeesModel model, BuildContext context) async {
    User user = Provider.of<User>(context, listen: false);
    var fees = Fees(
      id: user.id,
      description: _description.text,
      totalFees: _totalFees.text.replaceAllMapped(reg, mathFunc),
      due: _due.text.replaceAllMapped(reg, mathFunc),
      paid: _paid.text.replaceAllMapped(reg, mathFunc),
      // description: _description.text,
    );

    await model.postFees(fees, targeteid);
    kbackBtn(context);
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateFeesModel>.nonReactive(
      viewModelBuilder: () => CreateFeesModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: TopBar(
            title: 'FEES',
            child: kBackBtn,
            onPressed: () {
              kbackBtn(context);
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (isReadyToPost) floatingButtonPressed(model, context);
            },
            backgroundColor: isReadyToPost
                ? Theme.of(context).primaryColor
                : Colors.blueGrey,
            child: model.isBusy
                ? SpinKitThreeBounce(
                    duration: (Duration(milliseconds: 500)),
                    color: Colors.white,
                    size: 20,
                  )
                : Icon(Icons.check),
          ),
          body: model.isBusy
              ? kBuzyPage(color: Theme.of(context).primaryColor)
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 100,
                          child: TextField(
                            controller: _description,
                            maxLength: null,
                            maxLines: 50,
                            keyboardType: TextInputType.multiline,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: kTextFieldDecoration.copyWith(
                              hintText: string.fees_description,
                              labelText: string.description,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            string.total_fees,
                            style: isThemeCurrentlyDark(context)
                                ? SubHeadingStylesMaterial.light
                                : SubHeadingStylesMaterial.dark,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(80, 0, 80, 0),
                          child: TextFormField(
                            controller: _totalFees,
                            inputFormatters: [
                              // WhitelistingTextInputFormatter.digitsOnly,
                              FilteringTextInputFormatter.digitsOnly,
                              NumericTextFormatter()
                            ],
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            validator: (value) {
                              if (value.isEmpty)
                                return 'Please enter the amount owed';
                              if (double.tryParse(value) == null)
                                return "Please enter a valid number";
                              return null;
                            },
                            style: isThemeCurrentlyDark(context)
                                ? BodyStylesDefault.white.copyWith(fontSize: 17)
                                : BodyStylesDefault.black
                                    .copyWith(fontSize: 17),
                            decoration: kTextFieldDecoration.copyWith(
                              hintText: string.total_fees,
                              labelText: string.feess,
                              //prefixIcon: Icon(Icons.label),
                              suffix: Icon(FontAwesomeIcons.dollarSign),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            string.fees_due,
                            style: isThemeCurrentlyDark(context)
                                ? SubHeadingStylesMaterial.light
                                : SubHeadingStylesMaterial.dark,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(80, 0, 80, 0),
                          child: TextFormField(
                            controller: _due,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              NumericTextFormatter()
                            ],
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            validator: (value) {
                              if (value.isEmpty)
                                return 'Please enter the amount owed';
                              if (double.tryParse(value) == null)
                                return "Please enter a valid number";
                              return null;
                            },
                            style: isThemeCurrentlyDark(context)
                                ? BodyStylesDefault.white.copyWith(fontSize: 17)
                                : BodyStylesDefault.black
                                    .copyWith(fontSize: 17),
                            decoration: kTextFieldDecoration.copyWith(
                              hintText: string.fees_due,
                              labelText: string.fees_due,
                              //prefixIcon: Icon(Icons.label),
                              suffix: Icon(FontAwesomeIcons.dollarSign),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            string.fees_paid,
                            style: isThemeCurrentlyDark(context)
                                ? SubHeadingStylesMaterial.light
                                : SubHeadingStylesMaterial.dark,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(80, 0, 80, 0),
                          child: TextFormField(
                            onChanged: (paid) {
                              setState(
                                () {
                                  isReadyToPost = paid == '' ? false : true;
                                },
                              );
                            },
                            controller: _paid,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              NumericTextFormatter()
                            ],
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            validator: (value) {
                              if (value.isEmpty)
                                return 'Please enter the amount owed';
                              if (double.tryParse(value) == null)
                                return "Please enter a valid number";
                              return null;
                            },
                            style: isThemeCurrentlyDark(context)
                                ? BodyStylesDefault.white.copyWith(fontSize: 17)
                                : BodyStylesDefault.black
                                    .copyWith(fontSize: 17),
                            decoration: kTextFieldDecoration.copyWith(
                              hintText: string.fees_paid_hint,
                              labelText: string.fees_paid_hint,
                              //prefixIcon: Icon(Icons.label),
                              suffix: Icon(FontAwesomeIcons.dollarSign),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
