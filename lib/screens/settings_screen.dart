import 'package:flutter/material.dart';

import '../components/main_drawer.dart';
import '../models/settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var settings = Settings();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Configurações'),
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: const Text(
                'Configurações',
                style: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _createSwitch(
                    'Sem Glutén',
                    'Só exibe refeições sem glúten!',
                    settings.isGlutenFree,
                    (value) => setState(() => settings.isGlutenFree = value),
                  ),
                  _createSwitch(
                    'Sem Lactose',
                    'Só exibe refeições sem lactose!',
                    settings.isLactoseFree,
                    (value) => setState(() => settings.isLactoseFree = value),
                  ),
                  _createSwitch(
                    'Vegana',
                    'Só exibe refeições veganas!',
                    settings.isVegan,
                    (value) => setState(() => settings.isVegan = value),
                  ),
                  _createSwitch(
                    'Vegetariana',
                    'Só exibe refeições vegetarianas!',
                    settings.isVegetarian,
                    (value) => setState(() => settings.isVegetarian = value),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
    );
  }
}
