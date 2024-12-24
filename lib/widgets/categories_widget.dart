import 'package:flutter/material.dart';
import 'package:grocery_app_web_admin_panel/provider/dart_theme_provider.dart';
import 'package:grocery_app_web_admin_panel/widgets/text_widgets.dart';
import 'package:provider/provider.dart';

class CategoriesWidget extends StatelessWidget {
  final String catName, imgPath;
  final Color passedColor;
  CategoriesWidget({
    Key? key,
    required this.catName,
    required this.imgPath,
    required this.passedColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getTheme ? Colors.white : Colors.black;

    double _sceenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            color: passedColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: passedColor.withOpacity(0.7), width: 2)),
        child: Column(
          children: [
            Container(
              height: 0.3 * _sceenWidth,
              width: 0.3 * _sceenWidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imgPath), fit: BoxFit.fill),
              ),
            ),
            TextWidget(
              title: catName,
              color: color,
              textSize: 20,
              isTitle: true,
            ),
          ],
        ),
      ),
    );
  }
}
