import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ourESchool/UI/resources/colors.dart';

class FeesPageDash extends StatefulWidget {
  @override
  _FeesPageState createState() => _FeesPageState();
}

class _FeesPageState extends State<FeesPageDash> {
  static final List<String> chartDropdownItems = [
    'Last 7 days',
    'Last month',
    'Last year'
  ];
  String actualDropdown = chartDropdownItems[0];
  int actualChart = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2.0,
          backgroundColor: Colors.white,
          title: Center(
            child: Text('FEES REPORT',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 30.0)),
          ),
        ),
        body: StaggeredGridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          children: <Widget>[
            _buildTile(
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Total fees (2020)',
                              style: TextStyle(color: Colors.blueAccent)),
                          Text('800,000 TZS',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 34.0))
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
                          )))
                    ]),
              ),
            ),
            _buildTile(
              Padding(
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
                            child: Icon(Icons.history,
                                color: Colors.white, size: 30.0),
                          )),
                      Padding(padding: EdgeInsets.only(bottom: 16.0)),
                      Text('History',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 24.0)),
                      Text('Fees Payments Records',
                          style: TextStyle(color: Colors.black45)),
                    ]),
              ),
            ),
            _buildTile(
              Padding(
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
                            child: Icon(Icons.notifications,
                                color: Colors.white, size: 30.0),
                          )),
                      Padding(padding: EdgeInsets.only(bottom: 16.0)),
                      Text('Alerts',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 24.0)),
                      Text('All ', style: TextStyle(color: Colors.black45)),
                    ]),
              ),
            ),
            _buildTile(
              Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Activity',
                                  style: TextStyle(color: Colors.green)),
                              Text('\$3M',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 34.0)),
                            ],
                          ),
                          // DropdownButton(
                          //   isDense: true,
                          //   value: actualDropdown,
                          //   onChanged: (String value) => setState(() {
                          //     actualDropdown = value;
                          //     actualChart = chartDropdownItems
                          //         .indexOf(value); // Refresh the chart
                          //   }),
                          //   items: chartDropdownItems.map(
                          //     (String title) {
                          //       return DropdownMenuItem(
                          //         value: title,
                          //         child: Text(title,
                          //             style: TextStyle(
                          //                 color: Colors.blue,
                          //                 fontWeight: FontWeight.w400,
                          //                 fontSize: 14.0)),
                          //       );
                          //     },
                          //   ).toList(),
                          // )
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 4.0)),
                      Sparkline(
                        data: Charts.charts[actualChart],
                        lineWidth: 5.0,
                        lineColor: Colors.greenAccent,
                      )
                    ],
                  )),
            ),
            _buildTile(
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Other School Payments',
                            style: TextStyle(color: Colors.redAccent)),
                        Text('3',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 34.0))
                      ],
                    ),
                    // Material(
                    //   color: Colors.red,
                    //   borderRadius: BorderRadius.circular(24.0),
                    //   child: Center(
                    //     child: Padding(
                    //       padding: EdgeInsets.all(16.0),
                    //       child: Icon(Icons.view_stream,
                    //           color: Colors.white, size: 30.0),
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
              onTap: () {},
              //=> Navigator.of(context).push(MaterialPageRoute(builder: (_) => ShopItemsPage())),
            ),
            _buildTile(
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Other School Payments',
                            style: TextStyle(color: Colors.redAccent)),
                        Text('3',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 34.0))
                      ],
                    ),
                    // Material(
                    //   color: Colors.red,
                    //   borderRadius: BorderRadius.circular(24.0),
                    //   child: Center(
                    //     child: Padding(
                    //       padding: EdgeInsets.all(16.0),
                    //       child: Icon(Icons.view_stream,
                    //           color: Colors.white, size: 30.0),
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
              onTap: () {},
              //=> Navigator.of(context).push(MaterialPageRoute(builder: (_) => ShopItemsPage())),
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
        ));
  }

  Widget _buildTile(Widget child, {Function() onTap}) {
    return Material(
        elevation: 14.0,
        borderRadius: BorderRadius.circular(12.0),
        shadowColor: Color(0x802196F3),
        child: InkWell(

            /// Do onTap() if it isn't null, otherwise do print()
            onTap: onTap != null
                ? () => onTap()
                : () {
                    print('Not set yet');
                  },
            child: child));
  }
}
