import 'package:untitled1/screens/Page_Main.dart';
import 'package:untitled1/screens/conatct_page.dart';
import 'package:untitled1/screens/details_page.dart';
import 'package:untitled1/screens/update_page.dart';
import 'package:flutter/material.dart';

import 'app_theme_page.dart';

void main() {
  runApp(
    const Homepage(),
  );
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool iconBool = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // darkTheme: AppTheme.Darktheme,
      // themeMode: (AppTheme.isDark == false) ? ThemeMode.light : ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage2(),
        'add_contact_page': (context) => const Contact_Page(),
        'details_page_info': (context) => const Details_page(),
        'update_page': (context) => const Update_Page(),
      },
    );
  }
}
