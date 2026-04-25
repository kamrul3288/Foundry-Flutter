import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/components/radio/radio.dart';
import 'package:flutter_design_system/src/components/text/app_text.dart';
import 'package:flutter_design_system/src/components/text/app_text_weight.dart';

class AppRadioClassic<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final ValueChanged<T>? onChanged;
  final String? label;
  final String? description;
  final bool enabled;
  final AppRadioIntent intent;
  final IconData selectedIcon;
  final IconData unselectedIcon;
  final double indicatorSize;
  final double minTapTarget;

  const AppRadioClassic({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.label,
    this.description,
    this.enabled = true,
    this.intent = AppRadioIntent.brand,
    this.selectedIcon = Icons.radio_button_checked,
    this.unselectedIcon = Icons.radio_button_unchecked,
    this.indicatorSize = 20,
    this.minTapTarget = 40,
  });

  bool get _isSelected => value == groupValue;
  bool get _isDisabled => !enabled || onChanged == null;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppRadioClassicTheme>()!;
    final colors = theme.byIntent(intent).byState(isSelected: _isSelected, isDisabled: _isDisabled);

    return Semantics(
      inMutuallyExclusiveGroup: true,
      checked: _isSelected,
      enabled: !_isDisabled,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _isDisabled ? null : () => onChanged?.call(value),
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: minTapTarget),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                _isSelected ? selectedIcon : unselectedIcon,
                size: indicatorSize,
                color: colors.indicator,
              ),
              if (label != null || description != null) ...[
                const SizedBox(width: 10),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (label != null) ...[
                        AppText.bodyMedium(
                          label!,
                          color: colors.label,
                          textWeight: _isSelected ? AppTextWeight.medium : AppTextWeight.regular,
                        ),
                      ],
                      if (description != null) ...[
                        const SizedBox(height: 2),
                        AppText.captionLarge(
                          description!,
                          color: colors.description,
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
