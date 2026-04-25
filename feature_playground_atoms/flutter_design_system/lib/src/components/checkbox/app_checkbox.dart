import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/components/checkbox/checkbox.dart';

class AppCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final bool enabled;
  final bool hasError;
  final Widget? label;
  final Widget? description;
  final Widget checkedIcon;
  final Widget uncheckedIcon;
  final double size;
  final Duration animationDuration;
  final Color? colorOverride;

  const AppCheckbox({
    super.key,
    required this.value,
    this.onChanged,
    this.enabled = true,
    this.hasError = false,
    this.label,
    this.description,
    this.colorOverride,
    this.checkedIcon = const Icon(Icons.check_box_rounded),
    this.uncheckedIcon = const Icon(Icons.check_box_outline_blank_rounded),
    this.size = 24,
    this.animationDuration = const Duration(milliseconds: 200),
  });

  bool get _interactive => enabled && onChanged != null;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppCheckboxTheme>()!;
    final color = _resolveColor(theme.colors);

    final box = GestureDetector(
      onTap: _interactive ? () => onChanged!(!value) : null,
      behavior: HitTestBehavior.opaque,
      child: AnimatedSwitcher(
        duration: animationDuration,
        child: IconTheme.merge(
          key: ValueKey(value),
          data: IconThemeData(color: color, size: size),
          child: value ? checkedIcon : uncheckedIcon,
        ),
      ),
    );

    if (label == null && description == null) return box;

    return GestureDetector(
      onTap: _interactive ? () => onChanged!(!value) : null,
      behavior: HitTestBehavior.opaque,
      child: Row(
        crossAxisAlignment: description != null ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          box,
          const SizedBox(width: 8),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (label != null)
                  DefaultTextStyle.merge(
                    style: TextStyle(
                      color: enabled ? null : theme.colors.disabled,
                    ),
                    child: label!,
                  ),
                if (description != null) ...[
                  const SizedBox(height: 2),
                  DefaultTextStyle.merge(
                    style: TextStyle(
                      color: enabled ? theme.colors.unchecked : theme.colors.disabled,
                    ),
                    child: description!,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _resolveColor(AppCheckboxColors colors) {
    if (!enabled) return colors.disabled;
    if (hasError) return colors.error;
    if (colorOverride != null) return colorOverride!;
    return value ? colors.checked : colors.unchecked;
  }
}
