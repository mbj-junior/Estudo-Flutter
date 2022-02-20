import 'package:flutter/material.dart';
import 'package:teste_unitarios/controller/home_controller.dart';

class HomePage extends StatefulWidget {
  final IHomeController controller;

  const HomePage({Key? key, required this.controller}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late IHomeController _controller;
  final int _currentIndex = 0;

  @override
  void initState() {
    _controller = widget.controller;
    _controller.currentIndex
        ?.then((_currentIndex) => _currentIndex = _currentIndex);
    super.initState();
  }

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
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (newIndex) async => await _controller
              .setCurrentIndex(newIndex)
              ?.then((value) => setState(() {})),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.sanitizer), label: "Item 1"),
            BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: "Item 2")
          ]),
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
