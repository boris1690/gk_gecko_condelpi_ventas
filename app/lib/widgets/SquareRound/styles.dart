import 'package:flutter/material.dart';
import 'package:app/theme/theme.dart' as theme;

class Styles {
  static const BoxDecoration boxDecorationStyle = BoxDecoration(
      color: theme.Colors.primaryColor,
      borderRadius: BorderRadius.all(Radius.circular(10.0)));

  static const BoxDecoration cornerDecorationStyle = BoxDecoration(
      color: theme.Colors.whiteColor,
      borderRadius: BorderRadius.all(Radius.circular(50.0)));

  // header style
  static const TextStyle fontStyle =
      TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.w600);
}
