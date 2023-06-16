import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:emoji_app/constants/constant_colors.dart';
import 'package:emoji_app/components/side_menu/side_menu_tile.dart';
import 'package:emoji_app/components/side_menu/side_menu_tiles_list.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

//This file contains the sideMenu that will show when the user
//clicks the menu icon on Home, Settings or favourites page

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  SideMenuTiles selectedMenu = sideMenuList.first;
  late SimpleHiddenDrawerController controller;

  @override
  void didChangeDependencies() {
    controller = SimpleHiddenDrawerController.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: darkestColor,
        body: Container(
          width: 288,
          height: double.infinity,
          color: darkestColor,
          child: SafeArea(
            child: Column(
              children: [
                 const ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      CupertinoIcons.person,
                      color: darkestColor,
                    ),
                  ),
                 ),
                 ListTile(
                   title: const Text(
                    "Username",
                     style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                     ),
                   ),
                   subtitle: Text(
                    '@useraccount'.toUpperCase(),
                     style: const TextStyle(
                       color: Colors.grey,
                     ),
                   ),
                 ),
                 ...sideMenuList.map(
                    (value) => SideMenuTile(
                    sideMenuTile: value,
                    press: () {
                      controller.setSelectedMenuPosition(
                          value.no);
                      setState(() {
                        selectedMenu = value;
                      });
                    },
                    isActive: selectedMenu == value
                 )),
             ],
           ),
          ),
        ),
    );
  }
}
