import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/theme/extensions/app_card_theme.dart';
import 'package:flutter_design_system/src/components/inputfiled/app_input_field_theme.dart';
import 'package:flutter_design_system/src/theme/extensions/app_scaffold_theme.dart';
import 'package:flutter_design_system/src/components/tag/app_tag_theme.dart';
import 'package:flutter_design_system/src/components/typography/app_typography_theme.dart';
import 'package:flutter_design_system/src/theme/app_color_scheme.dart';
import 'package:flutter_design_system/src/components/button/app_button_theme.dart';
import 'package:flutter_design_system/src/ui_showcase/app_cards_screen.dart';
import 'package:flutter_design_system/src/ui_showcase/buttons_screen.dart';
import 'package:flutter_design_system/src/ui_showcase/app_scaffold_screen.dart';
import 'package:flutter_design_system/src/ui_showcase/tags_screen.dart';
import 'package:flutter_design_system/src/ui_showcase/textfiled_screen.dart';
import 'package:flutter_design_system/src/ui_showcase/texts_screen.dart';

class ExampleItem {
  final String title;
  final String description;
  final IconData icon;
  final Widget screen;

  ExampleItem({
    required this.title,
    required this.description,
    required this.icon,
    required this.screen,
  });
}

class FlutterDsMainScreen extends StatelessWidget {
  const FlutterDsMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        extensions: [
          AppButtonTheme.light(),
          AppColorScheme.light(),
          AppTypographyTheme.standard(),
          AppInputFieldTheme.light(),
          AppTagTheme.light(),
          AppCardTheme.light(),
          AppScaffoldTheme.light(),
        ],
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFF8FAFC),
        appBar: AppBar(
          title: const Text('Design System'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xFF1E293B),
        ),
        body: const _DesignSystemBody(),
      ),
    );
  }
}

class _DesignSystemBody extends StatelessWidget {
  const _DesignSystemBody();

  @override
  Widget build(BuildContext context) {
    final List<ExampleItem> items = [
      ExampleItem(
        title: "Buttons",
        description: "Standard action components with various states and styles.",
        icon: Icons.smart_button_rounded,
        screen: const ButtonsScreen(),
      ),
      ExampleItem(
        title: "Texts",
        description: "Typography system with predefined scales and weights.",
        icon: Icons.text_fields_rounded,
        screen: const TextsScreen(),
      ),
      ExampleItem(
        title: "TextFields",
        description: "Form input components for text and data entry.",
        icon: Icons.input_rounded,
        screen: const TextFiledScreen(),
      ),
      ExampleItem(
        title: "Tags",
        description: "Small badges for labels, categories, or statuses.",
        icon: Icons.tag_rounded,
        screen: const TagsScreen(),
      ),
      ExampleItem(
        title: "Cards",
        description: "Container components for grouping related information.",
        icon: Icons.dashboard_customize_rounded,
        screen: const AppCardsScreen(),
      ),
      ExampleItem(
        title: "Scaffold",
        description: "Layout structure with integrated TopBar and Loading states.",
        icon: Icons.layers_rounded,
        screen: const AppScaffoldScreen(),
      ),
    ];

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.85,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return _DesignCard(item: item);
      },
    );
  }
}

class _DesignCard extends StatelessWidget {
  const _DesignCard({required this.item});
  final ExampleItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => item.screen),
        ),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                item.icon,
                size: 40,
                color: const Color(0xFF6366F1),
              ),
              const SizedBox(height: 12),
              Text(
                item.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E293B),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                item.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey.shade600,
                  height: 1.3,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
