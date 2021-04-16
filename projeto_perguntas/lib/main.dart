import 'package:flutter/material.dart';

main() {
  runApp(PerguntaApp());
}

class PerguntaApp extends StatelessWidget {
  Widget build(BuildContext context) {
    final List<String> perguntas = [
      'Qual sua cor favorita',
      'Qual sua nota favorita',
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: Column(
          children: [
            Text(perguntas.elementAt(0)),
            Text(perguntas[1]),
          ],
        ),
      ),
    );
  }
}
