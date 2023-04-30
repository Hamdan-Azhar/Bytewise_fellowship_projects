import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SideMenuTiles {
  IconData icon;
  String text;
  int no;

  SideMenuTiles({required this.icon, required this.text, required this.no});
}

List<SideMenuTiles> sideMenuList = [
  SideMenuTiles(icon: CupertinoIcons.home, text: 'Home', no: 0),
  SideMenuTiles(icon: Icons.settings, text: 'Settings', no: 1),
  SideMenuTiles(icon: CupertinoIcons.star, text: 'Favourites', no: 2),
];


