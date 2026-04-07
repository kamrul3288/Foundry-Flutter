import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/components/structure/app_scaffold.dart';
import 'package:flutter_design_system/src/components/structure/app_topbar.dart';
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
              title: "Headers",
              description: "Main headers for hierarchical layout structure.",
              children: [
                const AppText.h1('H1 - Heading 1'),
                const AppText.h2('H2 - Heading 2'),
                const AppText.h3('H3 - Heading 3'),
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
              title: "Captions",
              description: "Smallest text styles for hints and legal information.",
              children: [
                const AppText.caption('Caption Text'),
                const AppText.captionSmall('Caption Small Text'),
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
        ...children.expand((element) => [element, const SizedBox(height: 8)]).toList()
          ..removeLast(),
      ],
    );
  }
}
