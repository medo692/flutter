import 'package:flutter/material.dart';
import 'package:projet32/conmmon_wedjet/custom_raised_botton.dart';

class SignInButton extends CustomRaisedButton{
  SignInButton({
    @required String text,
    Color color,
    Color textColor,
    VoidCallback onPressed,
}) : assert(text != null),
        super(
    child: Text(
        text,
        style: TextStyle(color:textColor, fontSize:15.0)),
        color: color,
        onPressed: onPressed,
  );
}