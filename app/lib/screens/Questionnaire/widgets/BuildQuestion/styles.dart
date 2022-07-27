import 'package:flutter/material.dart';
import 'package:app/theme/theme.dart' as theme;

class Styles {
  static const BoxDecoration boxDecorationStyle = BoxDecoration(
      color: theme.Colors.primaryColor,
      borderRadius: BorderRadius.all(Radius.circular(10.0)));

  // header style
  static TextStyle fontStyle(type, color) => TextStyle(
      fontSize: 16, color: Color(int.parse(color.replaceAll('#', '0xff'))));

  static BoxDecoration boxDecorationCustomStyle(active, color, type) =>
      BoxDecoration(
          color: color != null
              ? type == 'H'
                  ? Color(int.parse(color.replaceAll('#', '0xff')))
                  : active == null
                      ? Color(int.parse(color.replaceAll('#', '0xff')))
                      : active
                          ? Color(int.parse(color.replaceAll('#', '0xff')))
                          : theme.Colors.grayColor
              : theme.Colors.grayColor,
          border: type == 'H'
              ? Border.all(color: theme.Colors.yellowColor)
              : Border.all(color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(15.0)));
}
