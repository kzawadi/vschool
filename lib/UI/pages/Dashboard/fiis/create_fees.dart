import 'package:ourESchool/UI/Utility/constants.dart';
import 'package:ourESchool/UI/Widgets/TopBar.dart';
import 'package:ourESchool/UI/Utility/Resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ourESchool/UI/pages/BaseView.dart';
import 'package:ourESchool/core/Models/User.dart';
import 'package:ourESchool/core/Models/fees/fees_model.dart';
import 'package:ourESchool/core/enums/UserType.dart';
import 'package:ourESchool/core/enums/ViewState.dart';
import 'package:ourESchool/core/viewmodel/fees/fees_entry_model.dart';
import 'package:provider/provider.dart';

class FeesPageEntry extends StatefulWidget {
  const FeesPageEntry({Key key, this.user, this.targeteid}) : super(key: key);
  final User user;
  final String targeteid;

  @override
  _FeesPageEntryState createState() => _FeesPageEntryState();
}

class _FeesPageEntryState extends State<FeesPageEntry> {
  TextEditingController _standardController;
  TextEditingController _divisionController;
  TextEditingController _captionController;

  String targeteid;

  @override
  void initState() {
    super.initState();
    _standardController = TextEditingController();
    _captionController = TextEditingController();
    _divisionController = TextEditingController();

    targeteid = widget.targeteid == '' ? '' : widget.targeteid;
  }

  floatingButtonPressed(CreateFeesModel model, BuildContext context) async {
    User user = Provider.of<User>(context, listen: false);
    var fees = Fees(
      id: user.id,
      description: _captionController.text,
      // description: _captionController.text,
    );

    await model.postFees(fees, targeteid);
    kbackBtn(context);
  }

  @override
  Widget build(BuildContext context) {
    final double borderradius = 10;

    UserType userType = widget.user == null
        ? Provider.of<UserType>(context, listen: false)
        : UserType.STUDENT;
    targeteid = widget.user.id;
    return BaseView<CreateFeesModel>(
      // onModelReady: (model) =>
      //     widget.user == null ? model.getUserProfileData() : model,
      builder: (context, model, child) {
        //User user = widget.user == null ? model.userProfile : widget.user;
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
              floatingButtonPressed(model, context);
            },
          ),
          body: model.state == ViewState.Busy
              ? kBuzyPage(color: Theme.of(context).primaryColor)
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Column(
                            children: <Widget>[
                              ProfileFieldsECard(
                                width: MediaQuery.of(context).size.width,
                                labelText: string.mobile_no,
                                initialText: widget.user.id,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 150,
                          // color: Colors.blueAccent.withOpacity(0.5),
                          child: TextField(
                            controller: _captionController,
                            // enabled: !isPosting,
                            // focusNode: _focusNode,
                            maxLength: null,
                            // onChanged: (caption) {
                            //   setState(() {
                            //     isReadyToPost = caption == '' ? false : true;
                            //   });
                            // },
                            maxLines: 50,
                            keyboardType: TextInputType.multiline,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: kTextFieldDecoration.copyWith(
                              hintText: string.type_your_stuff_here,
                              labelText: string.caption,
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

class ProfileFieldsECard extends StatelessWidget {
  final String initialText;
  final String labelText;
  final double width;

  const ProfileFieldsECard(
      {this.initialText, @required this.labelText, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      // width: width == null ? MediaQuery.of(context).size.width / 2.5 : width,
      child: TextField(
        enabled: false,
        controller: TextEditingController(text: initialText),
        keyboardType: TextInputType.text,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          hintStyle: TextStyle(height: 2.0, fontWeight: FontWeight.w300),
          contentPadding:
              EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        ),
      ),
    );
  }
}
