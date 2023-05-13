import 'package:emoji_app/constants/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/controllers/simple_hidden_drawer_controller.dart';

//This favourites page currently displays images in our assets only
//but I will add some new features in the future.
class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key,
    required this.animationController}) : super(key: key);

  final SimpleHiddenDrawerController animationController;
  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {

  final List<String> _favorites = [
    'assets/angry.jpg',
    'assets/happy.jpg',
    'assets/sad.jpg',
    'assets/smile.jpg',
  ];

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
          'Favourites',
          style: TextStyle(color: lighterColor),
        ),
        backgroundColor: darkerColor,
      ),
      body: GridView.builder(
        itemCount: _favorites.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemBuilder: (context, index) {
          return Image.asset(
            _favorites[index],
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
