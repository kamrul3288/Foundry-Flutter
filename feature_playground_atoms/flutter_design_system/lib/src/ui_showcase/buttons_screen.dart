import 'package:flutter/material.dart';
import '../components/button/app_button_types.dart';
import '../components/button/app_filled_button.dart';
import '../components/button/app_icon_button.dart';
import '../components/button/app_outline_button.dart';
import '../components/button/app_text_button.dart';

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
            ///========================== App filled button ========================
            AppFilledButton.text(
              "Filled Rounded Button",
              onPressed: () {},
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppFilledButton.icon(
                  Icon(Icons.add),
                  onPressed: () {},
                ),

                AppFilledButton.icon(
                  Icon(Icons.add),
                  onPressed: () {},
                  style: AppFilledButtonStyle(shape: AppButtonShape.circle),
                ),
                AppFilledButton.icon(
                  Icon(Icons.add),
                  onPressed: () {},
                  style: AppFilledButtonStyle(shape: AppButtonShape.pill),
                ),
              ],
            ),

            AppFilledButton.text(
              "Filled Rounded Button",
              onPressed: () {},
              isLoading: true,
            ),

            ///========================== App outline button ========================
            SizedBox(height: 24),
            AppOutlineButton.text(
              "Outline Rounded Button",
              onPressed: () {},
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppOutlineButton.icon(
                  Icon(Icons.add),
                  onPressed: () {},
                ),

                AppOutlineButton.icon(
                  Icon(Icons.add),
                  onPressed: () {},
                  style: AppOutlineButtonStyle(shape: AppButtonShape.circle),
                ),
                AppOutlineButton.icon(
                  Icon(Icons.add),
                  onPressed: () {},
                  style: AppOutlineButtonStyle(shape: AppButtonShape.pill),
                ),
              ],
            ),

            AppOutlineButton.text(
              "Outline Rounded Button",
              onPressed: () {},
              isLoading: true,
            ),

            ///========================== App text button ========================
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppTextButton(
                  "Text Button",
                  onPressed: () {},
                ),

                AppTextButton(
                  "Text Button",
                  onPressed: () {},
                  isLoading: true,
                ),

                AppTextButton(
                  "Logout",
                  onPressed: () {},
                  style: AppTextButtonStyle(leading: Icon(Icons.logout)),
                ),
              ],
            ),

            ///========================== App icon button ========================
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AppIconButton(
                  Icon(Icons.logout, size: 24),
                  onPressed: () {},
                ),

                AppIconButton(
                  Icon(Icons.login, size: 24),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
