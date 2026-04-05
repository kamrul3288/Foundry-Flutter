import 'package:app/src/screens/dashboard/foundry_module.dart';
import 'package:clean_architecture_bloc/clean_architecture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/flutter_designsystem.dart';
import 'package:go_router_navigation/go_router_navigation.dart';
import 'package:media_picker/media_picker.dart';

const modules = <FoundryModule>[
  // ── Features ────────────────────────────────────────────────────────────────
  FoundryModule(
    title: 'Clean Architecture',
    description: 'BLoC with Clean Architecture pattern',
    icon: Icons.architecture_rounded,
    color: Color(0xFF6366F1),
    category: ModuleCategory.feature,
    destination: CleanArchitectureBlocApp(),
  ),
  FoundryModule(
    title: 'Go Router Nav',
    description: 'Declarative routing with GoRouter',
    icon: Icons.navigation_rounded,
    color: Color(0xFF10B981),
    category: ModuleCategory.feature,
    destination: GoRouterNavigationApp(),
  ),

  // ── Components ──────────────────────────────────────────────────────────────
  FoundryModule(
    title: 'Design System',
    description: 'Reusable UI components and themes',
    icon: Icons.palette_rounded,
    color: Color(0xFFF59E0B),
    category: ModuleCategory.component,
    destination: FlutterDsMainScreen(),
  ),
  FoundryModule(
    title: 'Media Picker',
    description: 'Multi-image capture and selection',
    icon: Icons.photo_library_rounded,
    color: Color(0xFFEC4899),
    category: ModuleCategory.component,
    destination: MediaPickerMainScreen(),
  ),

  // ── Utilities ───────────────────────────────────────────────────────────────
  FoundryModule(
    title: 'Network (Dio X)',
    description: 'Robust networking utility wrapper',
    icon: Icons.network_check_rounded,
    color: Colors.blueGrey,
    category: ModuleCategory.utility,
  ),
  FoundryModule(
    title: 'Storage (Secure X)',
    description: 'Encrypted local storage wrapper',
    icon: Icons.security_rounded,
    color: Colors.blueGrey,
    category: ModuleCategory.utility,
  ),
  FoundryModule(
    title: 'DI (GetIt X)',
    description: 'Dependency Injection container',
    icon: Icons.extension_rounded,
    color: Colors.blueGrey,
    category: ModuleCategory.utility,
  ),
];
