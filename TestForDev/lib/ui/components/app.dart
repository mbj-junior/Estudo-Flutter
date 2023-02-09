import 'package:TestForDev/ui/pages/pages.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Testes TDD',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
