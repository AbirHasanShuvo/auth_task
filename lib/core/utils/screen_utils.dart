import 'package:flutter/material.dart';

class ScreenUtils {
  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double hp(BuildContext context, double percent) =>
      height(context) * percent / 100;

  static double wp(BuildContext context, double percent) =>
      width(context) * percent / 100;
}