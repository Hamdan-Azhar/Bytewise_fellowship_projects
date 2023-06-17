import 'package:emoji_app/constants/constant_colors.dart';
import 'package:flutter/material.dart';

import 'side_menu_tiles_list.dart';

//This files contains the structure for the widgets in
//the sideMenu. These tiles will change color when they are
//clicked by the user

class SideMenuTile extends StatelessWidget {
  const SideMenuTile({
    Key? key,
    required this.isActive,
    required this.press,
    required this.sideMenuTile,
  }) : super(key: key);

  final bool isActive;
  final VoidCallback press;
  final SideMenuTiles sideMenuTile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24),
          child: Divider(
              color: Colors.white24,
              height: 1,
          ),
        ),
        Stack(
          children: [
            AnimatedPositioned(
                    duration: const Duration(milliseconds: 200),
                    height: 56,
                    width: isActive ? 288 : 0,
                    left: 0,
                    curve: Curves.fastOutSlowIn,
                    child:Container(
                      decoration: const BoxDecoration(
                      color: darkerColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                    ),
                 ),
            ListTile(
              onTap: press,
              leading: Icon(
                sideMenuTile.icon,
                color: Colors.white,
              ),
              title: Text(
                sideMenuTile.text,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        )
      ],
    );
  }
}
