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
  final bool useMaterial3;
  final int selectedColor;
  final bool isDarkmode;
  final double sizeText; // Añadir propiedad para el tamaño de texto

  AppTheme({
    this.useMaterial3 = true,
    this.selectedColor = 0,
    this.isDarkmode = false,
    this.sizeText = 18, // Inicializar tamaño de texto por defecto
  });

  ThemeData getTheme() => ThemeData(
        useMaterial3: useMaterial3,
        brightness: isDarkmode ? Brightness.dark : Brightness.light,
        colorSchemeSeed: colorList[selectedColor],
        appBarTheme: AppBarTheme(
          backgroundColor: colorList[selectedColor],
          iconTheme: const IconThemeData(color: Colors.white),
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
        ),
        textTheme: TextTheme(
          displayLarge: TextStyle(
              fontSize: 45, color: isDarkmode ? Colors.white : Colors.black),
          bodyLarge: TextStyle(
              fontSize: sizeText, // Usar la propiedad fontSize
              color: isDarkmode ? Colors.white70 : Colors.black87),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: colorList[selectedColor],
            textStyle: const TextStyle(fontSize: 16),
          ),
        ),
      );
}
