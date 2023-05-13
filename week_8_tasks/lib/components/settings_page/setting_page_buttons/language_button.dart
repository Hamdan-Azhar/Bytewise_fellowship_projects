import 'package:flutter/material.dart';

import '../../../constants/constant_colors.dart';

//A separate class for language button
class LanguageButton extends StatefulWidget {
  const LanguageButton({Key? key}) : super(key: key);

  @override
  LanguageButtonState createState() => LanguageButtonState();
}

class LanguageButtonState extends State<LanguageButton> {
  String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Row(
        children: [
          const Icon(Icons.language),
          const SizedBox(width: 8.0),
          Text(
            _selectedLanguage,
            style: const TextStyle(
              color: darkerColor,
              fontSize: 18
            ),
          ),
        ],
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                backgroundColor: lighterColor,
                content: Theme(
                  data: Theme.of(context).copyWith(
                    canvasColor:
                        lighterColor, // sets the background color of the DropdownMenu
                  ),
                  child: DropdownButton<String>(
                    value: _selectedLanguage,
                    items: <String>['English', 'French', 'German', 'Spanish']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(
                            color:
                                darkerColor, // sets the color of the text that shows the selected language
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        _selectedLanguage = value!;
                      });
                      Navigator.of(context).pop();
                    },
                  ),
                ));
          },
        );
      },
    );
  }
}
