import 'package:flutter/material.dart';
import '../text/app_text.dart';
import '../../theme/extensions/app_scaffold_theme.dart';

class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? titleWidget;
  final List<Widget>? actions;
  final Widget? leading;
  final bool showBackButton;
  final bool centerTitle;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? elevation;
  final VoidCallback? onBackPressed;

  const AppTopBar({
    super.key,
    this.title,
    this.titleWidget,
    this.actions,
    this.leading,
    this.showBackButton = true,
    this.centerTitle = true,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppScaffoldTheme>()!;
    final resolvedBackgroundColor = backgroundColor ?? theme.appBarBackgroundColor;
    final resolvedForegroundColor = foregroundColor ?? theme.foregroundColor;
    final resolvedElevation = elevation ?? theme.elevation;

    return AppBar(
      backgroundColor: resolvedBackgroundColor,
      foregroundColor: resolvedForegroundColor,
      elevation: resolvedElevation,
      title: _buildTitle(resolvedForegroundColor),
      leading: _buildLeading(context, resolvedForegroundColor),
      actions: actions?.map((e) => Padding(padding: EdgeInsets.only(right: 16), child: e)).toList(),
      centerTitle: centerTitle,
    );
  }

  Widget? _buildTitle(Color foregroundColor) {
    if (titleWidget != null) {
      return titleWidget!;
    }
    if (title != null) {
      return AppText.titleMedium(title!, color: foregroundColor);
    }
    return null;
  }

  Widget? _buildLeading(BuildContext context, Color foregroundColor) {
    if (leading != null) {
      return leading!;
    }
    if (showBackButton && Navigator.canPop(context)) {
      return IconButton(
        icon: Icon(Icons.arrow_back_ios_new, size: 20, color: foregroundColor),
        onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
        tooltip: 'Back',
      );
    }
    return null;
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
