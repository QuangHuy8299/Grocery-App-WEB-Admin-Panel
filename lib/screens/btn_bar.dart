import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app_web_admin_panel/provider/dart_theme_provider.dart';
import 'package:grocery_app_web_admin_panel/screens/cart.dart';
import 'package:grocery_app_web_admin_panel/screens/categories.dart';
import 'package:grocery_app_web_admin_panel/screens/home_screen.dart';
import 'package:grocery_app_web_admin_panel/screens/user.dart';
import 'package:provider/provider.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 0;
  final List<Map<String, dynamic>> _page = [
    {"page": const HomeScreen(), "title": "Home Screen"},
    {"page": const CategoriesScreen(), "title": "Categories Screen"},
    {"page": const CartScreen(), "title": "Cart Screen"},
    {"page": const UserScreen(), "title": "User Screen"},
  ];

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool _isDark = themeState.getTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(_page[_selectedIndex]["title"]),
      ),
      body: _page[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: _isDark ? Theme.of(context).cardColor : Colors.white,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _selectedPage,
        currentIndex: _selectedIndex,
        unselectedItemColor: _isDark ? Colors.white10 : Colors.black12,
        selectedItemColor: _isDark ? Colors.lightBlue[200] : Colors.black87,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: _selectedIndex == 0
                  ? const Icon(IconlyBold.home)
                  : const Icon(IconlyLight.home),
              label: "Home"),
          BottomNavigationBarItem(
              icon: _selectedIndex == 1
                  ? const Icon(IconlyBold.category)
                  : const Icon(IconlyLight.category),
              label: "Categories"),
          BottomNavigationBarItem(
              icon: _selectedIndex == 2
                  ? const Icon(IconlyBold.buy)
                  : const Icon(IconlyLight.buy),
              label: "Cart"),
          BottomNavigationBarItem(
              icon: _selectedIndex == 3
                  ? const Icon(IconlyBold.user2)
                  : const Icon(IconlyLight.user2),
              label: "User"),
        ],
      ),
    );
  }
}
