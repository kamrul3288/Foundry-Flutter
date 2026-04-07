import 'package:flutter/material.dart';
import '../components/cards/app_card.dart';
import '../components/text/app_text.dart';
import '../theme/app_color_scheme.dart';

class AppCardsScreen extends StatelessWidget {
  const AppCardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cards')),
      backgroundColor: Theme.of(context).extension<AppColorScheme>()?.brandPrimaryContainer,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          spacing: 16,
          children: [
            AppCard.rounded(
              child: AppText.bodyLarge("Filled Card"),
            ),

            AppCard.rounded(
              variant: AppCardVariant.outline,
              child: AppText.bodyLarge("Outline Card"),
            ),

            AppCard.rounded(
              variant: AppCardVariant.filledOutline,
              child: AppText.bodyLarge("Filled Outline Card"),
            ),

            AppCard.pill(
              variant: AppCardVariant.filled,
              child: AppText.bodyLarge("Pill Card"),
            ),

            AppCard.circle(
              variant: AppCardVariant.outline,
              size: 100,
              child: AppText.bodyLarge(
                "Circle Card",
                textAlign: TextAlign.center,
              ),
            ),

            AppCard.rounded(
              cornerMode: AppCardCornerMode.bottom,
              cornerRadius: AppCardCornerRadius.lg,
              height: 150,
              child: SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
