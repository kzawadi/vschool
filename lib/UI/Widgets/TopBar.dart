import 'package:ourESchool/UI/Utility/constants.dart';
import 'package:flutter/material.dart';

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
      this.buttonHeroTag = 'topBarBtn',
      this.onTitleTapped})
      : preferredSize = Size.fromHeight(48.0);

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // SizedBox(height: 30,),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Hero(
                transitionOnUserGestures: true,
                tag: widget.buttonHeroTag,
                child: Container(
                  // elevation: 10,
                  // shape: kBackButtonShape,
                  child: MaterialButton(
                    height: 40,
                    minWidth: 50,
                    elevation: 10,
                    shape: kBackButtonShape,
                    onPressed: widget.onPressed,
                    child: widget.child,
                  ),
                ),
              ),
              // SizedBox(
              //   width: 50,
              // ),
              Hero(
                tag: 'title',
                transitionOnUserGestures: true,
                child: Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: InkWell(
                    onTap: widget.onTitleTapped,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: 40,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              widget.title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                // color: Colors.black54,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

///this is created to eliminat the heri tag issue ''title
class TopBarAlternative extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final Widget child;
  final Function onPressed;
  final Function onTitleTapped;
  final String buttonHeroTag;

  @override
  final Size preferredSize;

  TopBarAlternative(
      {@required this.title,
      @required this.child,
      @required this.onPressed,
      this.buttonHeroTag = 'topBarBtn',
      this.onTitleTapped})
      : preferredSize = Size.fromHeight(48.0);

  @override
  _TopBarAlternativeState createState() => _TopBarAlternativeState();
}

class _TopBarAlternativeState extends State<TopBarAlternative> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // SizedBox(height: 30,),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Hero(
                transitionOnUserGestures: true,
                tag: widget.buttonHeroTag,
                child: Container(
                  // elevation: 10,
                  // shape: kBackButtonShape,
                  child: MaterialButton(
                    height: 40,
                    minWidth: 50,
                    elevation: 10,
                    shape: kBackButtonShape,
                    onPressed: widget.onPressed,
                    child: widget.child,
                  ),
                ),
              ),
              // SizedBox(
              //   width: 50,
              // ),
              Hero(
                tag: 'titleAlternative',
                transitionOnUserGestures: true,
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: InkWell(
                    onTap: widget.onTitleTapped,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: 40,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              widget.title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                // color: Colors.black54,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
