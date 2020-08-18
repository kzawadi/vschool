import 'package:flutter/material.dart';
import 'package:ourESchool/UI/Utility/Resources.dart';
import 'package:ourESchool/UI/Utility/constants.dart';
import 'package:ourESchool/UI/Widgets/ChildrenGridViewCard.dart';
import 'package:ourESchool/UI/Widgets/bottom_sheet.dart';
import 'package:ourESchool/UI/Widgets/TopBar.dart';
import 'package:ourESchool/UI/pages/BaseView.dart';
import 'package:ourESchool/core/enums/ViewState.dart';
import 'package:ourESchool/core/viewmodel/ProfilePageModel.dart';
import 'package:ourESchool/core/enums/UserType.dart';
import 'package:provider/provider.dart';

class ChildrensPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isTeacher = false;
    var userType = Provider.of<UserType>(context, listen: false);
    if (userType == UserType.TEACHER) {
      isTeacher = true;
    }
    return BaseView<ProfilePageModel>(
      onModelReady: (model) => model.getChildrens(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: TopBar(
            buttonHeroTag: string.childrens,
            child: kBackBtn(context),
            onPressed: () {
              kbackBtn(context);
            },
            title: string.childrens,
          ),
          body: model.state == ViewState.Busy
              ? kBuzyPage(color: Theme.of(context).primaryColor)
              : model.childrens.length == 0
                  ? Center(
                      child: Text('No Child Added in database!',
                          style: ktitleStyle.copyWith(fontSize: 20)),
                    )
                  : GridView.builder(
                      physics: BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 9 / 9,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0,
                      ),
                      itemCount: model.childrens.length,
                      itemBuilder: (context, index) {
                        return Container(
                          constraints:
                              BoxConstraints(maxHeight: 200, maxWidth: 200),
                          child: ChildrenGridViewCard(
                            user: model.childrens[index],
                            onTap: () {
                              if (model.childrens[index].displayName != '')
                                BottomSheetPanel().openRetweetbottomSheet(
                                  context,
                                  user: model.childrens[index],
                                  isaTeacher: isTeacher,
                                );
                            },
                          ),
                        );
                      },
                    ),
        );
      },
    );
  }
}
