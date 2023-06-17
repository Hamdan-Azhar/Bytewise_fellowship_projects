import 'package:emoji_app/components/favourites_page/favourites_page.dart';
import 'package:emoji_app/components/home_page/home_page.dart';
import 'package:emoji_app/components/settings_page/settings_page.dart';
import 'package:emoji_app/components/side_menu/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:provider/provider.dart';
import 'changeNotifier.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => PageState(),
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
              screenCurrent = HomePage(animationController: controller);
              break;
            case 1:
              screenCurrent = SettingsPage(animationController: controller);
              break;
            case 2:
              screenCurrent = FavouritePage(animationController: controller);
              break;
            default:
              screenCurrent = HomePage(animationController: controller);
          }
          return screenCurrent;
        },
      ),
    );
  }
}
