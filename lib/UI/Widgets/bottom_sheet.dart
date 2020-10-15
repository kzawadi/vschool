import 'package:flutter/material.dart';
import 'package:ourESchool/UI/resources/customWidgets.dart';
import 'package:ourESchool/UI/Utility/Resources.dart';
import 'package:ourESchool/UI/Utility/constants.dart';
import 'package:ourESchool/UI/pages/libary/library_widgets/library_page.dart';
import 'package:ourESchool/UI/pages/feed/feed_page.dart';
import 'package:ourESchool/core/Models/User.dart';
import 'package:ourESchool/core/Models/fees/fees_model.dart';
import 'package:ourESchool/UI/pages/Dashboard/Assignment/AssignmentPage.dart';
import 'package:ourESchool/UI/pages/Dashboard/E-Card/E-CardPage.dart';
import 'package:ourESchool/UI/pages/Dashboard/Fees/create_fees.dart';
import 'package:ourESchool/UI/pages/Dashboard/Fees/fees_page_dashboard.dart';

class BottomSheetPanel {
  static final int search = 0xf058;

  Widget _widgetBottomSheetRow(
    BuildContext context, {
    @required final String label,
    @required final Function onPressed,
    bool isEnable = true,
    final IconData icon,
  }) {
    return Expanded(
      child: customInkWell(
        context: context,
        onPressed: () {
          if (onPressed != null)
            onPressed();
          else {
            Navigator.pop(context);
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                size: 20,
                color: Theme.of(context).accentColor,
              ),
              SizedBox(
                width: 15,
              ),
              customText(
                label,
                context: context,
                style: TextStyle(
                  color: isEnable
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context).colorScheme.primary,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void openBottomSheet(
    BuildContext context, {
    @required final User user,
    final Fees fees,
    @required bool isaTeacher,
  }) async {
    await showModalBottomSheet(
      shape: Theme.of(context).bottomSheetTheme.shape,
      backgroundColor: Theme.of(context).primaryColor,
      clipBehavior: Theme.of(context).bottomSheetTheme.clipBehavior,
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.only(top: 5, bottom: 0),
          height: 300,
          width: fullWidth(context),
          child: _retweet(
            context,
            user: user,
            fees: fees,
            isaTeacher: isaTeacher,
          ),
        );
      },
    );
  }

  Widget _retweet(
    BuildContext context, {
    final User user,
    final Fees fees,
    bool isaTeacher,
  }) {
    return Column(
      children: <Widget>[
        Container(
          width: fullWidth(context) * .1,
          height: 5,
          decoration: BoxDecoration(
            color: Theme.of(context).dividerColor,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        _widgetBottomSheetRow(
          context,
          icon: Icons.format_align_center,
          label: string.announcement,
          onPressed: () {
            kopenPage(
              context,
              //todo create a good page for feed of specific student
              FeedPage(
                announcementFor: user.standard + user.division.toUpperCase(),
              ),
              'Announcement_Page',
            );
          },
        ),
        _widgetBottomSheetRow(
          context,
          icon: Icons.assignment,
          label: string.assignment,
          isEnable: true,
          onPressed: () {
            kopenPage(
                context,
                AssignmentsPage(
                  standard: user.standard + user.division.toUpperCase(),
                ),
                'Assignments_Page');
          },
        ),
        _widgetBottomSheetRow(
          context,
          icon: Icons.assignment_ind,
          label: string.e_card,
          isEnable: true,
          onPressed: () {
            kopenPage(
                context,
                ECardPage(
                  user: user,
                ),
                'ECard_Page');
          },
        ),
        _widgetBottomSheetRow(
          context,
          icon: Icons.book,
          label: 'Library',
          isEnable: true,
          onPressed: () {
            kopenPage(
                context,
                LibraryPage(
                  child: user,
                ),
                'Back_Pack_Page');
          },
        ),
        Visibility(
          visible: isaTeacher,
          child: _widgetBottomSheetRow(
            context,
            icon: Icons.create,
            label: string.fees,
            isEnable: true,
            onPressed: () {
              kopenPage(
                context,
                FeesPageEntry(
                  user: user,
                ),
                'Fees_Page_Entry',
              );
            },
          ),
        ),
        _widgetBottomSheetRow(
          context,
          icon: Icons.equalizer,
          label: string.fees,
          isEnable: true,
          onPressed: () {
            kopenPage(
              context,
              FeesPageDash(
                student: user,
              ),
              'Fees_Page',
            );
          },
        ),
      ],
    );
  }
}
