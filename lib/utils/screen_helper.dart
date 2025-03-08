import 'package:flutter/material.dart';

class ScreenHelper {
  static const double mobile = 600;
  static const double tablet = 900;
  static const double desktop = 1200;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.shortestSide < mobile;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.shortestSide >= mobile &&
      MediaQuery.of(context).size.shortestSide < desktop;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.shortestSide >= desktop;
}