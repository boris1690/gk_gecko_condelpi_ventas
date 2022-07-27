import 'package:flutter/material.dart';
import 'package:app/theme/theme.dart' as theme;

class Styles {
  static BoxDecoration boxDecorationStyle(active) {
    return BoxDecoration(
      color: active ? theme.Colors.primaryColor : theme.Colors.grayColor,
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    );
  }

  static const BoxDecoration cornerDecorationStyle = BoxDecoration(
      color: theme.Colors.whiteColor,
      borderRadius: BorderRadius.all(Radius.circular(50.0)));

  static const BoxDecoration cornerGrayDecorationStyle = BoxDecoration(
      color: theme.Colors.grayColor,
      borderRadius: BorderRadius.all(Radius.circular(50.0)));

  // header style
  static const TextStyle fontStyle =
      TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.w600);
}
