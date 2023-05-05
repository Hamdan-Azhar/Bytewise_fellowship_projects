
import 'package:flutter/material.dart';
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
  String _oldPassword = "";

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    super.dispose();
  }

  Future<void> _showPasswordChangeDialog(BuildContext context) async {
    String newPassword = "";
    _oldPasswordController.text = "";
    _newPasswordController.text = "";

    await showDialog(
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
                if (_oldPasswordController.text == _oldPassword) {
                  newPassword = _newPasswordController.text;
                  _oldPassword = newPassword;
                  Navigator.of(context).pop();

                  if (newPassword.isNotEmpty) {
                    // Save the new password
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: lighterColor,
                          content: Text(
                            "The new password entered is $newPassword",
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
                        title: const Text("Incorrect Password"),
                        content: const Text("The old password entered is incorrect."),
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