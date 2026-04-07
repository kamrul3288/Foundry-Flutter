import 'package:flutter/material.dart';
import 'app_button_color_role.dart';
import 'app_button_core.dart';
import 'app_button_types.dart';

class AppTextButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final EdgeInsetsGeometry? padding;
  final AppTextButtonStyle style;

  const AppTextButton(
    this.label, {
    super.key,
    required this.onPressed,
    this.isLoading = false,
    this.padding = const EdgeInsets.all(4),
    this.style = const AppTextButtonStyle(),
  });

  @override
  Widget build(BuildContext context) {
    return AppButtonCore(
      variant: AppButtonVariant.text,
      onPressed: onPressed,
      isLoading: isLoading,
      leading: style.leading,
      trailing: style.trailing,
      colorRole: style.colorRole,
      shape: AppButtonShape.pill,
      padding: padding,
      shrinkWrap: true,
      child: Text(label),
    );
  }
}

final class AppTextButtonStyle {
  final AppButtonColorRole colorRole;
  final Widget? leading;
  final Widget? trailing;

  const AppTextButtonStyle({
    this.leading,
    this.trailing,
    this.colorRole = const AppButtonColorRole.primary(),
  });

  AppTextButtonStyle copyWith({
    AppButtonColorRole? colorRole,
    Widget? leading,
    Widget? trailing,
  }) {
    return AppTextButtonStyle(
      colorRole: colorRole ?? this.colorRole,
      leading: leading ?? this.leading,
      trailing: trailing ?? this.trailing,
    );
  }
}
