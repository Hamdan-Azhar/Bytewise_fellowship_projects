import 'package:emoji_app/components/settings_page/setting_page_buttons/change_password.dart';
import 'package:emoji_app/components/settings_page/setting_page_buttons/language_button.dart';
import 'package:emoji_app/components/settings_page/setting_page_buttons/location_button.dart';
import 'package:emoji_app/components/settings_page/settings_page_tile.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/controllers/simple_hidden_drawer_controller.dart';
import '../../constants/constant_colors.dart';

//This class implements the settings Page. Settings page consists of
//an app bar and different buttons. Each button has its own functionality.

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key, required this.animationController})
      : super(key: key);

  final SimpleHiddenDrawerController animationController;
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: darkerColor,
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                widget.animationController.toggle();
              }),
          title: const Text(
            'Settings',
            style: TextStyle(color: lighterColor),
          ),
          backgroundColor: darkerColor,
        ),
      body: Column(
        children: [
          const SizedBox(height: 40),
          settingPageTilesBuilder('Change Password', const PasswordChangeButton()),
          const SizedBox(height: 40),
          settingPageTilesBuilder('Change Language', const LanguageButton()),
          const SizedBox(height: 40),
          settingPageTilesBuilder('Change Location', const LocationChangeButton()),
        ],
      ),
    );
  }
}
