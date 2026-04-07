import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/components/button/app_button_color_role.dart';
import 'package:flutter_design_system/src/components/button/app_button_core.dart';
import 'package:flutter_design_system/src/components/button/app_button_types.dart';

class AppIconButton extends StatelessWidget {
  final Widget icon;
  final AppButtonColorRole colorRole;
  final VoidCallback? onPressed;
  final bool isLoading;
  final EdgeInsetsGeometry padding;

  const AppIconButton(
    this.icon, {
    super.key,
    this.colorRole = const AppButtonColorRole.primary(),
    required this.onPressed,
    this.isLoading = false,
    this.padding = const EdgeInsets.all(4),
  });

  @override
  Widget build(BuildContext context) {
    return AppButtonCore(
      variant: AppButtonVariant.text,
      onPressed: onPressed,
      isLoading: isLoading,
      colorRole: colorRole,
      shape: AppButtonShape.pill,
      padding: padding,
      shrinkWrap: true,
      child: icon,
    );
  }
}
