// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:simple_localization/classes/language.constants.dart';
import 'package:simple_localization/classes/language.dart';
import 'package:simple_localization/main.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translation(context).settings),
      ),
      body: Center(
          child: DropdownButton<Language>(
        iconSize: 30,
        hint: Text(translation(context).changeLanguage),
        onChanged: (Language? language) async {
          if (language != null) {
            // ignore: no_leading_underscores_for_local_identifiers
            Locale _locale = await setLocale(language.languageCode);
            MyApp.setLocale(context, _locale);
          }
        },
        items: Language.languageList()
            .map<DropdownMenuItem<Language>>(
              (e) => DropdownMenuItem<Language>(
                value: e,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      e.flag,
                      style: const TextStyle(fontSize: 30),
                    ),
                    Text(e.name)
                  ],
                ),
              ),
            )
            .toList(),
      )),
    );
  }
}
