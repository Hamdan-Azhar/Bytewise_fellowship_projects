import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/controllers/simple_hidden_drawer_controller.dart';
import '../../constants/constant_colors.dart';
import '../../animations/EmojiDecoratedBoxTransition.dart';
import '../../animations/EmojiScaleTransition.dart';
import '../../animations/EmojiSizeTransition.dart';
import '../../animations/EmojiFadeTransition.dart';
import 'home_page_bottom.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key,
    required this.animationController}) : super(key: key);

  final SimpleHiddenDrawerController animationController;
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = PageController();


  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  widget.animationController.toggle();
                }),
            title: const Text('Emoji App',
              style: TextStyle(
                  color: lighterColor
              ),
            ),
            backgroundColor: darkerColor,
          ),
          body: PageView(
              controller: _controller,                         //This controller will control the PageView
              physics: const NeverScrollableScrollPhysics(),
              children:const [
                EmojiDecoratedBoxTransition( title:'smile emoji', imagePath:'assets/smile.jpg',duration:Duration(seconds:3)),
                EmojiSizeTransition( title: 'sad emoji',  imagePath:'assets/sad.jpg',duration:Duration(seconds: 2)),
                EmojiFadeTransition( title:'angry emoji', imagePath:'assets/angry.jpg',duration:Duration(seconds: 1)),
                EmojiScaleTransition( title:'happy emoji', imagePath:'assets/happy.jpg',duration:Duration(seconds: 2))
              ]    //Here we call the objects of animations with arguments to create desired animations for our widgets
          ),
          bottomNavigationBar: HomePageBottom(
              controller:_controller),

        );
  }
}
