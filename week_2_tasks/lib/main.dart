import 'package:flutter/material.dart';

//Code that will display a simple page with an appbar that has a pop menu button and text in it. The color of the appbar is red.

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: const PopupMenuButtonWidget(),
          title: const Text("HAMDAN"),
          backgroundColor: Colors.red,
        ),
      ),
    );
  }
}

class PopupMenuButtonWidget extends StatelessWidget {                                    //Here, we make a separate class to implement the pop menu button
  const PopupMenuButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<TodoMenuItem>(
      icon: const Icon(Icons.view_list),
      itemBuilder: (BuildContext context) {
        return foodMenuList.map((TodoMenuItem todoMenuItem) {
          return PopupMenuItem<TodoMenuItem>(
            child: Row(
              children: <Widget>[
                Icon(
                todoMenuItem.icon?.icon,
                color:Colors.black
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                ),
                Text(todoMenuItem.title.toString()),
              ],
            ),
          );
        }).toList();
      },
    );
  }
}

class TodoMenuItem {                                                         //This is the class for items that we will display when the pop menu button is pressed
  final String? title;
  final Icon? icon;
  TodoMenuItem({this.title, this.icon});
}

List<TodoMenuItem> foodMenuList = [                                         //This is the list of items each having its own text and icon that will appear when
  TodoMenuItem(title: 'Fast Food', icon: const Icon(Icons.fastfood)),       // the pop menu button is pressed.
  TodoMenuItem(title: 'Remind Me', icon: const Icon(Icons.add_alarm)),
  TodoMenuItem(title: 'Flight', icon: const Icon(Icons.flight)),
  TodoMenuItem(title: 'Music', icon: const Icon(Icons.audiotrack)),
];
