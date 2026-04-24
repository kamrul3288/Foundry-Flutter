import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/components/scaffold/app_scaffold.dart';
import 'package:flutter_design_system/src/components/topbar/app_topbar.dart';
import 'package:flutter_design_system/src/components/divider/divider.dart';
import 'package:flutter_design_system/src/components/text/app_text.dart';
import 'package:flutter_design_system/src/tokens/app_colors.dart';

class DividersScreen extends StatelessWidget {
  const DividersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const AppTopBar(title: 'Dividers'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              title: "Divider Variants",
              description: "Dividers support Solid, Dashed, and Dotted variants.",
              children: [
                const AppText.bodySmall("Solid"),
                const SizedBox(height: 8),
                const AppDivider(variant: AppDividerVariant.solid),
                const SizedBox(height: 16),
                
                const AppText.bodySmall("Dashed"),
                const SizedBox(height: 8),
                const AppDivider.dashed(),
                const SizedBox(height: 16),
                
                const AppText.bodySmall("Dotted"),
                const SizedBox(height: 8),
                const AppDivider.dotted(),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              title: "Divider Intents",
              description: "Dividers can use Primary, Secondary, or Brand colors.",
              children: [
                const AppText.bodySmall("Primary"),
                const SizedBox(height: 8),
                const AppDivider(intent: AppDividerIntent.primary),
                const SizedBox(height: 16),
                
                const AppText.bodySmall("Secondary"),
                const SizedBox(height: 8),
                const AppDivider(intent: AppDividerIntent.secondary),
                const SizedBox(height: 16),
                
                const AppText.bodySmall("Brand"),
                const SizedBox(height: 8),
                const AppDivider(intent: AppDividerIntent.brand),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              title: "Vertical Dividers",
              description: "Dividers can be horizontal or vertical.",
              children: [
                SizedBox(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const AppDivider(direction: Axis.vertical),
                      const AppDivider.dashed(direction: Axis.vertical),
                      const AppDivider.dotted(direction: Axis.vertical),
                      const AppDivider(
                        direction: Axis.vertical,
                        intent: AppDividerIntent.brand,
                        thickness: 4,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              title: "Customizations",
              description: "Customize thickness, indent, dash/dot widths, etc.",
              children: [
                const AppText.bodySmall("Thickness 4.0"),
                const SizedBox(height: 8),
                const AppDivider(thickness: 4.0),
                const SizedBox(height: 16),
                
                const AppText.bodySmall("Indent & EndIndent 32.0"),
                const SizedBox(height: 8),
                const AppDivider(indent: 32.0, endIndent: 32.0),
                const SizedBox(height: 16),
                
                const AppText.bodySmall("Custom Dashed Width (12.0) and Gap (8.0)"),
                const SizedBox(height: 8),
                const AppDivider.dashed(dashWidth: 12.0, gapWidth: 8.0, thickness: 2.0),
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
        AppText.bodySmall(description, color: AppColors.neutral500),
        const SizedBox(height: 16),
        ...children,
      ],
    );
  }
}
