import 'package:flutter/material.dart';
import 'package:app/theme/theme.dart' as theme;

class Styles {
  static const BoxDecoration boxDecorationStyle = BoxDecoration(
      color: theme.Colors.primaryColor,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ));

  // header style
  static const TextStyle fontStyle =
      TextStyle(fontSize: 22, color: Colors.white);
}
