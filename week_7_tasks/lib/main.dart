import 'package:emoji_app/components/home_page/home_page.dart';
import 'package:emoji_app/components/settings_page/settings_page.dart';
import 'package:emoji_app/components/side_menu/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // We use a simple hidden drawer to make a beautiful drawer for our application

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SimpleHiddenDrawer(
        menu: const SideMenu(),

        screenSelectedBuilder: (position, controller) {
          Widget screenCurrent;

          switch (position) {
            case 0:
              screenCurrent = HomePage(
                  animationController: controller);
              break;
            case 1:
              screenCurrent = SettingsPage(
                  animationController: controller);
              break;
            default:
              screenCurrent = HomePage(
                  animationController: controller);
          }
          return screenCurrent;
        },
      ),
    );
  }
}

