import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/components/radio/radio.dart';
import 'package:flutter_design_system/src/components/text/app_text.dart';
import 'package:flutter_design_system/src/components/text/app_text_weight.dart';

class AppRadioGhostGroup<T> extends StatelessWidget {
  final List<AppRadioOption<T>> options;
  final T? value;
  final ValueChanged<T>? onChanged;
  final bool enabled;
  final AppRadioIntent intent;
  final double spacing;
  final double borderRadius;
  final EdgeInsetsGeometry itemPadding;

  const AppRadioGhostGroup({
    super.key,
    required this.options,
    required this.value,
    required this.onChanged,
    this.enabled = true,
    this.intent = AppRadioIntent.brand,
    this.spacing = 4,
    this.borderRadius = 8,
    this.itemPadding = const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppRadioGhostTheme>()!;
    final stateSet = theme.byIntent(intent);

    return Semantics(
      label: 'Radio button group',
      child: Wrap(
        spacing: spacing,
        runSpacing: spacing,
        children: options.map((option) {
          final isSelected = option.value == value;
          final isDisabled = !enabled || !option.enabled || onChanged == null;
          final colors = stateSet.resolve(
            isSelected: isSelected,
            isDisabled: isDisabled,
          );

          return _GhostItem(
            colors: colors,
            isSelected: isSelected,
            isDisabled: isDisabled,
            borderRadius: borderRadius,
            padding: itemPadding,
            onTap: isDisabled ? null : () => onChanged?.call(option.value),
            icon: option.icon,
            label: option.label,
          );
        }).toList(),
      ),
    );
  }
}

class _GhostItem extends StatelessWidget {
  final AppRadioBtnColors colors;
  final bool isSelected;
  final bool isDisabled;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;
  final Widget? icon;
  final String label;

  const _GhostItem({
    required this.colors,
    required this.isSelected,
    required this.isDisabled,
    required this.borderRadius,
    required this.padding,
    required this.onTap,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      inMutuallyExclusiveGroup: true,
      checked: isSelected,
      enabled: !isDisabled,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeOut,
          padding: padding,
          decoration: BoxDecoration(
            color: colors.background,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                IconTheme.merge(
                  data: IconThemeData(color: colors.foreground, size: 16),
                  child: icon!,
                ),
                const SizedBox(width: 6),
              ],
              AppText.bodyMedium(
                label,
                color: colors.foreground,
                textWeight: isSelected ? AppTextWeight.semiBold : AppTextWeight.regular,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
