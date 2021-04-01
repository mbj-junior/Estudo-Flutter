import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: Scaffold(
        body: SizedBox(
          height: 300,
          child: Card(
            child: Column(
              children: <Widget>[
                Image.network(
                    'https://amp.receitadevovo.com.br/wp-content/uploads/2020/10/receita-de-calda-de-chocolate-para-bolo.jpg'),
                Text('Bolo de Chocolate')
              ],
            ),
          ),
        ),
        appBar: AppBar(title: Text('Cozinando em Casa')),
      ),
    );
  }
}
