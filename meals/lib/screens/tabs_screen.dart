import 'package:flutter/material.dart';
import 'package:meals/screens/favorite_screen.dart';
import 'package:meals/screens/categories_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;

  final List<Map<String, dynamic>> _screens = [
    {'title': 'Lista de Categorias', 'screen': const CategoriesScreen()},
    {'title': 'Favoritos', 'screen': const FavoriteScreen()}
  ];

  _selectedScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _screens[_selectedScreenIndex]['title'],
        ),
      ),
      body: _screens[_selectedScreenIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectedScreen,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.amber,
          currentIndex: _selectedScreenIndex,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: const Icon(Icons.category),
                label: 'Categorias'),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: const Icon(Icons.star),
                label: 'Favoritos'),
          ]),
    );
  }
}
