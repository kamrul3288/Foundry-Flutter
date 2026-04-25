import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/components/radio/radio.dart';
import 'package:flutter_design_system/src/components/scaffold/app_scaffold.dart';
import 'package:flutter_design_system/src/components/topbar/app_topbar.dart';
import 'package:flutter_design_system/src/components/text/app_text.dart';
import 'package:flutter_design_system/src/tokens/app_colors.dart';
import 'package:flutter_design_system/src/tokens/app_spacing.dart';

class RadioButtonScreen extends StatefulWidget {
  const RadioButtonScreen({super.key});

  @override
  State<RadioButtonScreen> createState() => _RadioButtonScreenState();
}

class _RadioButtonScreenState extends State<RadioButtonScreen> {
  String selectedPayment = 'card';
  String selectedSize = 'M';
  String activeFilter = 'all';
  String selectedShipping = 'standard';
  String selectedShipping2 = 'standard';
  String selectedGender = 'Male';

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const AppTopBar(title: 'Radio Buttons'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16, vertical: AppSpacing.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              title: "Outline Radio",
              description: "A radio group with an outlined border for options.",
              children: [
                AppRadioOutlineGroup<String>(
                  value: selectedPayment,
                  onChanged: (val) => setState(() => selectedPayment = val),
                  options: const [
                    AppRadioOption(value: 'card', label: 'Card', icon: Icon(Icons.credit_card)),
                    AppRadioOption(value: 'bank', label: 'Bank', icon: Icon(Icons.account_balance)),
                    AppRadioOption(value: 'paypal', label: 'PayPal'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              title: "Filled Radio",
              description: "A radio group with filled backgrounds for selected options.",
              children: [
                AppRadioFilledGroup<String>(
                  value: selectedSize,
                  onChanged: (val) => setState(() => selectedSize = val),
                  intent: AppRadioIntent.brand,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  options: [
                    AppRadioOption(value: 'S', label: 'S', icon: Icon(selectedSize == 'S' ? Icons.radio_button_checked : Icons.radio_button_unchecked)),
                    AppRadioOption(value: 'M', label: 'M', icon: Icon(selectedSize == 'M' ? Icons.radio_button_checked : Icons.radio_button_unchecked)),
                    AppRadioOption(value: 'L', label: 'L', icon: Icon(selectedSize == 'L' ? Icons.radio_button_checked : Icons.radio_button_unchecked)),
                    AppRadioOption(value: 'XL', label: 'XL', icon: Icon(selectedSize == 'XL' ? Icons.radio_button_checked : Icons.radio_button_unchecked)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              title: "Ghost Radio",
              description: "A subtle radio group with ghost styling.",
              children: [
                AppRadioGhostGroup<String>(
                  value: activeFilter,
                  onChanged: (val) => setState(() => activeFilter = val),
                  options: const [
                    AppRadioOption(value: 'all', label: 'All'),
                    AppRadioOption(value: 'active', label: 'Active'),
                    AppRadioOption(value: 'archived', label: 'Archived'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              title: "Card Radio",
              description: "Radio options displayed as horizontal cards with descriptions.",
              children: [
                AppRadioCardGroup<String>(
                  value: selectedShipping,
                  onChanged: (val) => setState(() => selectedShipping = val),
                  axis: AppRadioCardAxis.horizontal,
                  options: const [
                    AppRadioOption(
                      value: 'standard',
                      label: 'Standard',
                      description: '5–7 business days, free',
                      icon: Icon(Icons.local_shipping_outlined),
                    ),
                    AppRadioOption(
                      value: 'express',
                      label: 'Express',
                      description: '2–3 business days, \$9.99',
                      icon: Icon(Icons.flight_outlined),
                    ),
                    AppRadioOption(
                      value: 'overnight',
                      label: 'Overnight',
                      description: 'Next business day, \$24.99',
                      icon: Icon(Icons.bolt_outlined),
                      enabled: false,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              title: "Classic Radio (Vertical)",
              description: "The classic vertical radio group design.",
              children: [
                AppRadioClassicGroup<String>(
                  groupLabel: 'Shipping speed',
                  value: selectedShipping2,
                  onChanged: (val) => setState(() => selectedShipping2 = val),
                  intent: AppRadioIntent.brand,
                  options: const [
                    AppRadioOption(
                      value: 'standard',
                      label: 'Standard',
                      description: '5-7 business days',
                    ),
                    AppRadioOption(
                      value: 'express',
                      label: 'Express',
                      description: '2-3 business days',
                    ),
                    AppRadioOption(
                      value: 'overnight',
                      label: 'Overnight',
                      description: 'Next business day',
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              title: "Classic Radio (Horizontal)",
              description: "The classic radio group arranged horizontally.",
              children: [
                AppRadioClassicGroup<String>(
                  value: selectedGender,
                  onChanged: (val) => setState(() => selectedGender = val),
                  direction: Axis.horizontal,
                  options: const [
                    AppRadioOption(value: 'Male', label: 'Male'),
                    AppRadioOption(value: 'Female', label: 'Female'),
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
        AppText.bodySmall(description, color: AppColors.neutral500),
        const SizedBox(height: 16),
        ...children,
      ],
    );
  }
}
