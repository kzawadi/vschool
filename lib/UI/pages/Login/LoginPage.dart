import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:ourESchool/UI/pages/Profiles/TeacherProfilePage.dart';
import 'package:ourESchool/UI/resources/colors.dart';
import 'package:ourESchool/imports.dart';
import 'dart:ui' as ui;

class LoginPage extends StatefulWidget {
  static const id = 'LoginPage';
  // static UserType loginTypeSelected = UserType.STUDENT;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // String idHint = string.student_id;
  UserType loginTypeSelected = UserType.TEACHER;
  bool isRegistered = false;
  String notYetRegisteringText = string.not_registered;
  ButtonType buttonType = ButtonType.LOGIN;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController schoolNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  // MainPageModel mainPageModel;

  loginRegisterBtnTap(LoginPageModel model, BuildContext context) async {
    if (emailController.text == null ||
        passwordController.text == null ||
        schoolNameController.text == null) {
      _scaffoldKey.currentState
          .showSnackBar(ksnackBar(context, 'Please enter details properly'));
    } else {
      if (emailController.text.trim().isEmpty ||
          passwordController.text.trim().isEmpty ||
          schoolNameController.text.trim().isEmpty) {
        _scaffoldKey.currentState
            .showSnackBar(ksnackBar(context, 'Please enter details properly'));
      } else {
        bool response = await model.checkUserDetails(
          email: emailController.text,
          password: passwordController.text,
          schoolCode: schoolNameController.text,
          userType: loginTypeSelected,
          buttonType: buttonType,
          confirmPassword: confirmPasswordController.text,
        );
        if (response) {
          if (locator<AuthenticationServices>().userType == UserType.PARENT) {
            Navigator.pushNamedAndRemoveUntil(
                context, GuardianProfilePage.id, (r) => false);
          } else {
            Navigator.pushNamedAndRemoveUntil(
                context, TeacherProfilePage.id, (r) => false);
          }
        } else {
          // _scaffoldKey.currentState
          //   .showSnackBar(ksnackBar(context, 'something went wrong...'));
        }
        _scaffoldKey.currentState
            .showSnackBar(ksnackBar(context, model.currentLoggingStatus));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginPageModel>(
      onModelReady: (model) => model,
      builder: (context, model, child) {
        return Scaffold(
          key: _scaffoldKey,
          resizeToAvoidBottomPadding: false,
          appBar: TopBar(
            title: string.login,
            child: kBackBtn,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          // floatingActionButton: LoginRoundedButton(
          //   label:
          //       buttonType == ButtonType.LOGIN ? string.login : string.register,
          //   onPressed: () async {
          //     if (model.state == ViewState.Idle)
          //       await loginRegisterBtnTap(model, context);
          //   },
          // ),
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              SafeArea(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          // padding: EdgeInsets.symmetric(horizontal: 24),
                          height: 60,
                          decoration: BoxDecoration(
                              color: MyColors.kinderMellow,
                              borderRadius: BorderRadius.circular(14)),
                          child: TextFormField(
                            onChanged: (id) {},
                            controller: schoolNameController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            onFieldSubmitted: (v) {
                              FocusScope.of(context).nextFocus();
                            },
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                            decoration: InputDecoration(
                              hintText: string.school_name_code_hint,
                              labelText: string.school_name_code,
                              prefixIcon: Icon(Icons.school),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          // padding: EdgeInsets.symmetric(horizontal: 24),
                          height: 60,
                          decoration: BoxDecoration(
                              color: MyColors.kinderMellow,
                              borderRadius: BorderRadius.circular(14)),
                          child: TextFormField(
                            onChanged: (email) {},
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                            decoration: InputDecoration(
                              hintText: string.email_hint,
                              labelText: string.email,
                              prefixIcon: Icon(Icons.email),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                            ),
                            controller: emailController,
                            onFieldSubmitted: (v) {
                              FocusScope.of(context).nextFocus();
                            },
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          // padding: EdgeInsets.symmetric(horizontal: 24),
                          height: 60,
                          decoration: BoxDecoration(
                              color: MyColors.kinderMellow,
                              borderRadius: BorderRadius.circular(14)),
                          child: TextFormField(
                            obscureText: true,
                            onChanged: (password) {},
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                            decoration: InputDecoration(
                              hintText: string.password_hint,
                              labelText: string.password,
                              prefixIcon: Icon(Icons.lock),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                            ),
                            controller: passwordController,
                            onFieldSubmitted: (v) {
                              FocusScope.of(context).nextFocus();
                            },
                          ),
                        ),
                        isRegistered
                            ? SizedBox(
                                height: 15,
                              )
                            : Container(),
                        isRegistered
                            ? Container(
                                height: 60,
                                decoration: BoxDecoration(
                                    color: MyColors.kinderMellow,
                                    borderRadius: BorderRadius.circular(14)),
                                child: TextFormField(
                                  obscureText: true,
                                  onChanged: (password) {},
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                  decoration: InputDecoration(
                                    hintText: string.password_hint,
                                    labelText: string.confirm_password,
                                    prefixIcon: Icon(Icons.lock),
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                  ),
                                  controller: confirmPasswordController,
                                  onFieldSubmitted: (v) {
                                    FocusScope.of(context).nextFocus();
                                  },
                                ),
                              )
                            : Container(),
                        SizedBox(
                          height: 5,
                        ),
                        Hero(
                          tag: 'otpForget',
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                ReusableRoundedButton(
                                  elevation: 1,
                                  child: Text(
                                    notYetRegisteringText,
                                    style: TextStyle(
                                      // color: kmainColorTeacher,
                                      fontSize: 15,
                                    ),
                                  ),
                                  onPressed: () {
                                    // _scaffoldKey.currentState.showSnackBar(
                                    //     ksnackBar(context, 'message'));
                                    setState(() {
                                      if (buttonType == ButtonType.LOGIN) {
                                        buttonType = ButtonType.REGISTER;
                                      } else {
                                        buttonType = ButtonType.LOGIN;
                                      }
                                      isRegistered = !isRegistered;
                                      notYetRegisteringText = isRegistered
                                          ? string.regidtered
                                          : string.not_registered;
                                    });
                                  },
                                  height: 40,
                                ),
                                ReusableRoundedButton(
                                  elevation: 1,
                                  child: Text(
                                    string.need_help,
                                    style: TextStyle(
                                      // color: kmainColorTeacher,
                                      fontSize: 15,
                                    ),
                                  ),
                                  onPressed: () {
                                    //Forget Password Logic
                                    kopenPage(
                                      context,
                                      ForgotPasswordPage(),
                                      'Forgot_Password_Page',
                                    );
                                  },
                                  height: 40,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        LoginRoundedButton(
                          label: buttonType == ButtonType.LOGIN
                              ? string.login
                              : string.register,
                          onPressed: () async {
                            if (model.state == ViewState.Idle)
                              await loginRegisterBtnTap(model, context);
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Image(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/welcome.png"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              model.state == ViewState.Busy
                  ? Container(
                      // color: Colors.red,
                      child: BackdropFilter(
                        filter: ui.ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: kBuzyPage(color: Theme.of(context).primaryColor),
                      ),
                    )
                  : Container(),
            ],
          ),
        );
      },
    );
  }
}
