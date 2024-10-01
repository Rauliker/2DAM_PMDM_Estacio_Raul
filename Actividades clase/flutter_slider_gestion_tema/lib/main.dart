import 'package:flutter/material.dart';
import 'package:flutter_ejemplo_gestion_tema/config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedColor = 4;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme(selectedColor: _selectedColor, isDarkmode: false);

    return MaterialApp(
      theme: appTheme.getTheme(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Ejemplo con ThemeData",
            textDirection: TextDirection.ltr,
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("gestionando temas"),
            Slider(
              value: _selectedColor.toDouble(),
              min: 0,
              max: 8,
              divisions: 8,
              label: _selectedColor.toString(),
              onChanged: (double value) {
                setState(() {
                  _selectedColor = value.toInt();
                  appTheme.setSelectedColor(_selectedColor);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
