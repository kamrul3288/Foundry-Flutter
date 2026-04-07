import 'package:flutter/material.dart';

enum ModuleCategory {
  all('All'),
  packages('PACKAGES'),
  featMolecules('FEAT_MOLECULES'),
  featAtom('FEAT_ATOM')
  ;

  const ModuleCategory(this.displayName);
  final String displayName;
}

class FoundryModule {
  const FoundryModule({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.category,
    required this.destination,
  });

  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final ModuleCategory category;
  final Widget destination;
}
