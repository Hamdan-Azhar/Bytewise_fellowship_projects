
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../changeNotifier.dart';
import '../../../constants/constant_colors.dart';

//A separate class for password button

class PasswordChangeButton extends StatefulWidget {
  const PasswordChangeButton({super.key});

  @override
  PasswordChangeButtonState createState() => PasswordChangeButtonState();
}

class PasswordChangeButtonState extends State<PasswordChangeButton> {
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();

  @override
  void initState() {  //when the app is started, this function runs and retrieves the value of password from instance of
    super.initState(); // SharedPreferences
    Provider.of<SettingsState>(context, listen: false).retrievePassword();
  }

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    super.dispose();
  }

  void _showPasswordChangeDialog(BuildContext context) {
    final settingsState =  Provider.of<SettingsState>(context, listen: false);
    _oldPasswordController.text = "";                                           //we use two controllers to store the old password
    _newPasswordController.text = "";                                           //and new password entered by user.

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: lighterColor,
          title: const Text(
            "Change Password",
            style: TextStyle(
                color: darkerColor
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _oldPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Old Password",
                  labelStyle: TextStyle(
                      color: darkerColor
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _newPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                    labelText: "New Password",
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
                if (_oldPasswordController.text == settingsState.password) {   //if the old password entered by the user is
                  settingsState.updatePassword(_newPasswordController.text);   //equal to the current password, it means that password
                  Navigator.of(context).pop();                                 //can be changed and the new password entered by the user will be
                                                                               //the new password
                  if (settingsState.password.isNotEmpty) {
                    // Save the new password
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: lighterColor,
                          content: Text(
                            "The new password entered is ${settingsState.password}",
                            style: const TextStyle(
                                color: darkerColor
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                "OK",
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
                } else {
                  Navigator.of(context).pop();
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: lighterColor,
                        title: const Text("Incorrect Password"),                     //if the old password != current password. It means that
                        content:  const Text("The old password entered is incorrect"), // password can be changed because of incorrect verification.
                        actions: [                                                     //so this message will be displayed.
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              "OK",
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
      icon: const Icon(
          Icons.arrow_forward_ios,
      )
    );
  }
}