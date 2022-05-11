import 'package:flutter/material.dart';
import 'package:app/theme/theme.dart' as theme;

class Styles {
  // header style
  static const TextStyle fontStyle = TextStyle(
      fontSize: 22,
      color: theme.Colors.whiteColor,
      fontWeight: FontWeight.w600);

  static ButtonStyle buttonStyle = ButtonStyle(
    fixedSize: MaterialStateProperty.all(const Size(100, 50)),
    backgroundColor: MaterialStateProperty.all(theme.Colors.yellowColor),
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(13), // <-- Radius
    )),
  );
}
