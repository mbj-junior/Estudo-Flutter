import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


void main() {
  runApp(const MaterialApp(
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text(AppLocalizations.of(context)!.title),
      )),
      body: Center(
        child: Text(
          AppLocalizations.of(context)!.helloWorld,
          style: const TextStyle(fontSize: 50, color: Colors.black),
        ),
        
      ),
    ));
  }
}
