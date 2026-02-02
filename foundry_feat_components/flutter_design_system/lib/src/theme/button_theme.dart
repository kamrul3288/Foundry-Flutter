// ignore_for_file: library_private_types_in_public_api


// final class AppButtonColors {
//   final Color background;
//   final Color foreground;
//   final Color? border;
//   final Color? outlineForeground;

//   const AppButtonColors({
//     required this.background,
//     required this.foreground,
//     this.border,
//     this.outlineForeground,
//   });

//   factory AppButtonColors.init(Color bg, {Color foreground = Colors.white, Color? outlineForeground}) => AppButtonColors(
//     background: bg,
//     foreground: foreground,
//     outlineForeground: outlineForeground,
//   );
// }

// sealed class ButtonColorRole {
//   const ButtonColorRole();

//   const factory ButtonColorRole.primary() = _ButtonColorRolePrimary._;
//   const factory ButtonColorRole.custom(AppButtonColors color) = _ButtonColorRoleCustom._;
// }

// final class _ButtonColorRolePrimary extends ButtonColorRole {
//   const _ButtonColorRolePrimary._();
// }

// final class _ButtonColorRoleCustom extends ButtonColorRole {
//   final AppButtonColors color;
//   const _ButtonColorRoleCustom._(this.color);
// }

// final class AppButtonTheme extends ThemeExtension<AppButtonTheme> {
//   final AppButtonColors primary;

//   const AppButtonTheme({required this.primary});

//   factory AppButtonTheme.light() => AppButtonTheme(
//     primary: AppButtonColors.init(AppPrimitivesColor.orange500),
//   );

//   factory AppButtonTheme.dark() => AppButtonTheme.light();

//   @override
//   ThemeExtension<AppButtonTheme> copyWith() => this;

//   @override
//   ThemeExtension<AppButtonTheme> lerp(covariant ThemeExtension<AppButtonTheme>? other, double t) => this;

//   AppButtonColors resolve(ButtonColorRole role) {
//     return switch (role) {
//       _ButtonColorRolePrimary() => primary,
//       _ButtonColorRoleCustom(color: final color) => color,
//     };
//   }
// }

// enum AppButtonSize { sm, md, lg }

// enum ButtonShape { rounded, pill, circle, sharp }

// enum _ButtonVariant { filled, outline, text, icon }

// final class AppButton extends StatelessWidget {
//   final Widget child;
//   final AppButtonSize size;
//   final VoidCallback? onPressed;
//   final bool isLoading;
//   final Widget? leading;
//   final Widget? trailing;
//   final ButtonColorRole colorRole;
//   final bool isFullWidth;
//   final _ButtonVariant variant;
//   final ButtonShape shape;
//   final bool enableColorFilter;
//   final EdgeInsetsGeometry? padding;
//   final bool isWrapContent;

//   const AppButton._({
//     required this.child,
//     this.size = AppButtonSize.md,
//     this.onPressed,
//     this.isLoading = false,
//     this.leading,
//     this.trailing,
//     required this.colorRole,
//     this.isFullWidth = true,
//     required this.variant,
//     this.shape = ButtonShape.sharp,
//     this.enableColorFilter = false,
//     this.padding,
//     this.isWrapContent = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).extension<AppButtonTheme>()!;
//     final baseColors = theme.resolve(colorRole);
//     final colors = _mapColorsToVariant(baseColors, variant);

//     // Resolve Dimensions
//     final double height = switch (size) {
//       AppButtonSize.sm => 32.0,
//       AppButtonSize.md => 48.0,
//       AppButtonSize.lg => 56.0,
//     };

//     final double iconSize = switch (size) {
//       AppButtonSize.sm => 16.0,
//       AppButtonSize.md => 20.0,
//       AppButtonSize.lg => 24.0,
//     };

//     final TextStyle textStyle = switch (size) {
//       AppButtonSize.sm => const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
//       AppButtonSize.md => const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
//       AppButtonSize.lg => const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//     };

//     return SizedBox(
//       height: isWrapContent ? null : height,
//       width: isFullWidth ? double.infinity : null,
//       child: ElevatedButton(
//         onPressed: isLoading ? null : onPressed,
//         style: ElevatedButton.styleFrom(
//           elevation: 0,
//           backgroundColor: colors.background,
//           foregroundColor: colors.foreground,
//           disabledBackgroundColor: _resolveDisableBackgroundColor(colors),
//           side: colors.border != null ? BorderSide(color: _resolveBorderColor(colors)) : null,
//           overlayColor: _resolveOverlayColor(colors),
//           shadowColor: Colors.transparent,
//           shape: _resolveShape(),
//           padding: padding,
//           tapTargetSize: isWrapContent ? MaterialTapTargetSize.shrinkWrap : null,
//           minimumSize: isWrapContent ? Size.zero : null,
//         ),
//         child: _buildChild(colors, iconSize, textStyle),
//       ),
//     );
//   }

//   AppButtonColors _mapColorsToVariant(AppButtonColors base, _ButtonVariant variant) {
//     return switch (variant) {
//       _ButtonVariant.filled => base,
//       _ButtonVariant.outline => AppButtonColors(
//         background: Colors.transparent,
//         foreground: base.outlineForeground ?? base.background,
//         border: base.border ?? base.background,
//       ),
//       _ButtonVariant.icon || _ButtonVariant.text => AppButtonColors(
//         background: Colors.transparent,
//         foreground: base.background,
//         border: null,
//       ),
//     };
//   }

//   OutlinedBorder? _resolveShape() {
//     return switch (shape) {
//       ButtonShape.rounded => RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(5),
//       ),
//       ButtonShape.pill => const StadiumBorder(),
//       ButtonShape.circle => const CircleBorder(),
//       ButtonShape.sharp => RoundedRectangleBorder(borderRadius: BorderRadius.zero),
//     };
//   }

//   Color _resolveDisableBackgroundColor(AppButtonColors color) {
//     if (variant == _ButtonVariant.filled) {
//       return color.background.withValues(alpha: 0.2);
//     }
//     return Colors.transparent;
//   }

//   Color _resolveBorderColor(AppButtonColors color) {
//     if (variant == _ButtonVariant.outline) {
//       return onPressed == null ? color.border!.withValues(alpha: 0.2) : color.border!;
//     }
//     return Colors.transparent;
//   }

//   Color? _resolveOverlayColor(AppButtonColors color) {
//     if (variant == _ButtonVariant.filled) {
//       return null;
//     }
//     return color.foreground.withValues(alpha: 0.2);
//   }

//   Widget _buildChild(AppButtonColors color, double iconSize, TextStyle textStyle) {
//     if (isLoading) {
//       return SizedBox(
//         height: iconSize,
//         width: iconSize,
//         child: CircularProgressIndicator(strokeWidth: 2, color: color.foreground),
//       );
//     }

//     final content = Row(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         if (leading != null) ...[leading!, const SizedBox(width: 8)],
//         Flexible(child: child),
//         if (trailing != null) ...[const SizedBox(width: 8), trailing!],
//       ],
//     );

//     final isEnabled = onPressed != null;
//     final effectiveColor = isEnabled ? color.foreground : Colors.grey.shade500;
//     if (enableColorFilter) {
//       return ColorFiltered(
//         colorFilter: ColorFilter.mode(effectiveColor, BlendMode.srcIn),
//         child: DefaultTextStyle(
//           style: textStyle.copyWith(color: effectiveColor),
//           child: content,
//         ),
//       );
//     }
//     return Opacity(
//       opacity: isEnabled ? 1 : 0.5,
//       child: DefaultTextStyle(
//         style: textStyle.copyWith(color: effectiveColor),
//         child: content,
//       ),
//     );
//   }

//   factory AppButton.filled(
//     Widget child, {
//     required VoidCallback? onPressed,
//     bool isLoading = false,
//     Widget? leading,
//     Widget? trailing,
//     ButtonColorRole colorRole = const ButtonColorRole.primary(),
//     bool isFullWidth = true,
//     AppButtonSize size = AppButtonSize.md,
//     ButtonShape shape = ButtonShape.rounded,
//     bool enableColorFilter = true,
//     EdgeInsetsGeometry? padding,
//   }) {
//     return AppButton._(
//       onPressed: onPressed,
//       isLoading: isLoading,
//       leading: leading,
//       trailing: trailing,
//       variant: _ButtonVariant.filled,
//       colorRole: colorRole,
//       isFullWidth: isFullWidth,
//       size: size,
//       shape: shape,
//       enableColorFilter: enableColorFilter,
//       padding: padding,
//       child: child,
//     );
//   }

//   factory AppButton.outline(
//     Widget child, {
//     required VoidCallback? onPressed,
//     bool isLoading = false,
//     Widget? leading,
//     Widget? trailing,
//     ButtonColorRole colorRole = const ButtonColorRole.primary(),
//     bool isFullWidth = true,
//     AppButtonSize size = AppButtonSize.md,
//     ButtonShape shape = ButtonShape.rounded,
//     bool enableColorFilter = true,
//     EdgeInsetsGeometry? padding,
//   }) {
//     return AppButton._(
//       onPressed: onPressed,
//       isLoading: isLoading,
//       leading: leading,
//       trailing: trailing,
//       variant: _ButtonVariant.outline,
//       colorRole: colorRole,
//       isFullWidth: isFullWidth,
//       size: size,
//       shape: shape,
//       enableColorFilter: enableColorFilter,
//       padding: padding,
//       child: child,
//     );
//   }

//   factory AppButton.text(
//     String text, {
//     required VoidCallback? onPressed,
//     bool isLoading = false,
//     ButtonColorRole colorRole = const ButtonColorRole.primary(),
//     AppButtonSize size = AppButtonSize.md,
//     EdgeInsetsGeometry? padding = EdgeInsets.zero,
//   }) {
//     return AppButton._(
//       onPressed: onPressed,
//       isLoading: isLoading,
//       variant: _ButtonVariant.text,
//       colorRole: colorRole,
//       size: size,
//       shape: ButtonShape.pill,
//       isFullWidth: false,
//       isWrapContent: true,
//       padding: padding,
//       child: Text(text),
//     );
//   }

//   factory AppButton.icon(
//     Widget icon, {
//     required VoidCallback? onPressed,
//     bool isLoading = false,
//     ButtonColorRole colorRole = const ButtonColorRole.primary(),
//     AppButtonSize size = AppButtonSize.md,
//     bool enableColorFilter = true,
//   }) {
//     return AppButton._(
//       onPressed: onPressed,
//       isLoading: isLoading,
//       variant: _ButtonVariant.icon,
//       colorRole: colorRole,
//       size: size,
//       shape: ButtonShape.circle,
//       enableColorFilter: enableColorFilter,
//       isFullWidth: false,
//       isWrapContent: true,
//       padding: EdgeInsets.zero,
//       child: icon,
//     );
//   }
// }

// final class AppButtonColors {
//   final Color background;
//   final Color foreground;
//   final Color? border;

//   const AppButtonColors({
//     required this.background,
//     required this.foreground,
//     this.border,
//   });

//   factory AppButtonColors.filled(Color bg, {required Color foreground, Color? border}) => AppButtonColors(
//     background: bg,
//     foreground: foreground,
//     border: border,
//   );

//   factory AppButtonColors.outline(Color borderColor, {required Color foreground}) => AppButtonColors(
//     background: Colors.transparent,
//     foreground: foreground,
//     border: borderColor,
//   );

//   factory AppButtonColors.ghost({required Color foreground}) => AppButtonColors(
//     background: Colors.transparent,
//     border: Colors.transparent,
//     foreground: foreground,
//   );
// }

// final class AppButtonTheme extends ThemeExtension<AppButtonTheme> {
//   final AppButtonColors primaryFilled;
//   final AppButtonColors primaryOutline;
//   final AppButtonColors primaryGhost;

//   const AppButtonTheme({
//     required this.primaryFilled,
//     required this.primaryOutline,
//     required this.primaryGhost,
//   });

//   factory AppButtonTheme.light() => AppButtonTheme(
//     primaryFilled: AppButtonColors.filled(AppPrimitivesColor.orange500, foreground: Colors.white),
//     primaryOutline: AppButtonColors.outline(AppPrimitivesColor.orange500, foreground: AppPrimitivesColor.orange500),
//     primaryGhost: AppButtonColors.ghost(foreground: AppPrimitivesColor.orange500),
//   );

//   factory AppButtonTheme.dark() => AppButtonTheme.light();

//   @override
//   ThemeExtension<AppButtonTheme> copyWith() => this;

//   @override
//   ThemeExtension<AppButtonTheme> lerp(covariant ThemeExtension<AppButtonTheme>? other, double t) => this;

//   AppButtonColors resolve(ButtonColorRole role) {
//     return switch (role) {
//       ButtonColorPrimaryFilled() => primaryFilled,
//       ButtonColorPrimaryOutline() => primaryOutline,
//       ButtonColorPrimaryGhost() => primaryGhost,
//       ButtonColorCustom(color: final color) => color,
//     };
//   }
// }

// sealed class ButtonColorRole {
//   const ButtonColorRole();

//   const factory ButtonColorRole.primaryFilled() = ButtonColorPrimaryFilled._;
//   const factory ButtonColorRole.primaryOutline() = ButtonColorPrimaryOutline._;
//   const factory ButtonColorRole.primaryGhost() = ButtonColorPrimaryGhost._;
//   const factory ButtonColorRole.custom(AppButtonColors color) = ButtonColorCustom._;
// }

// final class ButtonColorPrimaryFilled extends ButtonColorRole {
//   const ButtonColorPrimaryFilled._();
// }

// final class ButtonColorPrimaryOutline extends ButtonColorRole {
//   const ButtonColorPrimaryOutline._();
// }

// final class ButtonColorPrimaryGhost extends ButtonColorRole {
//   const ButtonColorPrimaryGhost._();
// }

// final class ButtonColorCustom extends ButtonColorRole {
//   final AppButtonColors color;
//   const ButtonColorCustom._(this.color);
// }

// enum AppButtonSize { sm, md, lg }

// enum ButtonShape { rounded, pill, circle, sharp }

// enum _ButtonVariant { filled, outline, text, icon }

// final class AppButton extends StatelessWidget {
//   final Widget child;
//   final AppButtonSize size;
//   final VoidCallback? onPressed;
//   final bool isLoading;
//   final Widget? leading;
//   final Widget? trailing;
//   final ButtonColorRole colorRole;
//   final bool isFullWidth;
//   final _ButtonVariant variant;
//   final ButtonShape shape;
//   final bool enableColorFilter;
//   final EdgeInsetsGeometry? padding;
//   final bool isWrapContent;

//   const AppButton._({
//     required this.child,
//     this.size = AppButtonSize.md,
//     this.onPressed,
//     this.isLoading = false,
//     this.leading,
//     this.trailing,
//     required this.colorRole,
//     this.isFullWidth = true,
//     required this.variant,
//     this.shape = ButtonShape.sharp,
//     this.enableColorFilter = false,
//     this.padding,
//     this.isWrapContent = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).extension<AppButtonTheme>()!;
//     final colors = theme.resolve(colorRole);

//     // Resolve Dimensions
//     final double height = switch (size) {
//       AppButtonSize.sm => 32.0,
//       AppButtonSize.md => 48.0,
//       AppButtonSize.lg => 56.0,
//     };

//     final double iconSize = switch (size) {
//       AppButtonSize.sm => 16.0,
//       AppButtonSize.md => 20.0,
//       AppButtonSize.lg => 24.0,
//     };

//     final TextStyle textStyle = switch (size) {
//       AppButtonSize.sm => const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
//       AppButtonSize.md => const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
//       AppButtonSize.lg => const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//     };

//     return SizedBox(
//       height: isWrapContent ? null : height,
//       width: isFullWidth ? double.infinity : null,
//       child: ElevatedButton(
//         onPressed: isLoading ? null : onPressed,
//         style: ElevatedButton.styleFrom(
//           elevation: 0,
//           backgroundColor: colors.background,
//           foregroundColor: colors.foreground,
//           disabledBackgroundColor: _resolveDisableBackgroundColor(colors),
//           side: colors.border != null ? BorderSide(color: _resolveBorderColor(colors)) : null,
//           overlayColor: _resolveOverlayColor(colors),
//           shadowColor: Colors.transparent,
//           shape: _resolveShape(),
//           padding: padding,
//           tapTargetSize: isWrapContent ? MaterialTapTargetSize.shrinkWrap : null,
//           minimumSize: isWrapContent ? Size.zero : null,
//         ),
//         child: _buildChild(colors, iconSize, textStyle),
//       ),
//     );
//   }

//   OutlinedBorder? _resolveShape() {
//     return switch (shape) {
//       ButtonShape.rounded => RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(5),
//       ),
//       ButtonShape.pill => const StadiumBorder(),
//       ButtonShape.circle => const CircleBorder(),
//       ButtonShape.sharp => RoundedRectangleBorder(borderRadius: BorderRadius.zero),
//     };
//   }

//   Color _resolveDisableBackgroundColor(AppButtonColors color) {
//     if (variant == _ButtonVariant.filled) {
//       return color.background.withValues(alpha: 0.5);
//     }
//     return Colors.transparent;
//   }

//   Color _resolveBorderColor(AppButtonColors color) {
//     if (variant == _ButtonVariant.outline) {
//       return onPressed == null ? color.border!.withValues(alpha: 0.5) : color.border!;
//     }
//     return Colors.transparent;
//   }

//   Color? _resolveOverlayColor(AppButtonColors color) {
//     if (variant == _ButtonVariant.filled) {
//       return null;
//     }
//     return color.foreground.withValues(alpha: 0.2);
//   }

//   Widget _buildChild(AppButtonColors color, double iconSize, TextStyle textStyle) {
//     if (isLoading) {
//       return SizedBox(
//         height: iconSize,
//         width: iconSize,
//         child: CircularProgressIndicator(strokeWidth: 2, color: color.foreground),
//       );
//     }

//     final content = Row(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         if (leading != null) ...[leading!, const SizedBox(width: 8)],
//         Flexible(child: child),
//         if (trailing != null) ...[const SizedBox(width: 8), trailing!],
//       ],
//     );

//     final isEnabled = onPressed != null;
//     final effectiveColor = isEnabled ? color.foreground : Colors.grey.shade400;
//     if (enableColorFilter) {
//       return ColorFiltered(
//         colorFilter: ColorFilter.mode(effectiveColor, BlendMode.srcIn),
//         child: DefaultTextStyle(
//           style: textStyle.copyWith(color: effectiveColor),
//           child: content,
//         ),
//       );
//     }
//     return DefaultTextStyle(
//       style: textStyle.copyWith(color: effectiveColor),
//       child: content,
//     );
//   }

//   factory AppButton.filled(
//     Widget child, {
//     required VoidCallback? onPressed,
//     bool isLoading = false,
//     Widget? leading,
//     Widget? trailing,
//     ButtonColorRole colorRole = const ButtonColorRole.primaryFilled(),
//     bool isFullWidth = true,
//     AppButtonSize size = AppButtonSize.md,
//     ButtonShape shape = ButtonShape.rounded,
//     bool enableColorFilter = false,
//     EdgeInsetsGeometry? padding,
//   }) {
//     return AppButton._(
//       onPressed: onPressed,
//       isLoading: isLoading,
//       leading: leading,
//       trailing: trailing,
//       variant: _ButtonVariant.filled,
//       colorRole: colorRole,
//       isFullWidth: isFullWidth,
//       size: size,
//       shape: shape,
//       enableColorFilter: enableColorFilter,
//       padding: padding,
//       child: child,
//     );
//   }

//   factory AppButton.outline(
//     Widget child, {
//     required VoidCallback? onPressed,
//     bool isLoading = false,
//     Widget? leading,
//     Widget? trailing,
//     ButtonColorRole colorRole = const ButtonColorRole.primaryOutline(),
//     bool isFullWidth = true,
//     AppButtonSize size = AppButtonSize.md,
//     ButtonShape shape = ButtonShape.rounded,
//     bool enableColorFilter = false,
//     EdgeInsetsGeometry? padding,
//   }) {
//     return AppButton._(
//       onPressed: onPressed,
//       isLoading: isLoading,
//       leading: leading,
//       trailing: trailing,
//       variant: _ButtonVariant.outline,
//       colorRole: colorRole,
//       isFullWidth: isFullWidth,
//       size: size,
//       shape: shape,
//       enableColorFilter: enableColorFilter,
//       padding: padding,
//       child: child,
//     );
//   }

//   factory AppButton.text(
//     String text, {
//     required VoidCallback? onPressed,
//     bool isLoading = false,
//     ButtonColorRole colorRole = const ButtonColorRole.primaryGhost(),
//     AppButtonSize size = AppButtonSize.md,
//     EdgeInsetsGeometry? padding = EdgeInsets.zero,
//   }) {
//     return AppButton._(
//       onPressed: onPressed,
//       isLoading: isLoading,
//       variant: _ButtonVariant.text,
//       colorRole: colorRole,
//       size: size,
//       shape: ButtonShape.pill,
//       isFullWidth: false,
//       isWrapContent: true,
//       padding: padding,
//       child: Text(text),
//     );
//   }

//   factory AppButton.icon(
//     Widget icon, {
//     required VoidCallback? onPressed,
//     bool isLoading = false,
//     ButtonColorRole colorRole = const ButtonColorRole.primaryGhost(),
//     AppButtonSize size = AppButtonSize.md,
//     bool enableColorFilter = true,
//   }) {
//     return AppButton._(
//       onPressed: onPressed,
//       isLoading: isLoading,
//       variant: _ButtonVariant.icon,
//       colorRole: colorRole,
//       size: size,
//       shape: ButtonShape.circle,
//       enableColorFilter: enableColorFilter,
//       isFullWidth: false,
//       isWrapContent: true,
//       padding: EdgeInsets.zero,
//       child: icon,
//     );
//   }
// }

// final class _AppButtonFilled extends AppButton {
//   const _AppButtonFilled(
//     Widget child, {
//     required super.onPressed,
//     super.isLoading,
//     super.leading,
//     super.trailing,
//     super.colorRole = const ButtonColorRole.primaryFilled(),
//     super.isFullWidth,
//     super.shape = const ButtonShape.rounded(),
//     super.varient = _ButtonVarient.filled,
//     super.size,
//     super.enableColorFilter,
//     super.padding,
//     super.isWrapContent,
//   }) : super._(child: child);
// }

// final class _AppButtonOutline extends AppButton {
//   const _AppButtonOutline(
//     Widget child, {
//     super.enableColorFilter,
//     super.shape = const ButtonShape.rounded(),
//     super.varient = _ButtonVarient.outline,
//     super.size = AppButtonSize.md,
//     super.isFullWidth,
//     required super.onPressed,
//     super.isLoading,
//     super.leading,
//     super.trailing,
//     super.colorRole = const ButtonColorRole.primaryOutline(),
//     super.padding,
//     super.isWrapContent,
//   }) : super._(child: child);
// }

// final class _AppButtonText extends AppButton {
//   _AppButtonText(
//     String text, {
//     super.varient = _ButtonVarient.text,
//     super.size = AppButtonSize.md,
//     required super.onPressed,
//     super.isLoading,
//     super.colorRole = const ButtonColorRole.primaryGhost(),
//     super.padding = const EdgeInsets.all(4),
//     super.isWrapContent = true,
//     super.isFullWidth = false,
//   }) : super._(child: Text(text));
// }

// final class _AppButtonIcon extends AppButton {
//   const _AppButtonIcon(
//     Widget icon, {
//     super.enableColorFilter = true,
//     super.varient = _ButtonVarient.icon,
//     super.size = AppButtonSize.md,
//     required super.onPressed,
//     super.isLoading,
//     super.colorRole = const ButtonColorRole.primaryGhost(),
//     super.padding = const EdgeInsets.all(4),
//     super.isFullWidth = false,
//     super.isWrapContent = true,
//   }) : super._(child: icon);
// }

// sealed class ButtonShape {
//   const ButtonShape();
//   const factory ButtonShape.rounded({double radius}) = ButtonShapeRounded._;
//   const factory ButtonShape.pill() = ButtonShapePill._;
//   const factory ButtonShape.circle() = ButtonShapeCircle._;
//   const factory ButtonShape.none() = ButtonShapeNone._;
// }

// final class ButtonShapeRounded extends ButtonShape {
//   final double radius;
//   const ButtonShapeRounded._({this.radius = 5});
// }

// final class ButtonShapePill extends ButtonShape {
//   const ButtonShapePill._();
// }

// final class ButtonShapeCircle extends ButtonShape {
//   const ButtonShapeCircle._();
// }

// final class ButtonShapeNone extends ButtonShape {
//   const ButtonShapeNone._();
// }


//but so many params Factory params and factory constructor params. Is there any way to reduce?