import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(255, 255, 145, 0);

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.blueGrey,
  Colors.transparent,
  Colors.red,
  Colors.green
];

class AppTheme {
  final int selectedColor;

  AppTheme({required this.selectedColor})
      : assert(selectedColor >= 0, "The index has to be greater than 0"),
        assert(selectedColor <= _colorThemes.length,
            "The index may not be greater than the themes");

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true,
        colorSchemeSeed: _colorThemes[selectedColor],
        brightness: Brightness.dark);
  }
}
