import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exemplo Bloc'),
      ),
      body: ListView.builder(
          itemCount: 50,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Item $index'),
            );
          }),
    );
  }
}
