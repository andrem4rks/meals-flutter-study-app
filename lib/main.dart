// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meals.dart';
import 'package:meals/models/settings.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/settings_screen.dart';
import 'package:meals/screens/tabs_screen.dart';

import 'package:meals/utils/app_routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemeData tema = ThemeData();

  Settings settings = Settings();
  List<Meal> _availabelMeals = dummyMeals;

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _availabelMeals = dummyMeals.where((meal) {
          final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
          final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
          final filterVegan = settings.isVegan && !meal.isVegan;
          final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
          return !filterGluten && filterLactose && filterVegan && filterVegetarian;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        colorScheme: tema.colorScheme.copyWith(
          primary: Colors.pink,
          secondary: Colors.amber,
        ),
        fontFamily: 'Raleway',
        canvasColor: const Color.fromARGB(255, 255, 239, 236),
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontSize: 24,
                fontFamily: 'Raleway',
                color: Colors.white,
              ),
              titleMedium: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                color: Colors.white,
              ),
            ),
      ),
      routes: {
        AppRoutes.HOME: (ctx) => const TabsScreen (),
        AppRoutes.CATEGORIES_MEALS: (ctx) => CategoriesMealsScreen(_availabelMeals),
        AppRoutes.MEAL_DETAIL: (ctx) => const MealDetailScreen(),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(settings, _filterMeals),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) {
          return const CategoriesScreen();
        });
      },
    );
  }
}
