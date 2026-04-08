import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/components/scaffold/app_scaffold.dart';
import 'package:flutter_design_system/src/components/topbar/app_topbar.dart';
import 'package:flutter_design_system/src/components/text/app_text.dart';

class TextsScreen extends StatelessWidget {
  const TextsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const AppTopBar(title: 'Texts'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              title: "Display Text",
              description: "Main headers for hierarchical layout structure.",
              children: [
                const AppText.displayLarge('Display Large'),
                const AppText.displayMedium('Display Medium'),
                const AppText.displaySmall('Display Small'),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              title: "Headers",
              description: "Main headers for hierarchical layout structure.",
              children: [
                const AppText.headlineLarge('Headline Large'),
                const AppText.headlineMedium('Headline Medium'),
                const AppText.headlineSmall('Headline Small'),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              title: "Titles",
              description: "Subtitle and secondary header styles.",
              children: [
                const AppText.titleLarge('Title Large'),
                const AppText.titleMedium('Title Medium'),
                const AppText.titleSmall('Title Small'),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              title: "Body Text",
              description: "Standard text styles for paragraphs and general content.",
              children: [
                const AppText.bodyLarge('Body Large - Standard paragraph text.'),
                const AppText.bodyMedium('Body Medium - Secondary paragraph text.'),
                const AppText.bodySmall('Body Small - Smaller description text.'),
              ],
            ),

            const SizedBox(height: 24),
            _buildSection(
              title: "Label Text",
              description: "Standard text styles for paragraphs and general content.",
              children: [
                const AppText.labelLarge('Label Large'),
                const AppText.labelMedium('Label Medium'),
                const AppText.labelSmall('Label Small'),
              ],
            ),

            const SizedBox(height: 24),
            _buildSection(
              title: "Captions",
              description: "Smallest text styles for hints and legal information.",
              children: [
                const AppText.captionLarge('Caption Large'),
                const AppText.captionMedium('Caption Medium'),
                const AppText.captionSmall('Caption Small'),
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
        ...children.expand((element) => [element, const SizedBox(height: 8)]).toList()..removeLast(),
      ],
    );
  }
}
