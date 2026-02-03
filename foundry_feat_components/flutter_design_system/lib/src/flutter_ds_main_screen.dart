import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/theme/extensions/app_typography_theme.dart';
import 'package:flutter_design_system/src/theme/app_color_scheme.dart';
import 'package:flutter_design_system/src/theme/extensions/app_button_theme.dart';
import 'package:flutter_design_system/src/ui_showcase/buttons_screen.dart';
import 'package:flutter_design_system/src/ui_showcase/texts_screen.dart';

class FlutterDsMainScreen extends StatelessWidget {
  const FlutterDsMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Design System',
      theme: ThemeData(
        extensions: [
          AppButtonTheme.light(),
          AppColorScheme.light(),
          AppTypographyTheme.textStyleTheme(AppColorScheme.light()),
        ],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Design System'),
        ),
        body: _DesignSystemBody(),
      ),
    );
  }
}

class _DesignSystemBody extends StatefulWidget {
  const _DesignSystemBody();

  @override
  State<_DesignSystemBody> createState() => _DesignSystemBodyState();
}

class _DesignSystemBodyState extends State<_DesignSystemBody> {
  var disable = false;
  void changeState() {
    setState(() {
      disable = !disable;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ActionButton(
            title: "Buttons",
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ButtonsScreen())),
          ),
          _ActionButton(
            title: "Texts",
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const TextsScreen())),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({required this.title, required this.onTap});
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        minimumSize: Size.zero,
        padding: EdgeInsets.all(4),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        title,
        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500, fontSize: 15),
      ),
    );
  }
}
