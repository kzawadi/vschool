import 'package:google_fonts/google_fonts.dart';
import 'package:ourESchool/UI/resources/customWidgets.dart';
import 'package:ourESchool/imports.dart';

class StudentConnectionPage extends StatefulWidget {
  StudentConnectionPage({this.model, this.documentSnapshot, this.color});

  final ChatUsersListPageModel model;
  final DocumentSnapshot documentSnapshot;
  final Color color;

  @override
  _StudentConnectionPageState createState() => _StudentConnectionPageState();
}

class _StudentConnectionPageState extends State<StudentConnectionPage> {
  User student = User();
  List<User> parent = [];

  // ChatUsersListPageModel model;

  @override
  void initState() {
    super.initState();
    student = widget.model.studentListMap[widget.documentSnapshot.id];
    WidgetsBinding.instance.addPostFrameCallback((_) => getParents());
  }

  bool isLoading = true;

  getParents() async {
    isLoading = true;
    setState(() {});
    await widget.model.getParents(widget.documentSnapshot);
    parent = widget.model.studentsParentListMap[widget.documentSnapshot.id];
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // if (isLoading) getParents();
    return Scaffold(
      appBar: AppBar(
        leading: kBackBtn(context),
        centerTitle: true,
        title: Text(
          'Parents',
          style: GoogleFonts.quicksand(
            color: Theme.of(context).accentColor,
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
      body: Hero(
        transitionOnUserGestures: true,
        tag: widget.documentSnapshot.id + '12',
        child: SafeArea(
          bottom: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    _buildStudentProfileImageViewer(
                        context, student.photoUrl, UserType.STUDENT),
                    Card(
                      elevation: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width - 20,
                        padding: EdgeInsets.all(10),
                        child: Text(
                          student.displayName,
                          textAlign: TextAlign.center,
                          style: ktitleStyle.copyWith(fontSize: 25),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        // Card(
                        //   elevation: 0,
                        //   margin: EdgeInsets.only(left: 10),
                        // child:
                        Container(
                          // width: MediaQuery.of(context).size.width - 20,
                          margin: EdgeInsets.only(left: 10),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Guardians',
                            textAlign: TextAlign.left,
                            style: ktitleStyle.copyWith(fontSize: 25),
                          ),
                        ),
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    isLoading
                        ? kBuzyPage(color: Theme.of(context).primaryColor)
                        : Flexible(
                            child: Container(
                              child: GridView.builder(
                                physics: BouncingScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 9 / 14,
                                  crossAxisSpacing: 0,
                                  mainAxisSpacing: 0,
                                ),
                                itemCount: parent.length,
                                itemBuilder: (context, index) {
                                  if (parent[index].displayName == '') {
                                    return Container(
                                      child: Center(
                                        child: Text(
                                          'Parent Not Registered Yet',
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: true,
                                          textAlign: TextAlign.center,
                                          style: ktitleStyle,
                                        ),
                                      ),
                                    );
                                  }
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      _buildStudentProfileImageViewer(
                                          context,
                                          parent[index].photoUrl,
                                          UserType.PARENT),
                                      Card(
                                        elevation: 0,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 5),
                                          child: Text(parent[index].displayName,
                                              overflow: TextOverflow.ellipsis,
                                              style: ktitleStyle),
                                        ),
                                      ),
                                      Container(
                                        child: FlatButton(
                                          child: Text(
                                            'Chat',
                                          ),
                                          onPressed: () {
                                            kopenPage(
                                              context,
                                              MessagingScreen(
                                                parentORteacher: parent[index],
                                                student: student,
                                              ),
                                              'Messaging_Screen',
                                            );
                                          },
                                          color: Theme.of(context).accentColor,
                                          textColor:
                                              Theme.of(context).primaryColor,
                                          clipBehavior: Clip.antiAlias,
                                        ),
                                      )
                                    ],
                                  );
                                },
                              ),
                            ),
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

  Widget _buildStudentProfileImageViewer(
      BuildContext context, String url, UserType userType) {
    final double borderradius = 10;
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(borderradius)),
      ),
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(borderradius)),
          image: DecorationImage(
              fit: BoxFit.cover, image: customAdvanceNetworkImage(url)),
        ),
      ),
    );
  }
}
