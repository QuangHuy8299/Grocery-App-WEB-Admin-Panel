import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app_web_admin_panel/provider/dart_theme_provider.dart';
import 'package:grocery_app_web_admin_panel/widgets/text_widgets.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getTheme ? Colors.white : Colors.black;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: RichText(
                text: TextSpan(
                  text: "Hi",
                  style: const TextStyle(
                    color: Colors.cyan,
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: "My Name",
                        style: TextStyle(
                          color: color,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {}),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child:
                  TextWidget(title: "test@email", color: color, textSize: 18),
            ),
            _listTile(
              title: "Address",
              subTilte: "My Subtitle",
              icon: IconlyLight.profile,
              onPressed: () {},
              color: color,
            ),
            _listTile(
              title: "Orders",
              icon: IconlyLight.bag,
              onPressed: () {},
              color: color,
            ),
            _listTile(
              title: "WishList",
              icon: IconlyLight.heart,
              onPressed: () {},
              color: color,
            ),
            _listTile(
              title: "Viewed",
              icon: IconlyLight.show,
              onPressed: () {},
              color: color,
            ),
            _listTile(
              title: "Froget Password",
              icon: IconlyLight.unlock,
              onPressed: () {},
              color: color,
            ),
            SwitchListTile(
              title: TextWidget(
                title: themeState.getTheme ? "Dark Mode" : "Light Mode",
                color: color,
                textSize: 24,
                isTitle: true,
              ),
              secondary: Icon(themeState.getTheme
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined),
              value: themeState.getTheme,
              onChanged: (bool value) {
                setState(() {
                  themeState.setDarkTheme = value;
                });
              },
            ),
            _listTile(
              title: "Logout",
              icon: IconlyLight.logout,
              onPressed: () {},
              color: color,
            ),
          ],
        ),
      ),
    );
  }

  Widget _listTile({
    required String title,
    String? subTilte,
    required IconData icon,
    required Function onPressed,
    required Color color,
  }) {
    return ListTile(
      title: TextWidget(
        title: title,
        color: color,
        textSize: 24,
        isTitle: true,
      ),
      subtitle: TextWidget(title: subTilte ?? "", color: color, textSize: 18),
      leading: Icon(icon),
      trailing: const Icon(IconlyLight.arrowRight2),
      onTap: () {
        onPressed();
      },
    );
  }
}
