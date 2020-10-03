import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ourESchool/UI/Utility/ui_helpers.dart';
import 'package:ourESchool/UI/resources/colors.dart';
import 'package:ourESchool/UI/resources/text_styles.dart';
import 'package:ourESchool/core/viewmodel/fees/fees_page_model.dart';
import 'package:ourESchool/imports.dart';
import 'package:stacked/stacked.dart';

class FeesPageDash extends StatelessWidget {
  final User student;

  static final List<String> chartDropdownItems = [
    'Last 7 days',
    'Last month',
    'Last year'
  ];
  final String actualDropdown = chartDropdownItems[0];
  final int actualChart = 0;

  FeesPageDash({Key key, this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FeesPageModel>.reactive(
      viewModelBuilder: () => FeesPageModel(studentId: student.id),
      onModelReady: (model) => model.futureToRun(),
      builder: (context, model, child) {
        return model.isBusy
            ? kBuzyPage(
                color: isThemeCurrentlyDark(context)
                    ? MyColors.dark
                    : MyColors.lightMilky)
            : model.hasError
                ? Center(
                    child: Scaffold(
                      appBar: TopBar(
                        child: kBackBtn(context),
                        onPressed: () {
                          kbackBtn(context);
                        },
                        title: 'NO FEES',
                        buttonHeroTag: 'feehero',
                      ),
                      body: Center(
                        child: Container(
                          child: AutoSizeText(
                            'This Student FEES data is not yet available',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.red,
                                  letterSpacing: .5),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : Scaffold(
                    appBar: TopBar(
                      buttonHeroTag: 'feeshero',
                      child: kBackBtn(context),
                      onPressed: () {
                        kbackBtn(context);
                      },
                      title: string.fees_title,
                    ),
                    body: StaggeredGridView.count(
                      physics: BouncingScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 12.0,
                      mainAxisSpacing: 12.0,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      children: <Widget>[
                        _buildTile(
                          context,
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Total Fees ',
                                      style: isThemeCurrentlyDark(context)
                                          ? BodyStylesDefault.white
                                          : BodyStylesDefault.black,
                                    ),
                                    Text(model.data.totalFees,
                                        style: isThemeCurrentlyDark(context)
                                            ? HeadingStylesMaterial.light
                                            : HeadingStylesMaterial.dark),
                                  ],
                                ),
                                Material(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(24.0),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Icon(Icons.attach_money,
                                          color: Colors.white, size: 30.0),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        _buildTile(
                          context,
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Material(
                                    color: Colors.teal,
                                    shape: CircleBorder(),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Icon(FontAwesomeIcons.checkCircle,
                                          color: Colors.white, size: 30.0),
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 16.0),
                                ),
                                Text(
                                  'Paid',
                                  style: isThemeCurrentlyDark(context)
                                      ? BodyStylesDefault.white
                                      : BodyStylesDefault.black,
                                ),
                                Text(
                                  model.data.paid,
                                  style: isThemeCurrentlyDark(context)
                                      ? HeadingStylesMaterial.light
                                      : HeadingStylesMaterial.dark,
                                ),
                              ],
                            ),
                          ),
                        ),
                        _buildTile(
                          context,
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Material(
                                  color: Colors.amber,
                                  shape: CircleBorder(),
                                  child: Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Icon(
                                        FontAwesomeIcons.exclamationCircle,
                                        color: Colors.white,
                                        size: 30.0),
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(bottom: 16.0)),
                                Text(
                                  'Due',
                                  style: isThemeCurrentlyDark(context)
                                      ? BodyStylesDefault.white
                                      : BodyStylesDefault.black,
                                ),
                                Text(
                                  model.data.due,
                                  style: isThemeCurrentlyDark(context)
                                      ? HeadingStylesMaterial.light
                                      : HeadingStylesMaterial.dark,
                                ),
                              ],
                            ),
                          ),
                        ),
                        _buildTile(
                          context,
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'Activity',
                                          style: isThemeCurrentlyDark(context)
                                              ? BodyStylesDefault.white
                                              : BodyStylesDefault.black,
                                        ),
                                        Text(
                                          '\$3M',
                                          style: isThemeCurrentlyDark(context)
                                              ? HeadingStylesMaterial.light
                                              : HeadingStylesMaterial.dark,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 4.0),
                                ),
                                Sparkline(
                                  data: Charts.charts[actualChart],
                                  lineWidth: 5.0,
                                  lineColor: Colors.greenAccent,
                                )
                              ],
                            ),
                          ),
                        ),
                        _buildTile(
                          context,
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Other Payments',
                                      style: isThemeCurrentlyDark(context)
                                          ? BodyStylesDefault.white
                                          : BodyStylesDefault.black,
                                    ),
                                    Text(
                                      '3',
                                      style: isThemeCurrentlyDark(context)
                                          ? HeadingStylesMaterial.light
                                          : HeadingStylesMaterial.dark,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          onTap: () {},
                        ),
                        _buildTile(
                          context,
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Other Payments',
                                      style: isThemeCurrentlyDark(context)
                                          ? BodyStylesDefault.white
                                          : BodyStylesDefault.black,
                                    ),
                                    Text(
                                      '3',
                                      style: isThemeCurrentlyDark(context)
                                          ? HeadingStylesMaterial.light
                                          : HeadingStylesMaterial.dark,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          onTap: () {},
                        )
                      ],
                      staggeredTiles: [
                        StaggeredTile.extent(2, 110.0),
                        StaggeredTile.extent(1, 180.0),
                        StaggeredTile.extent(1, 180.0),
                        StaggeredTile.extent(2, 220.0),
                        StaggeredTile.extent(1, 110.0),
                        StaggeredTile.extent(1, 110.0),
                      ],
                    ),
                  );
      },
    );
  }

  Widget _buildTile(BuildContext context, {Widget child, Function() onTap}) {
    return Material(
      color:
          isThemeCurrentlyDark(context) ? MyColors.dark : MyColors.lightMilky,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(12.0),
      shadowColor:
          isThemeCurrentlyDark(context) ? MyColors.dark : MyColors.light,
      child: InkWell(

          /// Do onTap() if it isn't null, otherwise do print()
          onTap: onTap != null
              ? () => onTap()
              : () {
                  print('Not set yet');
                },
          child: child),
    );
  }
}
