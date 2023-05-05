import 'package:flutter/material.dart';
import '../../constants/constant_colors.dart';

//This function returns a rounded edge container that consists of text
// and an iconButton widget

Widget settingPageTilesBuilder(String text, Widget iconButton) {
  return Container(
    padding: const EdgeInsets.only(top: 15,bottom: 15),
    decoration: BoxDecoration(
      color: lighterColor,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.grey),
    ),
    child: Row(
      children: [
        const Expanded(
          flex: 1,
          child: SizedBox(),
        ),
        Expanded(
          flex: 4,
          child: Text(
            text,
            style: const TextStyle(fontSize: 20), // increase font size by 2x
          ),
        ),
        Expanded(
          flex: 2,
          child: iconButton,
        ),
      ],
    ),
  );
}
