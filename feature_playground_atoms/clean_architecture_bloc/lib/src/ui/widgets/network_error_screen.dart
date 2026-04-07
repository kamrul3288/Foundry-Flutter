import '../../locale/extensions/app_locale_extension.dart';
import 'package:flutter/material.dart';

class NetworkErrorScreen extends StatefulWidget {
  final String? title;
  final String? message;
  final VoidCallback? onRetry;

  const NetworkErrorScreen({super.key, this.title, this.message, this.onRetry});

  @override
  State<NetworkErrorScreen> createState() => _NetworkErrorScreenState();
}

class _NetworkErrorScreenState extends State<NetworkErrorScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _floatAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2))..repeat(reverse: true);
    _floatAnimation = Tween<double>(begin: -10, end: 10).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutSine));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(flex: 1),

              // ১. Animated Icon Hero
              _AnimatedIconHero(floatAnimation: _floatAnimation),

              const Spacer(flex: 1),

              // ২. Error Title
              StaggeredFadeSlide(
                delay: 0.0,
                duration: const Duration(milliseconds: 600),
                child: Text(
                  widget.title ?? context.l10n.title_connection_error,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: colorScheme.onSurface,
                  ),
                ),
              ),

              // ৩. Error Message (20% Delay)
              const SizedBox(height: 8),
              StaggeredFadeSlide(
                delay: 0.2,
                duration: const Duration(milliseconds: 600),
                child: Text(
                  widget.message ?? context.l10n.message_something_went_wrong,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
              ),

              const Spacer(flex: 2),

              // ৪. Retry Button (40% Delay)
              if (widget.onRetry != null) ...[
                StaggeredFadeSlide(
                  delay: 0.4,
                  duration: const Duration(milliseconds: 800),
                  child: ElevatedButton(
                    onPressed: widget.onRetry,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme.primary,
                      foregroundColor: colorScheme.onPrimary,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      elevation: 8,
                      shadowColor: colorScheme.primary.withValues(alpha: 0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      context.l10n.button_retry,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class StaggeredFadeSlide extends StatelessWidget {
  final Widget child;
  final double delay;
  final Duration duration;

  const StaggeredFadeSlide({
    super.key,
    required this.child,
    required this.delay,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    final double remainingTime = 1.0 - delay;

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: duration,
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        final adjustedValue = (value - delay).clamp(0.0, 1.0) * (1 / remainingTime);

        return Transform.translate(
          offset: Offset(0, 20 * (1 - adjustedValue)),
          child: Opacity(
            opacity: adjustedValue,
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}

class _AnimatedIconHero extends StatelessWidget {
  final Animation<double> floatAnimation;

  const _AnimatedIconHero({required this.floatAnimation});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeOutBack,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Opacity(
            opacity: value.clamp(0.0, 1.0),
            child: child,
          ),
        );
      },
      child: AnimatedBuilder(
        animation: floatAnimation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, floatAnimation.value),
            child: child,
          );
        },
        child: Center(
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorScheme.errorContainer.withValues(alpha: 0.5),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.error.withValues(alpha: 0.2),
                  blurRadius: 40,
                  spreadRadius: 10,
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 50,
                  right: 50,
                  child: Icon(
                    Icons.language_outlined,
                    size: 30,
                    color: colorScheme.error.withValues(alpha: 0.5),
                  ),
                ),
                Positioned(
                  bottom: 45,
                  left: 45,
                  child: Icon(
                    Icons.signal_wifi_bad_rounded,
                    size: 30,
                    color: colorScheme.error.withValues(alpha: 0.3),
                  ),
                ),
                Icon(
                  Icons.cloud_off_rounded,
                  size: 80,
                  color: colorScheme.error,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
