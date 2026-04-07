import 'package:flutter/material.dart';
import '../components/tag/app_tag.dart';
import '../components/text/app_text.dart';
import '../theme/extensions/app_tag_theme.dart';

class TagsScreen extends StatelessWidget {
  const TagsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tags"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Row(
              spacing: 10,
              children: [
                AppTag(
                  variant: AppTagVariant.filled,
                  shape: AppTagShape.rounded,
                  leading: const Icon(Icons.check, size: 16),
                  child: AppText.bodySmall("10% Off", inheritColor: true),
                ),
                AppTag(
                  variant: AppTagVariant.outline,
                  shape: AppTagShape.rounded,
                  leading: const Icon(Icons.check, size: 16),
                  child: AppText.bodySmall("10% Off", inheritColor: true),
                ),

                AppTag(
                  variant: AppTagVariant.filledOutline,
                  shape: AppTagShape.rounded,
                  leading: const Icon(Icons.check, size: 16),
                  child: AppText.bodySmall("10% Off", inheritColor: true),
                ),
              ],
            ),

            Row(
              spacing: 10,
              children: [
                AppTag(
                  variant: AppTagVariant.filled,
                  shape: AppTagShape.rounded,
                  leading: const Icon(Icons.chair, size: 16),
                  colorRole: AppTagColorRole.neutral,
                  child: AppText.bodySmall("4 seat", inheritColor: true),
                ),

                AppTag(
                  variant: AppTagVariant.outline,
                  shape: AppTagShape.rounded,
                  leading: const Icon(Icons.ac_unit, size: 16),
                  colorRole: AppTagColorRole.neutral,
                  child: AppText.bodySmall("AC", inheritColor: true),
                ),

                AppTag(
                  variant: AppTagVariant.filledOutline,
                  shape: AppTagShape.rounded,
                  leading: const Icon(Icons.check, size: 16),
                  colorRole: AppTagColorRole.neutral,
                  child: AppText.bodySmall("10% Off", inheritColor: true),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
