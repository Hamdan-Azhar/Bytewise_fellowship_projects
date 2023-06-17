import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class PageState extends ChangeNotifier {
  String password = '';
  String language = 'English';
  String location = 'none';
  final List<String> _favorites = [];

  List<String> get favorites => List.from(_favorites);

  Future<void> updatePassword(String newPassword) async {
    password = newPassword;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('password', password);
    notifyListeners();
  }

  Future<void> retrievePassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    password = prefs.getString('password') ?? '';
    notifyListeners();
  }

  Future<void> updateLanguage(String newLanguage) async {
    language = newLanguage;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', language);
    notifyListeners();
  }

  Future<void> retrieveLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    language = prefs.getString('language') ?? 'English';
    notifyListeners();
  }

  Future<void> updateLocation(String newLocation) async {
    location = newLocation;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('location', location);
    notifyListeners();
  }

  Future<void> retrieveLocation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    location = prefs.getString('location') ?? 'none';
    notifyListeners();
  }

  Future<void> addToFavorites(String imagePath) async {
    _favorites.add(imagePath);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('favorites', _favorites);
  }

  Future<void> retrieveFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedFavorites = prefs.getStringList('favorites');
    if (savedFavorites != null) {
      _favorites.clear();
      _favorites.addAll(savedFavorites);
    }
    notifyListeners();
  }

  Future<void> clearFavorites() async {
    _favorites.clear();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('favorites');
    notifyListeners();
  }

  Future<void> getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      addToFavorites(pickedFile.path);
    }
    notifyListeners();
  }
}
