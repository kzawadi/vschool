import 'package:ourESchool/UI/pages/Dashboard/Wall/WallPage.dart';
import 'package:ourESchool/core/services/data_Entry/data_Entry_Page.dart';
import 'package:ourESchool/core/services/student_data_Entry/student_data_Entry_Page.dart';
import 'package:ourESchool/imports.dart';

class MainDashboard extends StatefulWidget {
  MainDashboard({Key key}) : super(key: key) {
    // setCurrentScreen();
  }
  static String pageName = string.dashboard;

  _MainDashboardState createState() => _MainDashboardState();

  String get screenName => 'ParentAndTeacher Dashboard';
}

class _MainDashboardState extends State<MainDashboard> with Services {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBarAlternative(
        buttonHeroTag: string.dashboard,
        title: string.dashboard,
        onPressed: null,
      ),
      // extendBody: true,
      body: Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  ColumnReusableCardButton(
                    directionIconHeroTag: string.childrens,
                    height: 70,
                    tileColor: Colors.deepPurpleAccent,
                    label: string.childrens,
                    icon: FontAwesomeIcons.child,
                    onPressed: () {
                      kopenPage(context, ChildrensPage(), 'Childrens_Page');
                    },
                  ),
                  ColumnReusableCardButton(
                    directionIconHeroTag: string.wall,
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
                            kopenPage(context, HolidayPage(), 'HolidayPage');
                          },
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        RowReusableCardButton(
                          tileColor: Colors.lightGreen,
                          label: string.assignment,
                          onPressed: () {
                            kopenPage(
                                context, AssignmentsPage(), 'Assignments_Page');
                          },
                          icon: Icons.assignment,
                        ),
                      ],
                    ),
                  ),
                  ColumnReusableCardButton(
                    directionIconHeroTag: string.transportation,
                    height: 70,
                    tileColor: Colors.grey,
                    label: string.transportation,
                    onPressed: () {
                      kopenPage(
                          context, TransportationPage(), 'TransportationPage');
                      // analytics.logSelectContent(
                      //     contentType: 'Fees Page Dashboard', itemId: null);
                    },
                    icon: FontAwesomeIcons.bus,
                  ),
                  ColumnReusableCardButton(
                    directionIconHeroTag: 'Data_Importer',
                    height: 70,
                    tileColor: Colors.grey,
                    label: 'Data Importer',
                    onPressed: () {
                      kopenPage(context, DataImpoter(), 'Data_Importer');
                      // analytics.logSelectContent(
                      //     contentType: 'Fees Page Dashboard', itemId: null);
                    },
                    icon: FontAwesomeIcons.database,
                  ),
                  ColumnReusableCardButton(
                    directionIconHeroTag: 'Data_Importer_student',
                    height: 70,
                    tileColor: Colors.grey,
                    label: 'Student Data Importer',
                    onPressed: () {
                      kopenPage(context, StudentDataImpoter(),
                          'Student_Data_Importer');
                      // analytics.logSelectContent(
                      //     contentType: 'Fees Page Dashboard', itemId: null);
                    },
                    icon: FontAwesomeIcons.database,
                  ),
                  ColumnReusableCardButton(
                    directionIconHeroTag: 'childprofile',
                    height: 70,
                    tileColor: Colors.blue,
                    label: 'Child Profile',
                    onPressed: () {
                      kopenPage(context, ProfilePage(), 'Child_Profile');
                      // analytics.logSelectContent(
                      //     contentType: 'Fees Page Dashboard', itemId: null);
                    },
                    icon: FontAwesomeIcons.user,
                  ),
                  SizedBox(
                    height: 105,
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: false,
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RowReusableCardButtonBanner(
                              paddingTop: 0,
                              tileColor: Colors.pinkAccent,
                              icon: FontAwesomeIcons.female,
                              label: string.parenting_guide,
                              onPressed: () {
                                kopenPage(context, ParentingGuidePage(),
                                    'ParentingGuide_Page');
                              },
                            ),
                            RowReusableCardButtonBanner(
                              paddingTop: 0,
                              tileColor: Colors.red,
                              icon: FontAwesomeIcons.medkit,
                              label: string.health_tips,
                              onPressed: () {},
                            ),
                            RowReusableCardButtonBanner(
                              paddingTop: 0,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
