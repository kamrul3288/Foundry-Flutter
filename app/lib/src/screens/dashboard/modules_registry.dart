import 'dart:math' as math;

import 'package:app/src/screens/dashboard/foundry_module.dart';
import 'package:clean_architecture_bloc/clean_architecture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/flutter_designsystem.dart';
import 'package:go_router_navigation/go_router_navigation.dart';
import 'package:media_picker/media_picker.dart';
import 'package:pkg_auto_router/auto_router_pkg.dart';
import 'package:pkg_dio/dio_pkg.dart';
import 'package:pkg_flutter_secure_storage/flutter_secure_storage_pkg.dart';
import 'package:pkg_get_it/get_it_pkg.dart';
import 'package:pkg_go_router/go_router_pkg.dart';

final modules = <FoundryModule>[
  // ── Features ────────────────────────────────────────────────────────────────
  FoundryModule(title: 'Clean Architecture', description: 'BLoC with Clean Architecture pattern', icon: Icons.architecture_rounded, color: Color(0xFF6366F1), category: ModuleCategory.featMolecules, destination: CleanArchitectureBlocApp()),
  FoundryModule(title: 'Go Router Nav', description: 'Declarative routing with GoRouter', icon: Icons.navigation_rounded, color: Color(0xFF10B981), category: ModuleCategory.featMolecules, destination: GoRouterNavigationApp()),

  // ── Components ──────────────────────────────────────────────────────────────
  FoundryModule(title: 'Design System', description: 'Reusable UI components and themes', icon: Icons.palette_rounded, color: Color(0xFFF59E0B), category: ModuleCategory.featAtom, destination: FlutterDsMainScreen()),
  FoundryModule(title: 'Media Picker', description: 'Multi-image capture and selection', icon: Icons.photo_library_rounded, color: Color(0xFFEC4899), category: ModuleCategory.featAtom, destination: MediaPickerMainScreen()),

  // ── Utilities ───────────────────────────────────────────────────────────────
  FoundryModule(title: 'dio', description: 'Robust networking utility wrapper', icon: Icons.network_check_rounded, color: _colors, category: ModuleCategory.packages, destination: DioMainScreen()),
  FoundryModule(title: 'flutter_secure_storage', description: 'Encrypted local storage wrapper', icon: Icons.security_rounded, color: _colors, category: ModuleCategory.packages, destination: SecureStorageEntryScreen()),
  FoundryModule(title: 'get_it', description: 'Dependency Injection container', icon: Icons.schema, color: _colors, category: ModuleCategory.packages, destination: GetitMainScreen()),
  FoundryModule(title: 'go_router', description: 'Routing with GoRouter', icon: Icons.navigation_rounded, color: _colors, category: ModuleCategory.packages, destination: GoRouterMainScreen()),
  FoundryModule(title: 'auto_route', description: 'Routing with AutoRoute', icon: Icons.navigation_rounded, color: _colors, category: ModuleCategory.packages, destination: AutoRouterEntryScreen()),
];

Color get _colors => Colors.primaries[math.Random().nextInt(Colors.primaries.length)];
