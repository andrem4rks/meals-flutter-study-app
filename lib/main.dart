import 'package:flutter/material.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/settings_screen.dart';
import 'package:meals/screens/tabs_screen.dart';

import 'package:meals/utils/app_routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final ThemeData tema = ThemeData();

  MyApp({super.key});

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
        AppRoutes.CATEGORIES_MEALS: (ctx) => const CategoriesMealsScreen(),
        AppRoutes.MEAL_DETAIL: (ctx) => const MealDetailScreen(),
        AppRoutes.SETTINGS: (ctx) => const SettingsScreen(),
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
