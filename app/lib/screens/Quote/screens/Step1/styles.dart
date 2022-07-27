import 'package:flutter/material.dart';
import 'package:app/theme/theme.dart' as theme;

class Styles {
  static const TextStyle titleStyle = TextStyle(
      fontSize: 28,
      color: theme.Colors.primaryColor,
      fontWeight: FontWeight.w600);

  static const TextStyle fontStyle = TextStyle(
      fontSize: 25,
      color: theme.Colors.whiteColor,
      fontWeight: FontWeight.w600);

  static const TextStyle fontCircleStyle = TextStyle(
      fontSize: 20,
      color: theme.Colors.whiteColor,
      fontWeight: FontWeight.w600);

  static const TextStyle fontRangeStyle = TextStyle(
      fontSize: 20,
      color: theme.Colors.primaryColor,
      fontWeight: FontWeight.w400);

  static const TextStyle fontCircleTextStyle = TextStyle(
      fontSize: 18,
      color: theme.Colors.primaryColor,
      fontWeight: FontWeight.w600);

  static const BoxDecoration boxDecorationStyle = BoxDecoration(
      color: theme.Colors.primaryColor,
      borderRadius: BorderRadius.all(Radius.circular(15.0)));

  static const BoxDecoration boxDecorationCircleStyle = BoxDecoration(
    shape: BoxShape.circle,
    color: theme.Colors.primaryColor,
  );

  static BoxDecoration boxDecorationYellowStyle(active) => BoxDecoration(
      color: active ? theme.Colors.yellowColor : theme.Colors.grayColor,
      borderRadius: BorderRadius.all(Radius.circular(15.0)));
}
