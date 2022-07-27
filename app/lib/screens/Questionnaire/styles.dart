import 'package:flutter/material.dart';
import 'package:app/theme/theme.dart' as theme;

class Styles {
  static const TextStyle titleStyle = TextStyle(
      fontSize: 28,
      color: theme.Colors.primaryColor,
      fontWeight: FontWeight.w600);

  static const TextStyle fontStyle = TextStyle(
      fontSize: 15,
      color: theme.Colors.whiteColor,
      fontWeight: FontWeight.w600);

  static const BoxDecoration boxDecorationStyle = BoxDecoration(
      color: theme.Colors.primaryColor,
      borderRadius: BorderRadius.all(Radius.circular(15.0)));
}
