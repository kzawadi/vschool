import 'package:framy_annotation/framy_annotation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ourESchool/UI/Utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:ourESchool/UI/resources/customWidgets.dart';
import 'package:ourESchool/UI/resources/utility.dart';

@FramyWidget()
class TopBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final Widget child;
  final Function onPressed;
  final Function onTitleTapped;
  final String buttonHeroTag;

  @override
  final Size preferredSize;

  TopBar(
      {@required this.title,
      @required this.child,
      @required this.onPressed,
      this.buttonHeroTag,
      this.onTitleTapped})
      : preferredSize = Size.fromHeight(40.0);

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: kAppBarShape,
      primary: true,
      // textTheme: Theme.of(context).primaryTextTheme,
      actions: [
        Card(
          color: Theme.of(context).primaryColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(26),
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(26),
              topLeft: Radius.circular(5),
            ),
          ),
          child: Container(
            // height: 40,
            width: fullWidth(context) / 2.5,
            child: InkWell(
              onTap: widget.onTitleTapped,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: Text(
                    widget.title,
                    style: GoogleFonts.quicksand(
                      color: Theme.of(context).accentColor,
                      textStyle: Theme.of(context).textTheme.headline4,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  // ),
                ),
              ),
            ),
          ),
        ),
      ],
      leading: Hero(
        transitionOnUserGestures: true,
        tag: widget.buttonHeroTag,
        child: MaterialButton(
          height: 40,
          minWidth: 50,
          elevation: 10,
          shape: kBackButtonShape,
          onPressed: widget.onPressed,
          child: widget.child,
        ),
      ),
    );
  }
}

///this is created to eliminat the heri tag issue ''title
@FramyWidget()
class TopBarAlternative extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  // final Widget child;
  final Function onPressed;
  final Function onTitleTapped;
  final String buttonHeroTag;

  @override
  final Size preferredSize;

  TopBarAlternative(
      {@required this.title,
      // @required this.child,
      @required this.onPressed,
      this.buttonHeroTag,
      this.onTitleTapped})
      : preferredSize = Size.fromHeight(40.0);

  @override
  _TopBarAlternativeState createState() => _TopBarAlternativeState();
}

class _TopBarAlternativeState extends State<TopBarAlternative> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: kAppBarShape,
      centerTitle: true,
      title: Hero(
        tag: widget.buttonHeroTag,
        transitionOnUserGestures: true,
        child: Card(
          color: Theme.of(context).primaryColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(5),
              topLeft: Radius.circular(5),
            ),
          ),
          child: Container(
            // height: 40,
            width: fullWidth(context) / 2.5,
            child: InkWell(
              onTap: widget.onTitleTapped,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: Text(
                    widget.title,
                    style: GoogleFonts.quicksand(
                      color: Theme.of(context).accentColor,
                      textStyle: Theme.of(context).textTheme.headline4,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  // ),
                ),
              ),
            ),
          ),
        ),
      ),
      primary: true,
      // textTheme: Theme.of(context).primaryTextTheme,
      actions: [],
      // leading: Hero(
      //   transitionOnUserGestures: true,
      //   tag: widget.buttonHeroTag,
      //   child: MaterialButton(
      //     color: Colors.transparent,
      //     height: 40,
      //     minWidth: 50,
      //     elevation: 10,
      //     shape: kBackButtonShape,
      //     onPressed: widget.onPressed,
      //     child: widget.child,
      //   ),
      // ),
    );
  }
}
