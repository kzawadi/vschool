import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ReusableRoundedButton.dart';

class LoginRoundedButton extends StatelessWidget {
  final Function onPressed;
  final String label;
  final String heroTag;
  const LoginRoundedButton({this.onPressed, this.label, this.heroTag});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Hero(
        tag: heroTag ?? 'login',
        transitionOnUserGestures: true,
        child: ReusableRoundedButton(
          elevation: 1,
          child: Text(
            label ?? 'Login',
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).accentColor,
              fontSize: 15,
            ),
          ),
          // text: 'Login',
          onPressed: onPressed,
          height: 25,
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
