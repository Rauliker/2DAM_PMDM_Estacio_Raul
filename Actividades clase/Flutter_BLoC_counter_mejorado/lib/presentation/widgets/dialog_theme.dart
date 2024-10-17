import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contador/presentation/bloc/theme/theme_bloc.dart';
import 'package:flutter_contador/presentation/bloc/theme/theme_events.dart';

void showThemesDialog(BuildContext context) {
  final ThemeBloc themeBloc = context.read<ThemeBloc>(); // Obtén el ThemeBloc
  final currentThemeState = themeBloc.state.appTheme;

  double sliderValue = currentThemeState.selectedColor.toDouble();
  bool isDarkMode = currentThemeState.isDarkmode;

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Seleccionar Tema'),
        content: StatefulBuilder(
          builder: (context, setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Slider(
                  value: sliderValue,
                  max: 8,
                  divisions: 8,
                  label: sliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      sliderValue = value;
                    });
                    themeBloc.add(ThemeChanged(value.round(),
                        isDarkMode)); // Envía el evento ThemeChanged
                  },
                ),
                SwitchListTile(
                  title: const Text('Modo oscuro'),
                  value: isDarkMode,
                  onChanged: (bool? value) {
                    setState(() {
                      isDarkMode = value ?? false;
                    });
                    themeBloc.add(ThemeChanged(sliderValue.round(),
                        isDarkMode)); // Envía el evento ThemeChanged
                  },
                ),
              ],
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cerrar'),
          ),
        ],
      );
    },
  );
}
