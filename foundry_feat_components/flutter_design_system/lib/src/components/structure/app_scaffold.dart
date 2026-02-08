import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_design_system/src/components/structure/app_topbar.dart';
import 'package:flutter_design_system/src/theme/extensions/app_scaffold_theme.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final AppTopBar? appBar;

  // Layout Props
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final bool extendBodyBehindAppBar;

  // Behavior Props
  final bool resizeToAvoidBottomInset;
  final bool safeAreaTop;
  final bool safeAreaBottom;
  final EdgeInsetsGeometry? padding;

  // State Props
  final bool isLoading;

  const AppScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.extendBodyBehindAppBar = false,
    this.resizeToAvoidBottomInset = true,
    this.safeAreaTop = true,
    this.safeAreaBottom = true,
    this.padding,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppScaffoldTheme>()!;

    // 1. Status Bar Logic (Dynamic based on theme)
    // If background is light, icons should be dark, and vice-versa.
    final SystemUiOverlayStyle overlayStyle = theme.backgroundColor.computeLuminance() > 0.5 ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: overlayStyle,
      child: GestureDetector(
        // 2. Auto-dismiss Keyboard on tap outside
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Stack(
          children: [
            Scaffold(
              backgroundColor: theme.backgroundColor,
              appBar: appBar,
              body: SafeArea(
                top: safeAreaTop,
                bottom: safeAreaBottom,
                child: Padding(
                  padding: padding ?? EdgeInsets.zero,
                  child: body,
                ),
              ),
              floatingActionButton: floatingActionButton,
              bottomNavigationBar: bottomNavigationBar,
              bottomSheet: bottomSheet,
              extendBodyBehindAppBar: extendBodyBehindAppBar,
              resizeToAvoidBottomInset: resizeToAvoidBottomInset,
            ),

            // 3. Global Loading Overlay
            if (isLoading)
              Container(
                color: Colors.black.withValues(alpha: 0.3),
                child: const Center(child: CircularProgressIndicator.adaptive()),
              ),
          ],
        ),
      ),
    );
  }
}
