import 'package:flutter/material.dart';
import 'package:app/theme/theme.dart' as theme;

class Styles {
  static const BoxDecoration boxDecorationStyle = BoxDecoration(
      color: theme.Colors.primaryColor,
      borderRadius: BorderRadius.all(Radius.circular(10.0)));

  // header style
  static const TextStyle fontStyle =
      TextStyle(fontSize: 12, color: Colors.white);
}
