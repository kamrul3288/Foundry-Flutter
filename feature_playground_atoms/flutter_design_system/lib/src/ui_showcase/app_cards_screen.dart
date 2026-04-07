import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/components/cards/app_card.dart';
import 'package:flutter_design_system/src/components/structure/app_scaffold.dart';
import 'package:flutter_design_system/src/components/structure/app_topbar.dart';
import 'package:flutter_design_system/src/components/text/app_text.dart';

class AppCardsScreen extends StatelessWidget {
  const AppCardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const AppTopBar(title: 'Cards'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              title: "Card Variants",
              description: "Cards support three main variants: Filled, Outline, and Filled Outline.",
              children: [
                AppCard.rounded(
                  variant: AppCardVariant.filled,
                  child: const AppText.bodyMedium("Filled Card - Default style with surface color."),
                ),
                const SizedBox(height: 12),
                AppCard.rounded(
                  variant: AppCardVariant.outline,
                  child: const AppText.bodyMedium("Outline Card - Transparent background with border."),
                ),
                const SizedBox(height: 12),
                AppCard.rounded(
                  variant: AppCardVariant.filledOutline,
                  child: const AppText.bodyMedium("Filled Outline Card - Subtle background with border."),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              title: "Card Shapes",
              description: "Available in various shapes: Rounded, Pill, and Circle.",
              children: [
                Row(
                  children: [
                    Expanded(
                      child: AppCard.rounded(
                        child: const Center(child: AppText.bodySmall("Rounded")),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: AppCard.pill(
                        child: const Center(child: AppText.bodySmall("Pill Shape")),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Center(
                  child: AppCard.circle(
                    size: 80,
                    child: const AppText.bodySmall("Circle", textAlign: TextAlign.center),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              title: "Corner Configurations",
              description: "Control which corners are rounded: Top, Bottom, Left, or Right.",
              children: [
                Row(
                  children: [
                    Expanded(
                      child: AppCard.rounded(
                        cornerMode: AppCardCornerMode.top,
                        cornerRadius: AppCardCornerRadius.lg,
                        child: const Center(child: AppText.bodySmall("Top Only")),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: AppCard.rounded(
                        cornerMode: AppCardCornerMode.bottom,
                        cornerRadius: AppCardCornerRadius.lg,
                        child: const Center(child: AppText.bodySmall("Bottom Only")),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                AppCard.rounded(
                  cornerRadius: AppCardCornerRadius.lg,
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: AppText.bodyMedium("Large Corner Radius"),
                    ),
                  ),
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
