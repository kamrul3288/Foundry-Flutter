import 'package:app/src/screens/dashboard/foundry_module.dart';
import 'package:flutter/material.dart';

/// A small badge showing the module's category label.
class CategoryBadge extends StatelessWidget {
  const CategoryBadge({super.key, required this.category});

  final ModuleCategory category;

  Color _getModuleBgColor(ModuleCategory category) {
    return switch (category) {
      ModuleCategory.featMolecules => Colors.blue,
      ModuleCategory.featAtom => Colors.green,
      ModuleCategory.all => Colors.yellow,
      ModuleCategory.packages => Colors.purple,
    };
  }

  @override
  Widget build(BuildContext context) {
    final color = _getModuleBgColor(category);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withAlpha(30),
        borderRadius: BorderRadius.circular(4),
      ),
      child: FittedBox(
        child: Text(
          category.displayName.toUpperCase(),
          style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: color),
        ),
      ),
    );
  }
}
