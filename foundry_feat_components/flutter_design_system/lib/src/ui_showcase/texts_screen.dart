import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/components/text/app_text.dart';

class TextsScreen extends StatelessWidget {
  const TextsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Texts'),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            AppText.h1('H1'),
            AppText.h2('H2'),
            AppText.h3('H3'),
            AppText.titleLarge('Title Large'),
            AppText.titleMedium('Title Medium'),
            AppText.titleSmall('Title Small'),
            AppText.bodyLarge('Body Large'),
            AppText.bodyMedium('Body Medium'),
            AppText.bodySmall('Body Small'),
            AppText.caption('Caption'),
            AppText.captionSmall('Caption Small'),
          ],
        ),
      ),
    );
  }
}
