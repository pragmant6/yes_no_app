import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF6200EE);

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.purple,
];

class AppTheme {
  final int selectedColorTheme;

  AppTheme({this.selectedColorTheme = 0})
    : assert(
        selectedColorTheme >= 0 && selectedColorTheme < _colorThemes.length - 1,
        'los colores disponibles son de 0 a ${_colorThemes.length - 1}',
      );

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColorTheme],
      brightness: Brightness.dark,
    );
  }
}
