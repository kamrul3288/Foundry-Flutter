import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/components/inputfiled/app_input_text_filed.dart';
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
                const AppTextField(
                  label: 'Outline Variant',
                  hint: 'Enter text here',
                  variant: AppInputVariant.outline,
                ),
                const SizedBox(height: 12),
                const AppTextField(
                  label: 'Filled Variant',
                  hint: 'Enter text here',
                  variant: AppInputVariant.filled,
                ),
                const SizedBox(height: 12),
                const AppTextField(
                  label: 'Underline Variant',
                  hint: 'Enter text here',
                  variant: AppInputVariant.underline,
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              title: "Input Shapes",
              description: "Supports Rounded and Pill shapes for different design needs.",
              children: [
                const AppTextField(
                  label: 'Rounded Shape',
                  hint: 'Default rounded corners',
                  variant: AppInputVariant.outline,
                  shape: AppInputShape.rounded,
                ),
                const SizedBox(height: 12),
                const AppTextField(
                  label: 'Pill Shape',
                  hint: 'Fully rounded corners',
                  variant: AppInputVariant.outline,
                  shape: AppInputShape.pill,
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              title: "Input States & Features",
              description: "Different states like error and features like icons.",
              children: [
                const AppTextField(
                  label: 'With Prefix Icon',
                  hint: 'Search...',
                  variant: AppInputVariant.outline,
                  prefixIcon: Icon(Icons.search),
                ),
                const SizedBox(height: 12),
                const AppTextField(
                  label: 'Error State',
                  hint: 'Invalid input',
                  variant: AppInputVariant.outline,
                  errorText: "This field is required",
                ),
                const SizedBox(height: 12),
                const AppTextField(
                  label: 'Disabled State',
                  hint: 'Cannot edit this',
                  variant: AppInputVariant.outline,
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
