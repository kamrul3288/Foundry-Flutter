import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/components/button/app_filled_button.dart';
import 'package:flutter_design_system/src/components/scaffold/app_scaffold.dart';
import 'package:flutter_design_system/src/components/topbar/app_topbar.dart';
import 'package:flutter_design_system/src/components/text/app_text.dart';
import 'package:flutter_design_system/src/tokens/app_colors.dart';

class AppScaffoldScreen extends StatefulWidget {
  const AppScaffoldScreen({super.key});

  @override
  State<AppScaffoldScreen> createState() => _AppScaffoldScreenState();
}

class _AppScaffoldScreenState extends State<AppScaffoldScreen> {
  bool _isLoading = false;

  void _toggleLoading() {
    setState(() {
      _isLoading = true;
    });
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isLoading: _isLoading,
      appBar: const AppTopBar(
        title: 'Scaffold & TopBar',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              title: "Structure & Layout",
              description: "AppScaffold provides a consistent layout with SafeArea, status bar handling, and keyboard dismissal.",
              children: [
                const AppText.bodyMedium(
                  "It wraps the standard Scaffold and adds common behaviors like auto-unfocusing when tapping outside and a global loading overlay.",
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              title: "Top Bar",
              description: "AppTopBar is a customized AppBar that follows the design system's aesthetic.",
              children: [
                const AppText.bodyMedium(
                  "It supports titles, leading/trailing actions, and integrates seamlessly with the AppScaffold.",
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              title: "Loading State",
              description: "AppScaffold includes a built-in loading overlay that can be toggled via the 'isLoading' property.",
              children: [
                AppFilledButton.text(
                  "Trigger Loading Overlay (2s)",
                  onPressed: _toggleLoading,
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
