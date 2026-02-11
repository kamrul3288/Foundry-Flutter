import 'package:flutter/material.dart';
import 'package:getit_x/get_it_x.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetitMainScreen();
  }
}
