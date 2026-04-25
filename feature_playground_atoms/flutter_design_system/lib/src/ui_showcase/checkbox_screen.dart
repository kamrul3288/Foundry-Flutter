import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/components/checkbox/checkbox.dart';
import 'package:flutter_design_system/src/components/scaffold/app_scaffold.dart';
import 'package:flutter_design_system/src/components/text/app_text.dart';
import 'package:flutter_design_system/src/components/topbar/app_topbar.dart';
import 'package:flutter_design_system/src/tokens/app_colors.dart';
import 'package:flutter_design_system/src/tokens/app_spacing.dart';

class CheckboxScreen extends StatefulWidget {
  const CheckboxScreen({super.key});

  @override
  State<CheckboxScreen> createState() => _CheckboxScreenState();
}

class _CheckboxScreenState extends State<CheckboxScreen> {
  bool _isChecked1 = false;
  bool _isChecked2 = true;
  bool _agreeToTerms = false;
  bool _selected = false;
  bool _liked = false;
  bool _errorState = false;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const AppTopBar(title: 'Checkboxes'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16, vertical: AppSpacing.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              title: "Basic Checkbox",
              description: "A standard checkbox component without any labels.",
              children: [
                Row(
                  children: [
                    AppCheckbox(
                      value: _isChecked1,
                      onChanged: (next) => setState(() => _isChecked1 = next),
                    ),
                    const SizedBox(width: AppSpacing.s16),
                    AppCheckbox(
                      value: _isChecked2,
                      onChanged: (next) => setState(() => _isChecked2 = next),
                    ),
                    const SizedBox(width: AppSpacing.s16),
                    const AppCheckbox(
                      value: true,
                      enabled: false,
                    ),
                    const SizedBox(width: AppSpacing.s16),
                    const AppCheckbox(
                      value: false,
                      enabled: false,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              title: "Checkbox with Label",
              description: "A checkbox accompanied by a text label and an optional description.",
              children: [
                AppCheckbox(
                  value: _agreeToTerms,
                  label: const Text('Accept terms and conditions'),
                  description: const Text('You agree to our privacy policy and terms of service'),
                  onChanged: (v) => setState(() => _agreeToTerms = v),
                ),
                const SizedBox(height: 16),
                const AppCheckbox(
                  value: true,
                  enabled: false,
                  label: Text('Disabled checked'),
                  description: Text('This option cannot be changed'),
                ),
                const SizedBox(height: 16),
                const AppCheckbox(
                  value: false,
                  enabled: false,
                  label: Text('Disabled unchecked'),
                  description: Text('This option cannot be changed'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              title: "Error State",
              description: "A checkbox displaying an error state.",
              children: [
                AppCheckbox(
                  value: _errorState,
                  hasError: true,
                  label: const Text('I confirm the details'),
                  description: const Text('This field is required'),
                  onChanged: (v) => setState(() => _errorState = v),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              title: "Custom Icons (Circular)",
              description: "A checkbox using custom circular icons.",
              children: [
                AppCheckbox(
                  value: _selected,
                  label: const Text('Select this item'),
                  checkedIcon: const Icon(Icons.check_circle),
                  uncheckedIcon: const Icon(Icons.circle_outlined),
                  onChanged: (v) => setState(() => _selected = v),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              title: "Custom Icons (Toggle/Favorite)",
              description: "A checkbox customized to act like a toggle or favorite button.",
              children: [
                AppCheckbox(
                  value: _liked,
                  label: const Text('Favorite this post'),
                  checkedIcon: const Icon(Icons.favorite),
                  uncheckedIcon: const Icon(Icons.favorite_border),
                  colorOverride: AppColors.secondary500,
                  onChanged: (v) => setState(() => _liked = v),
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
        AppText.bodySmall(description, color: AppColors.neutral500),
        const SizedBox(height: 16),
        ...children,
      ],
    );
  }
}
