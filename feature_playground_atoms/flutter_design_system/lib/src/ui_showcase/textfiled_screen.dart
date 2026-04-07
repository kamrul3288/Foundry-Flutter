import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/components/inputfiled/app_input_text_filed.dart';

class TextFiledScreen extends StatelessWidget {
  const TextFiledScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('TextFiled Screen')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 10,
          children: [
            AppTextField(
              label: 'Name',
              hint: 'Outline Input',
              variant: AppInputVariant.outline,
              prefixIcon: const Icon(Icons.person),
            ),

            AppTextField(
              label: 'Filled Input',
              hint: 'Email',
              variant: AppInputVariant.filled,
              shape: AppInputShape.rounded,
            ),

            AppTextField(
              label: 'Name',
              hint: 'Outline Input Error',
              variant: AppInputVariant.outline,
              errorText: "Name is invalid",
            ),

            AppTextField(
              label: 'Name',
              hint: 'Outline Pill Input',
              variant: AppInputVariant.outline,
              shape: AppInputShape.pill,
            ),

            AppTextField(
              label: 'Filled Pill Input',
              hint: 'Email',
              variant: AppInputVariant.filled,
              shape: AppInputShape.pill,
            ),

            AppTextField(
              label: 'Underline Input',
              hint: 'Password',
              variant: AppInputVariant.underline,
            ),
          ],
        ),
      ),
    );
  }
}
