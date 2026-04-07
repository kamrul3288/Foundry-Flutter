import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/components/structure/app_scaffold.dart';
import 'package:flutter_design_system/src/components/structure/app_topbar.dart';
import 'package:flutter_design_system/src/components/tag/app_tag.dart';
import 'package:flutter_design_system/src/components/text/app_text.dart';
import 'package:flutter_design_system/src/theme/extensions/app_tag_theme.dart';

class TagsScreen extends StatelessWidget {
  const TagsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const AppTopBar(title: 'Tags'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              title: "Tag Variants",
              description: "Tags support Filled, Outline, and Filled Outline variants.",
              children: [
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    AppTag(
                      variant: AppTagVariant.filled,
                      shape: AppTagShape.rounded,
                      child: const AppText.bodySmall("Filled Tag", inheritColor: true),
                    ),
                    AppTag(
                      variant: AppTagVariant.outline,
                      shape: AppTagShape.rounded,
                      child: const AppText.bodySmall("Outline Tag", inheritColor: true),
                    ),
                    AppTag(
                      variant: AppTagVariant.filledOutline,
                      shape: AppTagShape.rounded,
                      child: const AppText.bodySmall("Filled Outline", inheritColor: true),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              title: "Tag Shapes",
              description: "Different shapes to fit your UI: Pill, Rounded, Circle, and Sharp.",
              children: [
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    AppTag(
                      variant: AppTagVariant.filled,
                      shape: AppTagShape.pill,
                      child: const AppText.bodySmall("Pill", inheritColor: true),
                    ),
                    AppTag(
                      variant: AppTagVariant.filled,
                      shape: AppTagShape.rounded,
                      child: const AppText.bodySmall("Rounded", inheritColor: true),
                    ),
                    AppTag(
                      variant: AppTagVariant.filled,
                      shape: AppTagShape.circle,
                      child: const Padding(
                        padding: EdgeInsets.all(4),
                        child: Icon(Icons.add, size: 16),
                      ),
                    ),
                    AppTag(
                      variant: AppTagVariant.filled,
                      shape: AppTagShape.sharp,
                      child: const AppText.bodySmall("Sharp", inheritColor: true),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              title: "Color Roles",
              description: "Tags can use Primary or Neutral color roles.",
              children: [
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    AppTag(
                      variant: AppTagVariant.filled,
                      shape: AppTagShape.rounded,
                      colorRole: AppTagColorRole.primary,
                      leading: const Icon(Icons.star, size: 14),
                      child: const AppText.bodySmall("Primary", inheritColor: true),
                    ),
                    AppTag(
                      variant: AppTagVariant.filled,
                      shape: AppTagShape.rounded,
                      colorRole: AppTagColorRole.neutral,
                      leading: const Icon(Icons.settings, size: 14),
                      child: const AppText.bodySmall("Neutral", inheritColor: true),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              title: "With Icons",
              description: "Tags can include leading or trailing icons.",
              children: [
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    AppTag(
                      variant: AppTagVariant.filled,
                      shape: AppTagShape.pill,
                      leading: const Icon(Icons.check, size: 14),
                      child: const AppText.bodySmall("Verified", inheritColor: true),
                    ),
                    AppTag(
                      variant: AppTagVariant.outline,
                      shape: AppTagShape.pill,
                      trailing: const Icon(Icons.close, size: 14),
                      child: const AppText.bodySmall("Dismissible", inheritColor: true),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required String description,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.titleMedium(title),
        AppText.bodySmall(description, color: Colors.grey),
        const SizedBox(height: 16),
        ...children,
      ],
    );
  }
}
