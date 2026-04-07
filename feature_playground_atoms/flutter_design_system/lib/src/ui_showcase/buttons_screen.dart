import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/components/button/button.dart';
import 'package:flutter_design_system/src/components/structure/app_scaffold.dart';
import 'package:flutter_design_system/src/components/structure/app_topbar.dart';
import 'package:flutter_design_system/src/components/text/app_text.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const AppTopBar(title: 'Buttons'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              title: "Button Variants",
              description: "Buttons come in three main variants: Filled, Outline,Text and icon.",
              children: [
                Row(
                  children: [
                    Expanded(
                      child: AppFilledButton.text(
                        "Filled",
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: AppOutlineButton.text(
                        "Outline",
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: AppTextButton(
                        "Text",
                        onPressed: () {},
                      ),
                    ),
                    AppIconButton(
                      const Icon(Icons.add),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              title: "Button Sizes",
              description: "Buttons support three sizes: Small, Medium, and Large.",
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: AppFilledButton.text(
                        "Small",
                        height: AppButtonHeight.sm,
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: AppFilledButton.text(
                        "Medium",
                        height: AppButtonHeight.md,
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: AppFilledButton.text(
                        "Large",
                        height: AppButtonHeight.lg,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              title: "Button Shapes",
              description: "Different shapes to match the visual style of your application.",
              children: [
                Row(
                  children: [
                    Expanded(
                      child: AppFilledButton.text(
                        "Rounded",
                        onPressed: () {},
                        style: const AppFilledButtonStyle(shape: AppButtonShape.rounded),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: AppFilledButton.text(
                        "Pill",
                        onPressed: () {},
                        style: const AppFilledButtonStyle(shape: AppButtonShape.pill),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    AppFilledButton.icon(
                      const Icon(Icons.add),
                      onPressed: () {},
                      style: const AppFilledButtonStyle(shape: AppButtonShape.circle),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: AppFilledButton.text(
                        "Sharp",
                        onPressed: () {},
                        style: const AppFilledButtonStyle(shape: AppButtonShape.sharp),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              title: "Button States",
              description: "Buttons can be in various states like loading or disabled.",
              children: [
                Row(
                  children: [
                    Expanded(
                      child: AppFilledButton.text(
                        "Loading",
                        onPressed: () {},
                        isLoading: true,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: AppFilledButton.text(
                        "Disabled",
                        onPressed: null,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              title: "Icon Buttons",
              description: "Compact buttons used for simple actions with icons.",
              children: [
                Row(
                  children: [
                    AppIconButton(
                      const Icon(Icons.favorite_border),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 12),
                    AppIconButton(
                      const Icon(Icons.share_outlined),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 12),
                    AppIconButton(
                      const Icon(Icons.bookmark_border),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 12),
                    AppIconButton(
                      const Icon(Icons.more_vert),
                      onPressed: () {},
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
