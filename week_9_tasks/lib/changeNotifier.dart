
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsState extends ChangeNotifier {
  String password = '';
  String language = 'English';
  String location = 'none';


  Future<void> updatePassword(String newPassword) async {
    password = newPassword;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('password', password);
    notifyListeners();
  }

  Future<String> retrievePassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    password = prefs.getString('password') ?? '';
    notifyListeners();
    return password;
  }

  Future<void> updateLanguage(String newLanguage) async {
    language = newLanguage;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', language);
    notifyListeners();
  }

  Future<String> retrieveLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    language = prefs.getString('language') ?? 'English';
    notifyListeners();
    return language;
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
}
