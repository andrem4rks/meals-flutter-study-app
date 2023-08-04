import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import 'package:meals/screens/categories_meals_screen.dart';

class CategoryItem extends StatefulWidget {
  final Category category;

  const CategoryItem(this.category, {super.key});

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  bool isHovered = false;

  void _selectCategory(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return const CategoriesMealsScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: MaterialStateMouseCursor.clickable,
      onEnter: (value) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (value) {
        setState(() {
          isHovered = false;
        });
      },
      child: InkWell(
        onTap: () => _selectCategory(context),
        borderRadius: BorderRadius.circular(10),
        splashColor: Theme.of(context).primaryColor,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: isHovered
                ? BorderRadius.circular(10)
                : BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                widget.category.color.withOpacity(0.8),
                widget.category.color,
              ],
            ),
          ),
          child: Text(
            widget.category.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
    );
  }
}
