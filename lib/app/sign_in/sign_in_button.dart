import 'package:flutter/material.dart';
import 'package:time_tracker/widgets/custom_raised_button.dart';

class SignInButton extends CustomRaisedButton {
  SignInButton({
    String text,
    Color color,
    Color textColor,
    VoidCallback onPressed,
  })  : assert(text != null),
        super(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 15,
            ),
          ),
          color: color,
          onPressed: onPressed,
          // borderRadius: 8.0
        );
}
