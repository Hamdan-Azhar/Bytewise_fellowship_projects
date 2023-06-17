import 'dart:io';

import 'package:emoji_app/constants/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/controllers/simple_hidden_drawer_controller.dart';
import 'package:provider/provider.dart';
import '../../changeNotifier.dart';

//This favourites page currently displays images in our assets only
//but I will add some new features in the future.
class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key, required this.animationController})
      : super(key: key);

  final SimpleHiddenDrawerController animationController;
  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  void initState() {
    //when the app is started, this function runs and retrieves the value of password from instance of
    super.initState(); // SharedPreferences
    Provider.of<PageState>(context, listen: false).retrieveFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PageState>(builder: (context, favouritesState, _) {
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
        body: favouritesState.favorites.isEmpty
            ? Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.photo_library,
                    color: Colors.white,
                    size: 64.0,
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'No images in favorites',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 16.0),
                  Container(
                    width: 120.0,
                    height: 40.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: lighterColor,
                    ),
                    child: TextButton(
                      onPressed: () {
                        favouritesState.getFromGallery();
                      },
                      child: const Text(
                        'Add images',
                        style: TextStyle(
                          color: darkerColor,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  )
                ],
              ))
            : GridView.builder(
                itemCount: favouritesState.favorites.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemBuilder: (context, index) {
                  return Image.file(
                    File(favouritesState.favorites[index]),
                    fit: BoxFit.cover,
                  );
                },
              ),

        floatingActionButton: favouritesState.favorites.isNotEmpty
            ? Row(
               mainAxisAlignment: MainAxisAlignment.end,
               crossAxisAlignment: CrossAxisAlignment.end,
               children: [
                 TextButton(
                   onPressed: () {
                     favouritesState.getFromGallery();
                   },
                   style: TextButton.styleFrom(
                     backgroundColor: lighterColor,
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(30.0),
                     ),
                   ),
                   child: const Padding(
                     padding: EdgeInsets.all(10.0),
                     child: Icon(Icons.image, color: darkerColor),
                   ),
                 ),

                 const SizedBox(width: 16.0),
                 TextButton(
                   onPressed: () {
                     favouritesState.clearFavorites();
                   },
                   style: TextButton.styleFrom(
                     backgroundColor: lighterColor,
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(30.0),
                     ),
                   ),
                   child: const Padding(
                     padding: EdgeInsets.all(10.0),
                     child: Icon(Icons.delete, color: darkerColor),
                   ),
                 ),
          ],
        ):null,
      );
    });
  }
}
