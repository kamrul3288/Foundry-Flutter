import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/components/button/app_button.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buttons')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            AppButton.filled(Text("Filled Rounded"), onPressed: () {}),
            AppButton.outline(Text("Outline Rounded"), onPressed: () {}),

            AppButton.filled(
              Text("Filled Pilled"),
              onPressed: () {},
              shape: AppButtonShape.pill,
            ),

            AppButton.outline(
              Text("Filled Circle"),
              onPressed: () {},
              shape: AppButtonShape.pill,
            ),

            AppButton.filled(
              Text("Filled Rounded"),
              onPressed: () {},
              isLoading: true,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppButton.filled(
                  Icon(Icons.add),
                  onPressed: () {},
                  isFullWidth: false,
                  shape: AppButtonShape.circle,
                ),
                AppButton.outline(
                  Icon(Icons.add),
                  onPressed: () {},
                  isFullWidth: false,
                  shape: AppButtonShape.circle,
                ),

                AppButton.text(
                  "Text Button",
                  onPressed: () {},
                ),

                AppButton.icon(
                  Icon(
                    Icons.check,
                    size: 32,
                  ),
                  onPressed: () {},
                ),
              ],
            ),

            AppButton.filled(
              Text("Filled Pilled"),
              onPressed: () {},
              shape: AppButtonShape.pill,
              leading: Icon(Icons.check),
            ),
          ],
        ),
      ),
    );
  }
}
