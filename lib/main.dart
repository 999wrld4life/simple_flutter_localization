import 'package:flutter/material.dart';
import 'package:simple_localization/router/custom_router.dart';
import 'package:simple_localization/router/route_constants.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

  //TODO: implement setLocale
}

class _MyAppState extends State<MyApp> {
  // TODO: define local and setLocale and on didChangedependies initilas

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Localization',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('fa'), // Farsi
        Locale('ar'), // Arabic
      ],
      locale: const Locale('ar', ''),
      // TODO: implement localizations
      onGenerateRoute: CustomRouter.generatedRoute,
      initialRoute: homeRoute,
    );
  }
}
