import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/components/icon/app_icon.dart';
import 'package:flutter_design_system/src/components/inputfiled/inputfield.dart';
import 'package:flutter_design_system/src/components/structure/app_scaffold.dart';
import 'package:flutter_design_system/src/components/structure/app_topbar.dart';
import 'package:flutter_design_system/src/components/text/app_text.dart';

class TextFiledScreen extends StatelessWidget {
  const TextFiledScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const AppTopBar(title: 'Text Fields'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              title: "Input Variants",
              description: "Text fields come in Outline, Filled, and Underline variants.",
              children: [
                const AppInputField(
                  label: 'Outline Variant',
                  hint: 'Enter text here',
                  variant: AppInputFieldVariant.outline,
                ),
                const SizedBox(height: 12),
                const AppInputField(
                  label: 'Filled Variant',
                  hint: 'Enter text here',
                  variant: AppInputFieldVariant.filled,
                ),
                const SizedBox(height: 12),
                const AppInputField(
                  label: 'Underline Variant',
                  hint: 'Enter text here',
                  variant: AppInputFieldVariant.underline,
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              title: "Input Shapes",
              description: "Supports Rounded and Pill shapes for different design needs.",
              children: [
                const AppInputField(
                  label: 'Rounded Shape',
                  hint: 'Default rounded corners',
                  variant: AppInputFieldVariant.outline,
                  shape: AppInputFieldShape.rounded,
                ),
                const SizedBox(height: 12),
                const AppInputField(
                  label: 'Pill Shape',
                  hint: 'Fully rounded corners',
                  variant: AppInputFieldVariant.outline,
                  shape: AppInputFieldShape.pill,
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              title: "Input States & Features",
              description: "Different states like error and features like icons.",
              children: [
                const AppInputField(
                  label: 'With Prefix Icon',
                  hint: 'Search...',
                  variant: AppInputFieldVariant.outline,
                  prefixIcon: AppIcon(Icon(Icons.search)),
                ),
                const SizedBox(height: 12),
                const AppInputField(
                  label: 'Error State',
                  hint: 'Invalid input',
                  variant: AppInputFieldVariant.outline,
                  errorText: "This field is required",
                ),
                const SizedBox(height: 12),
                const AppInputField(
                  label: 'Disabled State',
                  hint: 'Cannot edit this',
                  variant: AppInputFieldVariant.outline,
                  enabled: false,
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
