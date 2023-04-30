import 'package:flutter/material.dart';
import 'package:emoji_app/constants/constant_colors.dart';
import 'package:emoji_app/models/models.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(              // A DefaultTabController to create tabs.
          length: 4,                           //This DefaultTabController has 4 tabs and each
          child: Scaffold(                     //tab will have an emoji and its title with it.
              appBar: AppBar(
                backgroundColor: darkerColor,
                leading: const BackButton(
                  color: Colors.white,
                ),
                title: const Text('Emojis app'),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                  ),
                  const SizedBox(width: 15),
                ],
                bottom: const TabBar(
                  unselectedLabelColor: lighterColor,
                  tabs: [
                    Tab(text: 'Emoji 1'),
                    Tab(text: 'Emoji 2'),
                    Tab(text: 'Emoji 3'),
                    Tab(text: 'Emoji 4'),
                  ],
                ),
              ),
              body: Container(
                color: lighterColor,
                child: TabBarView(
                  children: [
                    for (var obj
                        in Emojis)                //A for loop is used to display all the
                      Center(                    // objects of the list Emojis of type Emoji
                        child: Column(          //in the 4 tabs of DefaultTabController
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              obj.image,
                              width: 100,
                              height: 100,
                            ),
                            Text(obj.title,
                                style: const TextStyle(color: darkerColor)),
                          ],
                        ),
                      ),
                  ],
                ),
              ))),
    );
  }
}
