import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/components/structure/app_scaffold.dart';
import 'package:flutter_design_system/src/components/structure/app_topbar.dart';

class AppScaffoldScreen extends StatelessWidget {
  const AppScaffoldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppTopBar(
        title: 'Scaffold & TopBar',
      ),
      isLoading: true,
      body: Center(
        child: Text('Scaffold & TopBar'),
      ),
    );
  }
}
