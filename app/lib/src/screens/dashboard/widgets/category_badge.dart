import 'package:app/src/screens/dashboard/foundry_module.dart';
import 'package:flutter/material.dart';

/// A small badge showing the module's category label.
class CategoryBadge extends StatelessWidget {
  const CategoryBadge({super.key, required this.category});

  final ModuleCategory category;

  static const _colors = {
    ModuleCategory.feature: Color(0xFF6366F1),
    ModuleCategory.component: Color(0xFFF59E0B),
    ModuleCategory.utility: Color(0xFF94A3B8),
    ModuleCategory.all: Color(0xFF94A3B8),
  };

  @override
  Widget build(BuildContext context) {
    final color = _colors[category] ?? Colors.grey;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withAlpha(30),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        category.name.toUpperCase(),
        style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: color),
      ),
    );
  }
}
