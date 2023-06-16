import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../changeNotifier.dart';
import '../../../constants/constant_colors.dart';

class LanguageButton extends StatefulWidget {
  const LanguageButton({Key? key}) : super(key: key);

  @override
  LanguageButtonState createState() => LanguageButtonState();
}

class LanguageButtonState extends State<LanguageButton> {

  @override
  void initState() {  //When the app is started, this function is called which retrieves the value
    super.initState();// of language from SharedPreferences instance.
     Provider.of<SettingsState>(context, listen: false).retrieveLanguage();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsState>(
      builder: (context, settingsState, _) {
        return IconButton(
          icon: Row(
            children: [
              const Icon(Icons.language),
              const SizedBox(width: 8.0),
              Text(
                settingsState.language, //Here,the language currently chosen by user will appear in icon.
                style: const TextStyle(
                  color: darkerColor,
                  fontSize: 18,
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
                      canvasColor: lighterColor,
                    ),
                    child: DropdownButton<String>(
                            value: settingsState.language,
                            items: <String>['English', 'French', 'German', 'Spanish']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(
                                    color: darkerColor,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              settingsState.updateLanguage(value!);  //Here the language chosen by user
                              Navigator.of(context).pop();           //is stored in SharedPreferences using
                            },                                       //updateLanguage function
                          ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
