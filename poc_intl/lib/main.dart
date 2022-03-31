import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
          title: const Center(
        child: Text('Aplicativo em Porugues'),
      )),
      body: const Center(
        child: Text(
          'Olá Mundo',
          style: TextStyle(fontSize: 50, color: Colors.black),
        ),
      ),
    ));
  }
}
