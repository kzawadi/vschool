import 'package:framy_annotation/framy_annotation.dart';
import 'package:ourESchool/core/enums/bottom_sheet_type.dart';
import 'package:ourESchool/locator.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:flutter/material.dart';

void setupBottomSheetUi() {
  final bottomSheetService = locator<BottomSheetService>();

  final builders = {
    BottomSheetType.floating: (context, sheetRequest, completer) =>
        FloatingBoxBottomSheet(
          request: sheetRequest,
          completer: completer,
        )
  };

  bottomSheetService.setCustomSheetBuilders(builders);
}

@FramyWidget()
class FloatingBoxBottomSheet extends StatelessWidget {
  final SheetRequest request;
  final Function(SheetResponse) completer;
  const FloatingBoxBottomSheet({
    Key key,
    this.request,
    this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25),
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            request.title ?? "Title",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey[900],
            ),
          ),
          SizedBox(height: 10),
          Text(
            request.description ?? "Description",
            style: TextStyle(color: Colors.grey),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                onPressed: () => completer(SheetResponse(confirmed: true)),
                child: Text(
                  request.secondaryButtonTitle ?? "Secondary Tittle",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
              FlatButton(
                onPressed: () => completer(SheetResponse(confirmed: true)),
                child: Text(
                  request.mainButtonTitle ?? "Main Tittle",
                  style: TextStyle(color: Colors.white),
                ),
                color: Theme.of(context).primaryColor,
              )
            ],
          )
        ],
      ),
    );
  }
}
