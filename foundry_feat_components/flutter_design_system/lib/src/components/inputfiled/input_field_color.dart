import 'package:flutter/material.dart';

class AppInputColor {
  final Color fillColor;
  final Color activeBorder;
  final Color inactiveBorder;
  final Color errorBorder;
  final Color textColor;
  final Color labelColor;
  final Color? labelFocusColor;

  const AppInputColor({
    required this.fillColor,
    required this.activeBorder,
    required this.inactiveBorder,
    required this.errorBorder,
    required this.textColor,
    required this.labelColor,
    this.labelFocusColor,
  });

  factory AppInputColor.standard({
    required Color fillColor,
    required Color activeBorder,
    required Color inactiveBorder,
    Color errorBorder = Colors.red,
    Color textColor = Colors.black,
    Color labelColor = Colors.grey,
    Color? labelFocusColor,
  }) {
    return AppInputColor(
      fillColor: fillColor,
      activeBorder: activeBorder,
      inactiveBorder: inactiveBorder,
      errorBorder: errorBorder,
      textColor: textColor,
      labelColor: labelColor,
      labelFocusColor: labelFocusColor,
    );
  }
}
