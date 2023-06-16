import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../changeNotifier.dart';
import '../../../constants/constant_colors.dart';

//A separate class for location button

class LocationChangeButton extends StatefulWidget {
  const LocationChangeButton({super.key});

  @override
  LocationChangeButtonState createState() => LocationChangeButtonState();
}

class LocationChangeButtonState extends State<LocationChangeButton> {
  final _locationController = TextEditingController();

  @override
  void initState() {             //When the app is started, this function is called which retrieves
    super.initState();           //value of location from instance of SharedPreferences
      Provider.of<SettingsState>(context, listen: false).retrieveLocation();
  }

  @override
  void dispose() {
    _locationController.dispose();
    super.dispose();
  }

  void _showLocationChangeDialog(BuildContext context,SettingsState settingsState) {
    _locationController.text = "";
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: lighterColor,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              TextField(
                controller: _locationController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Enter New Location",
                  labelStyle: TextStyle(color: darkerColor),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                settingsState.updateLocation(_locationController.text);  //When the user enters
                Navigator.of(context).pop();                            // a new location, it will be stored in SharedPreferences using
              },                                                        //updateLocation function
              child: const Text(
                "Save",
                style: TextStyle(color: darkerColor),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "Cancel",
                style: TextStyle(color: darkerColor),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsState>(
      builder: (context, settingsState, _) {
        return IconButton(
          onPressed: () => _showLocationChangeDialog(context,settingsState),
          icon: Row(
            children: [
              const Icon(Icons.location_on),
              const SizedBox(width: 8.0),
              Text(
                settingsState.location,      //The location currently selected by the user
                style: const TextStyle(      // will appear on the icon.
                  color: darkerColor,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
