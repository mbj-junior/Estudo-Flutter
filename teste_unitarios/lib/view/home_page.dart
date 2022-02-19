import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Website Update'),
        actions: [
          IconButton(icon: const Icon(Icons.ac_unit), onPressed: () {}),
          IconButton(icon: const Icon(Icons.ac_unit_sharp), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          ListView(
            key: const Key('list-view-copy'),
            shrinkWrap: true,
            children: [
              CheckboxListTile(
                value: true,
                onChanged: (newValue) {},
                title: const Text('Survey user'),
              )
            ],
          )
        ],
      ),
    );
  }
}
