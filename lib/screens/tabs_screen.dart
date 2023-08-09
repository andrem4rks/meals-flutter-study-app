import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/favorite_screen.dart';

import '../models/meals.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsScreen(this.favoriteMeals, {super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  List<Widget>? _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      const CategoriesScreen(),
      FavoriteScreen(widget.favoriteMeals),
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Row(
            children: [
              Text('DeliMeals'),
              SizedBox(width: 10),
              Icon(Icons.menu_book)
            ],
          ),
        ),
        drawer: const MainDrawer(),
        body: _screens?[_selectedScreenIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).colorScheme.copyWith().primary,
          selectedItemColor: Colors.white,
          currentIndex: _selectedScreenIndex,
          onTap: _selectScreen,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categorias',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favoritos',
            ),
          ],
        ),
      ),
    );
  }
}
