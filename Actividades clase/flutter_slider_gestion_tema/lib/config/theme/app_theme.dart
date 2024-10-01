import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent,
];

class AppTheme {
  final bool _useMaterial3;
  int _selectedColor;
  final bool _isDarkmode;

  AppTheme({
    bool useMaterial3 = true,
    int selectedColor = 0,
    bool isDarkmode = false,
  })  : _useMaterial3 = useMaterial3,
        _selectedColor = selectedColor,
        _isDarkmode = isDarkmode;

  bool get useMaterial3 => _useMaterial3;
  int get selectedColor => _selectedColor;
  bool get isDarkmode => _isDarkmode;

  void setSelectedColor(int value) {
    _selectedColor = value;
  }

  ThemeData getTheme() => ThemeData(
        useMaterial3: _useMaterial3,
        brightness: _isDarkmode ? Brightness.dark : Brightness.light,
        colorSchemeSeed: colorList[_selectedColor],
        appBarTheme: AppBarTheme(
            color: colorList[_selectedColor],
            iconTheme: const IconThemeData(color: Colors.white),
            titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20)),
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontSize: 18, color: Colors.black87),
        ),
      );
}
