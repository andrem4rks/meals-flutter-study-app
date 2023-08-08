import 'package:flutter/material.dart';
import 'package:meals/utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Theme.of(context).colorScheme.copyWith().secondary,
            alignment: Alignment.bottomRight,
            child: Text(
              'Vamos Cozinhar?',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 25,
                color: Theme.of(context).colorScheme.copyWith().primary,
              ),
            ),
          ),
          _createItem(
            Icons.restaurant,
            'Refeições',
            context,
            () => Navigator.of(context).pushReplacementNamed(AppRoutes.HOME),
          ),
          _createItem(
            Icons.settings,
            'Configurações',
            context,
            () => Navigator.of(context).pushNamed(AppRoutes.SETTINGS),
          ),
        ],
      ),
    );
  }

  Widget _createItem(
      IconData icon, String label, BuildContext context, void Function() onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
        color: Theme.of(context).colorScheme.copyWith().primary,
      ),
      title: Text(
        label,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }
}
