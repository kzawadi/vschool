import 'package:ourESchool/UI/pages/Dashboard/Fees/dashboard.dart';
import 'package:ourESchool/UI/pages/Dashboard/Wall/WallPage.dart';
import 'package:ourESchool/imports.dart';

class StudentDashboard extends StatefulWidget {
  StudentDashboard({Key key}) : super(key: key) {
    // setCurrentScreen();
  }
  static String pageName = string.dashboard;

  _StudentDashboardState createState() => _StudentDashboardState();

  @override
  String get screenName => 'Students Dashboard';
}

class _StudentDashboardState extends State<StudentDashboard> with Services {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      height: 110,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RowReusableCardButton(
                            tileColor: Colors.deepOrangeAccent,
                            label: string.e_card,
                            onPressed: () {
                              kopenPage(context, ECardPage(), 'ECard_Page');
                            },
                            icon: Icons.perm_contact_calendar,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          RowReusableCardButton(
                            tileColor: null,
                            icon: Icons.av_timer,
                            label: string.timetable,
                            onPressed: () {
                              kopenPage(
                                  context, TimeTablePage(), 'Time_Table_Page');
                            },
                          ),
                        ],
                      ),
                    ),
                    ColumnReusableCardButton(
                      height: 70,
                      tileColor: Colors.orangeAccent,
                      label: string.announcement,
                      icon: CustomIcons.megaphone,
                      onPressed: () {
                        kopenPage(
                            context, AnnouncementPage(), 'Announcement_Page');
                      },
                    ),
                    ColumnReusableCardButton(
                      directionIconHeroTag: string.announcement,
                      height: 70,
                      tileColor: Colors.orangeAccent,
                      label: string.wall,
                      icon: CustomIcons.megaphone,
                      onPressed: () {
                        kopenPage(context, WallPage(), 'Wall_Page');
                      },
                    ),
                    Container(
                      height: 110,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RowReusableCardButton(
                            tileColor: Colors.blueGrey,
                            icon: CustomIcons.traveler_with_a_suitcase,
                            label: string.holidays,
                            onPressed: () {
                              kopenPage(context, HolidayPage(), 'Holiday_Page');
                            },
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          RowReusableCardButton(
                            tileColor: Colors.indigoAccent,
                            icon: Icons.assessment,
                            label: string.results,
                            onPressed: () {
                              kopenPage(context, ResultPage(), 'Result_Page');
                              //todo better implementation of the in app messaging events
                              fiam.triggerEvent('result_page');
                              Scaffold.of(context).showSnackBar(const SnackBar(
                                  content:
                                      Text("Triggering event: result_page")));
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 110,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RowReusableCardButton(
                            tileColor: Colors.lightGreen,
                            label: string.assignment,
                            onPressed: () {
                              kopenPage(context, AssignmentsPage(),
                                  'Assignments_Page');
                            },
                            icon: Icons.assignment,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          RowReusableCardButton(
                            tileColor: Colors.lime,
                            icon: Icons.attach_money,
                            label: string.fees,
                            onPressed: () {
                              kopenPage(
                                  context, FeesPageDash(), 'Fees_Page_Dash');
                            },
                          ),
                        ],
                      ),
                    ),
                    ColumnReusableCardButton(
                        height: 70,
                        tileColor: Colors.grey,
                        label: string.transportation,
                        onPressed: () {
                          kopenPage(context, TransportationPage(),
                              'Transportation_Page');
                        },
                        icon: FontAwesomeIcons.bus),
                    SizedBox(
                      height: 105,
                      child: ListView(
                        shrinkWrap: false,
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              RowReusableCardButtonBanner(
                                paddingTop: 0,
                                tileColor: Colors.pink,
                                icon: Icons.assistant_photo,
                                label: string.exams,
                                onPressed: () {
                                  kopenPage(context, TopicSelectPage(),
                                      'Topic_Select_Page');
                                },
                              ),
                              RowReusableCardButtonBanner(
                                paddingTop: 0,
                                tileColor: Colors.tealAccent,
                                icon: FontAwesomeIcons.book,
                                label: string.e_book,
                                onPressed: () {
                                  kopenPage(
                                      context, EBookSelect(), 'EBook_Select');
                                },
                              ),
                              RowReusableCardButtonBanner(
                                paddingTop: 0,
                                tileColor: Colors.deepPurpleAccent,
                                icon: FontAwesomeIcons.cameraRetro,
                                label: string.video,
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 110,
                      child: ListView(
                        shrinkWrap: false,
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              RowReusableCardButtonBanner(
                                tileColor: Colors.pinkAccent,
                                icon: FontAwesomeIcons.female,
                                label: string.parenting_guide,
                                onPressed: () {
                                  kopenPage(context, ParentingGuidePage(),
                                      'ParentingGuide_Page');
                                },
                              ),
                              RowReusableCardButtonBanner(
                                tileColor: Colors.red,
                                icon: FontAwesomeIcons.medkit,
                                label: string.health_tips,
                                onPressed: () {},
                              ),
                              RowReusableCardButtonBanner(
                                tileColor: Colors.blue,
                                icon: FontAwesomeIcons.userMd,
                                label: string.vaccinations,
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    ColumnReusableCardButton(
                      tileColor: Colors.greenAccent,
                      height: 70,
                      label: string.offers,
                      onPressed: () {},
                      icon: Icons.receipt,
                      directionIcon: Icons.chevron_right,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
