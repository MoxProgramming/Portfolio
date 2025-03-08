import 'package:flutter/material.dart';
import 'package:portfolio/utils/screen_helper.dart';

final GlobalKey heroKey = GlobalKey();
final GlobalKey skillsKey = GlobalKey();
final GlobalKey workKey = GlobalKey();
final GlobalKey projectKey = GlobalKey();
final GlobalKey contactKey = GlobalKey();

const Color textColor = Colors.white;
const Color highlightColor = Colors.cyan;

const Color primaryBackgroundColor = Color.fromARGB(31, 53, 53, 53);

EdgeInsets contentPadding(BuildContext context) => EdgeInsets.symmetric(
  horizontal: ScreenHelper.isMobile(context) ? 20 : 100,
  vertical: 60
);