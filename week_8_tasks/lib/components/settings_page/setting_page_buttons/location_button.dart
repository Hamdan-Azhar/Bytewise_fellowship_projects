import 'package:flutter/material.dart';
import '../../../constants/constant_colors.dart';

//A separate class for location button

class LocationChangeButton extends StatefulWidget {
  const LocationChangeButton({super.key});

  @override
  LocationChangeButtonState createState() => LocationChangeButtonState();
}

class LocationChangeButtonState extends State<LocationChangeButton> {
  final _locationController = TextEditingController();
  String _newlocation = "none";

  @override
  void dispose() {
    _locationController.dispose();

    super.dispose();
  }

  Future<void> _showPasswordChangeDialog(BuildContext context) async {
    _locationController.text = "";

    await showDialog(
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
                    labelStyle: TextStyle(
                        color: darkerColor
                    )
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _newlocation = _locationController.text;
                });
                Navigator.of(context).pop();
              },
              child: const Text(
                "Save",
                style: TextStyle(
                    color: darkerColor
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "Cancel",
                style: TextStyle(
                    color: darkerColor
                ),
              ),
            ),
          ],
        );
      },
    );

  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _showPasswordChangeDialog(context),
      icon: Row(
        children: [
          const Icon(Icons.location_on),
          const SizedBox(width: 8.0),
          Text(
            _newlocation,
            style: const TextStyle(
              color: darkerColor,
              fontSize: 18
            ),
          ),
        ],
      ),
    );
  }
}

