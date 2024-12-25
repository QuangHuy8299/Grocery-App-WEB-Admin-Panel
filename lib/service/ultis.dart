import 'package:flutter/material.dart';
import 'package:grocery_app_web_admin_panel/provider/dart_theme_provider.dart';
import 'package:provider/provider.dart';

class Ultis {
  BuildContext context;
  Ultis(this.context);

  bool get getTheme => Provider.of<DarkThemeProvider>(context).getTheme;
  Color get color => getTheme ? Colors.white : Colors.black;
  Size get getScreenSize => MediaQuery.of(context).size;
}
