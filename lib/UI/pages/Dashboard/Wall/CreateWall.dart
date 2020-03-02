import 'package:ourESchool/core/Models/school_wall/wall_model.dart';
import 'package:ourESchool/core/viewmodel/Wall/CreateWallModel.dart';
import 'package:ourESchool/UI/resources/text_styles.dart';
import 'package:ourESchool/UI/Utility/ui_helpers.dart';
import 'package:ourESchool/UI/resources/colors.dart';
import 'package:ourESchool/imports.dart';

class CreateWall extends StatefulWidget {
  CreateWall({Key key}) : super(key: key);

  _CreateWallState createState() => _CreateWallState();
}

class _CreateWallState extends State<CreateWall> {
  String path = '';

  TextEditingController _standardController;
  TextEditingController _divisionController;
  TextEditingController _schoolNameController;
  TextEditingController _missionController;
  TextEditingController _beliefsController;
  TextEditingController _historyController;
  TextEditingController _regNoController;
  TextEditingController _locationController;
  TextEditingController _contactsController;
  TextEditingController _dirSmsController;

  AnnouncementType announcementType = AnnouncementType.EVENT;

  FocusNode _focusNode = new FocusNode();
  var _scaffoldKey;
  bool isPosting = false;
  Color postTypeFontColor = Colors.black;
  bool isReadyToPost = false;
  String postType = 'GLOBAL';

  @override
  void initState() {
    super.initState();
    _scaffoldKey = GlobalKey<ScaffoldState>();
    _standardController = TextEditingController();
    _schoolNameController = TextEditingController();
    _divisionController = TextEditingController();
    _missionController = TextEditingController();
    _beliefsController = TextEditingController();
    _historyController = TextEditingController();
    _regNoController = TextEditingController();
    _locationController = TextEditingController();
    _contactsController = TextEditingController();
    _dirSmsController = TextEditingController();
  }

  floatingButtonPressed(CreateWallModel model, BuildContext context) async {
    User user = Provider.of<User>(context, listen: false);
    var wall = Wall(
      by: user.id,
      schoolName: _schoolNameController.text,
      mission: _missionController.text,
      beliefs: _beliefsController.text,
      history: _historyController.text,
      contacts: _contactsController.text,
      dirSms: _dirSmsController.text,
      location: _locationController.text,
      regNo: _regNoController.text,
      forClass:
          postType == 'SPECIFIC' ? _standardController.text.trim() : 'Global',
      forDiv: postType == 'SPECIFIC'
          ? _divisionController.text.toUpperCase().trim()
          : 'Global',
      photoUrl: path,
    );
    if (postType == 'SPECIFIC') {
      if (_standardController.text.trim() == '' ||
          _divisionController.text.trim() == '') {
        _scaffoldKey.currentState.showSnackBar(
            ksnackBar(context, 'Please Specify Class and Division'));
      } else {
        await model.postWall(wall);
        kbackBtn(context);
      }
    } else {
      await model.postWall(wall);
      kbackBtn(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    // postTypeFontColor = Theme.of(context).brightness == Brightness.dark
    //     ? Colors.white
    //     : Colors.black;
    return BaseView<CreateWallModel>(
      onModelReady: (model) => model.getUserData(),
      builder: (context, model, child) {
        isPosting = model.state == ViewState.Idle ? false : true;
        return Scaffold(
          key: _scaffoldKey,
          appBar: TopBar(
            onTitleTapped: () {},
            child: kBackBtn,
            onPressed: () {
              if (!isPosting) kbackBtn(context);
            },
            title: string.create_wall,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (isReadyToPost) floatingButtonPressed(model, context);
            },
            backgroundColor: isReadyToPost
                ? Theme.of(context).primaryColor
                : Colors.blueGrey,
            child: model.state == ViewState.Busy
                ? SpinKitDoubleBounce(
                    color: Colors.white,
                    size: 20,
                  )
                : Icon(Icons.check),
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      // this is a title of the wall
                      //it will say things as 'THIS IS LIKE WEBSITE
                      //CONTAINING IMPORTNANT INFOMATION ABOUT YOUR SCHOOL'
                      child: Text(
                        string.about_wall,
                        style: isThemeCurrentlyDark(context)
                            ? HeadingStylesDefault.white
                            : HeadingStylesDefault.black,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: Text(
                    string.school_logo,
                    style: isThemeCurrentlyDark(context)
                        ? SubHeadingStylesMaterial.light
                        : SubHeadingStylesMaterial.dark,
                  ),
                ),
                Container(
                  color: MyColors.dark,
                  constraints: BoxConstraints(maxHeight: 300, minHeight: 0),
                  child: path == ''
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            MaterialButton(
                              height: 100,
                              minWidth: MediaQuery.of(context).size.width / 2.2,
                              child: Icon(FontAwesomeIcons.camera),
                              onPressed: () async {
                                Future<String> path =
                                    Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => CameraScreen()),
                                );
                                path.then((path) {
                                  if (path != null)
                                    setState(() {
                                      this.path = path;
                                    });
                                  print('Path' + path);
                                });
                              },
                            ),
                            MaterialButton(
                              minWidth: MediaQuery.of(context).size.width / 2.2,
                              height: 100,
                              child: Icon(Icons.photo_library),
                              onPressed: () async {
                                String _path = await openFileExplorer(
                                  FileType.IMAGE,
                                  mounted,
                                  context,
                                );
                                if (_path != null)
                                  setState(() {
                                    path = _path;
                                  });
                              },
                            ),
                          ],
                        )
                      : Card(
                          elevation: 4,
                          child: Container(
                            // constraints:
                            //     BoxConstraints(maxHeight: 300, minHeight: 0),
                            width: MediaQuery.of(context).size.width,
                            child: Stack(
                              fit: StackFit.expand,
                              children: <Widget>[
                                Image(
                                  fit: BoxFit.contain,
                                  image: FileImage(
                                    File(path),
                                  ),
                                ),
                                Positioned(
                                  right: -0,
                                  bottom: -0,
                                  child: Card(
                                    color: MaterialColors.red,
                                    elevation: 10,
                                    shape: kCardCircularShape,
                                    child: MaterialButton(
                                      minWidth: 20,
                                      height: 10,
                                      onPressed: () {
                                        setState(
                                          () {
                                            path = '';
                                          },
                                        );
                                      },
                                      child: Icon(
                                        Icons.close,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    string.school_name,
                    style: isThemeCurrentlyDark(context)
                        ? SubHeadingStylesMaterial.light
                        : SubHeadingStylesMaterial.dark,
                  ),
                ),

                ///school name text entry
                Container(
                  height: 100,
                  child: TextField(
                    controller: _schoolNameController,
                    enabled: !isPosting,
                    maxLength: 60,
                    onChanged: (schoolName) {
                      setState(() {
                        isReadyToPost = schoolName == '' ? false : true;
                      });
                    },
                    maxLines: 50,
                    keyboardType: TextInputType.multiline,
                    style: isThemeCurrentlyDark(context)
                        ? BodyStylesDefault.white.copyWith(fontSize: 20)
                        : BodyStylesDefault.black.copyWith(fontSize: 20),
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: string.your_school_name,
                      labelText: string.school_name,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text(
                    string.mission,
                    style: isThemeCurrentlyDark(context)
                        ? SubHeadingStylesMaterial.light
                        : SubHeadingStylesMaterial.dark,
                  ),
                ),

                ///mision text entry
                Container(
                  height: 100,
                  child: TextField(
                    controller: _missionController,
                    enabled: !isPosting,
                    maxLength: null,
                    onChanged: (mission) {
                      setState(() {
                        isReadyToPost = mission == '' ? false : true;
                      });
                    },
                    maxLines: 300,
                    keyboardType: TextInputType.multiline,
                    style: isThemeCurrentlyDark(context)
                        ? BodyStylesDefault.white.copyWith(fontSize: 20)
                        : BodyStylesDefault.black.copyWith(fontSize: 20),
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: string.type_mission_here,
                      labelText: string.mission,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),

                Center(
                  child: Text(
                    string.history,
                    style: isThemeCurrentlyDark(context)
                        ? SubHeadingStylesMaterial.light
                        : SubHeadingStylesMaterial.dark,
                  ),
                ),

                // beliefs text entry
                Container(
                  height: 100,
                  // color: Colors.blueAccent.withOpacity(0.5),
                  child: TextField(
                    controller: _historyController,
                    enabled: !isPosting,
                    //focusNode: _focusNode,
                    maxLength: null,
                    onChanged: (belief) {
                      setState(() {
                        isReadyToPost = belief == '' ? false : true;
                      });
                    },
                    maxLines: 300,
                    keyboardType: TextInputType.multiline,
                    style: isThemeCurrentlyDark(context)
                        ? BodyStylesDefault.white.copyWith(fontSize: 20)
                        : BodyStylesDefault.black.copyWith(fontSize: 20),
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: string.type_history_here,
                      labelText: string.history,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),

                Center(
                  child: Text(
                    string.regNo,
                    style: isThemeCurrentlyDark(context)
                        ? SubHeadingStylesMaterial.light
                        : SubHeadingStylesMaterial.dark,
                  ),
                ),

                // beliefs text entry
                Container(
                  height: 100,
                  // color: Colors.blueAccent.withOpacity(0.5),
                  child: TextField(
                    controller: _regNoController,
                    enabled: !isPosting,
                    //focusNode: _focusNode,
                    maxLength: null,
                    onChanged: (belief) {
                      setState(() {
                        isReadyToPost = belief == '' ? false : true;
                      });
                    },
                    maxLines: 300,
                    keyboardType: TextInputType.multiline,
                    style: isThemeCurrentlyDark(context)
                        ? BodyStylesDefault.white.copyWith(fontSize: 20)
                        : BodyStylesDefault.black.copyWith(fontSize: 20),
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: string.type_registration_here,
                      labelText: string.regNo,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),

                Center(
                  child: Text(
                    string.dirSms,
                    style: isThemeCurrentlyDark(context)
                        ? SubHeadingStylesMaterial.light
                        : SubHeadingStylesMaterial.dark,
                  ),
                ),

                // beliefs text entry
                Container(
                  height: 100,
                  // color: Colors.blueAccent.withOpacity(0.5),
                  child: TextField(
                    controller: _dirSmsController,
                    enabled: !isPosting,
                    //focusNode: _focusNode,
                    maxLength: null,
                    onChanged: (belief) {
                      setState(() {
                        isReadyToPost = belief == '' ? false : true;
                      });
                    },
                    maxLines: 300,
                    keyboardType: TextInputType.multiline,
                    style: isThemeCurrentlyDark(context)
                        ? BodyStylesDefault.white.copyWith(fontSize: 20)
                        : BodyStylesDefault.black.copyWith(fontSize: 20),
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: string.type_dirSms_here,
                      labelText: string.dirSms,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),

                Center(
                  child: Text(
                    'Forms and important school documents feature itakuwa implemented here soon',
                    style: isThemeCurrentlyDark(context)
                        ? SubHeadingStylesMaterial.light
                        : SubHeadingStylesMaterial.dark,
                  ),
                ),

                // /// history text entry
                // Container(
                //   height: 150,
                //   // color: Colors.blueAccent.withOpacity(0.5),
                //   child: TextField(
                //     controller: _historyController,
                //     enabled: !isPosting,
                //     focusNode: _focusNode,
                //     maxLength: null,
                //     onChanged: (history) {
                //       setState(() {
                //         isReadyToPost = history == '' ? false : true;
                //       });
                //     },
                //     maxLines: 300,
                //     keyboardType: TextInputType.multiline,
                //     style: TextStyle(
                //       fontSize: 20,
                //       fontWeight: FontWeight.w500,
                //     ),
                //     decoration: kTextFieldDecoration.copyWith(
                //       hintText: string.type_mission_here,
                //       labelText: string.mission,
                //     ),
                //   ),
                // ),

                // /// regNo text entry
                // Container(
                //   height: 150,
                //   // color: Colors.blueAccent.withOpacity(0.5),
                //   child: TextField(
                //     controller: _regNoController,
                //     enabled: !isPosting,
                //     focusNode: _focusNode,
                //     maxLength: null,
                //     onChanged: (regNo) {
                //       setState(() {
                //         isReadyToPost = regNo == '' ? false : true;
                //       });
                //     },
                //     maxLines: 300,
                //     keyboardType: TextInputType.multiline,
                //     style: TextStyle(
                //       fontSize: 20,
                //       fontWeight: FontWeight.w500,
                //     ),
                //     decoration: kTextFieldDecoration.copyWith(
                //       hintText: string.type_mission_here,
                //       labelText: string.mission,
                //     ),
                //   ),
                // ),

                // /// location text entry
                // Container(
                //   height: 150,
                //   // color: Colors.blueAccent.withOpacity(0.5),
                //   child: TextField(
                //     controller: _locationController,
                //     enabled: !isPosting,
                //     focusNode: _focusNode,
                //     maxLength: null,
                //     onChanged: (location) {
                //       setState(() {
                //         isReadyToPost = location == '' ? false : true;
                //       });
                //     },
                //     maxLines: 300,
                //     keyboardType: TextInputType.multiline,
                //     style: TextStyle(
                //       fontSize: 20,
                //       fontWeight: FontWeight.w500,
                //     ),
                //     decoration: kTextFieldDecoration.copyWith(
                //       hintText: string.type_mission_here,
                //       labelText: string.mission,
                //     ),
                //   ),
                // ),

                // ///contacts text entry
                // Container(
                //   height: 150,
                //   // color: Colors.blueAccent.withOpacity(0.5),
                //   child: TextField(
                //     controller: _contactsController,
                //     enabled: !isPosting,
                //     focusNode: _focusNode,
                //     maxLength: null,
                //     onChanged: (contact) {
                //       setState(() {
                //         isReadyToPost = contact == '' ? false : true;
                //       });
                //     },
                //     maxLines: 300,
                //     keyboardType: TextInputType.multiline,
                //     style: TextStyle(
                //       fontSize: 20,
                //       fontWeight: FontWeight.w500,
                //     ),
                //     decoration: kTextFieldDecoration.copyWith(
                //       hintText: string.type_mission_here,
                //       labelText: string.mission,
                //     ),
                //   ),
                // ),

                // /// dirSms text entry
                // Container(
                //   height: 150,
                //   // color: Colors.blueAccent.withOpacity(0.5),
                //   child: TextField(
                //     controller: _dirSmsController,
                //     enabled: !isPosting,
                //     focusNode: _focusNode,
                //     maxLength: null,
                //     onChanged: (dirsms) {
                //       setState(() {
                //         isReadyToPost = dirsms == '' ? false : true;
                //       });
                //     },
                //     maxLines: 300,
                //     keyboardType: TextInputType.multiline,
                //     style: TextStyle(
                //       fontSize: 20,
                //       fontWeight: FontWeight.w500,
                //     ),
                //     decoration: kTextFieldDecoration.copyWith(
                //       hintText: string.type_mission_here,
                //       labelText: string.mission,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
