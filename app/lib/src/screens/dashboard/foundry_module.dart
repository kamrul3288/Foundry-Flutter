import 'package:flutter/material.dart';

enum ModuleCategory { all, feature, component, utility }

class FoundryModule {
  const FoundryModule({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.category,
    this.destination,
  });

  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final ModuleCategory category;
  final Widget? destination;
}
