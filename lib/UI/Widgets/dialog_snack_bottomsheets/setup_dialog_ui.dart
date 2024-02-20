import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ourESchool/UI/Utility/constants.dart';
import 'package:ourESchool/core/enums/dialog_type.dart';
import 'package:ourESchool/locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:ourESchool/UI/Utility/Resources.dart';
import 'package:ourESchool/UI/pages/Dashboard/payments/subscription/subscription_Form.dart';

void setupDialogUi() {
  var dialogService = locator<DialogService>();

  var builders = {
    DialogType.Form: (context, dialogRequest, completer) => _FormCustomDialog(
          dialogRequest: dialogRequest,
          onDialogTap: completer,
        ),
    DialogType.SubscriptionsDetails: (context, dialogRequest, completer) =>
        SubscriptionDetails(
          dialogRequest: dialogRequest,
          onDialogTap: completer,
        ),
    DialogType.Basic: (context, dialogRequest, completer) => Dialog(
          child: _BasicCustomDialog(
            dialogRequest: dialogRequest,
            onDialogTap: completer,
          ),
        ),
  };

  dialogService.registerCustomDialogBuilders(builders);
}

class _BasicCustomDialog extends StatelessWidget {
  final DialogRequest dialogRequest;
  final Function(DialogResponse) onDialogTap;
  const _BasicCustomDialog({Key key, this.dialogRequest, this.onDialogTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            dialogRequest.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            dialogRequest.description,
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () => onDialogTap(DialogResponse(confirmed: true)),
            child: Container(
              child: dialogRequest.showIconInMainButton
                  ? Icon(Icons.check_circle)
                  : Text(dialogRequest.mainButtonTitle),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          )
        ],
      ),
    );
  }
}

//todo currently when debug there is no way to dismis without response data being null
class _FormCustomDialog extends HookWidget {
  final DialogRequest dialogRequest;
  final Function(DialogResponse) onDialogTap;
  const _FormCustomDialog({Key key, this.dialogRequest, this.onDialogTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _divisionController = useTextEditingController();
    var _standardController = useTextEditingController();
    return AlertDialog(
      backgroundColor: Theme.of(context).backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      title: Text(
        string.show_announcement_of,
        style: TextStyle(fontWeight: FontWeight.w700),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            string.filter_announcement,
            // style: TextStyle(fontFamily: 'Subtitle'),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: TextField(
              controller: _standardController,
              onChanged: (standard) {},
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              decoration: kTextFieldDecoration.copyWith(
                hintText: string.standard_hint,
                labelText: string.standard,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: TextField(
              controller: _divisionController,
              onChanged: (division) {},
              keyboardType: TextInputType.text,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              decoration: kTextFieldDecoration.copyWith(
                hintText: string.division_hint,
                labelText: string.division,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
        ],
      ),
      actions: <Widget>[
        Hero(
          tag: 'abc',
          child: Row(
            children: <Widget>[
              // FlatButton(
              //   child: Text(string.cancel),
              //   onPressed:

              // ),
              // SizedBox(
              //   width: 10,
              // ),
              FlatButton(
                  child: Text('Global'.toUpperCase()),
                  onPressed: () =>
                      onDialogTap(DialogResponse(responseData: "Global"))),
              SizedBox(
                width: 10,
              ),
              FlatButton(
                child: Text(string.filter),
                onPressed: () async {
                  String std = _standardController.text.trim() +
                      _divisionController.text.trim();
                  onDialogTap(DialogResponse(responseData: std.toUpperCase()));
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
