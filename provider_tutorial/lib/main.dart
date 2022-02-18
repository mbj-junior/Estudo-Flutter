import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/home_page.dart';
import 'package:provider_tutorial/controller/inc_controller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider tutorial',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        child: HomePage(),
        create: (_) => IncController(),
      ),
    );
  }
}
