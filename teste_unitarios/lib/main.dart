import 'package:teste_unitarios/repository/home_repository.dart';

import 'view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:teste_unitarios/controller/home_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tests Unitarios',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(controller: HomeController(HomeRepository())),
    );
  }
}
