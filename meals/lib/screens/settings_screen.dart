import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var settings = Settings();

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    void Function(bool)? onChanged,
  ) {
    return SwitchListTile.adaptive(
        title: Text(title),
        subtitle: Text(subtitle),
        value: value,
        onChanged: onChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Configurações'),
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Configurações',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Expanded(
                child: ListView(
              children: <Widget>[
                _createSwitch(
                    'Sem Glutem',
                    'Só exibe refeições sem glutem',
                    settings.isGluttenFree,
                    (value) => setState(() {
                          settings.isGluttenFree = value;
                        })),
                _createSwitch(
                    'Sem Lactose',
                    'Só exibe refeições sem lactose',
                    settings.isLactoseFree,
                    (value) => setState(() {
                          settings.isLactoseFree = value;
                        })),
                _createSwitch(
                    'Vegana',
                    'Só exibe refeições Veganas',
                    settings.isVegan,
                    (value) => setState(() {
                          settings.isVegan = value;
                        })),
                _createSwitch(
                    'Vegetariana',
                    'Só exibe refeições sem lactose',
                    settings.isVegetarian,
                    (value) => setState(() {
                          settings.isVegetarian = value;
                        })),
              ],
            ))
          ],
        ));
  }
}
