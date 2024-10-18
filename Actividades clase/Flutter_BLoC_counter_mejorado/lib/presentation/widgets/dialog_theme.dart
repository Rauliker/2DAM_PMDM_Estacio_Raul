import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contador/presentation/bloc/theme/theme_bloc.dart';
import 'package:flutter_contador/presentation/bloc/theme/theme_events.dart';

void showThemesDialog(BuildContext context) {
  final ThemeBloc themeBloc = context.read<ThemeBloc>(); // Obtiene el ThemeBloc
  final currentThemeState = themeBloc.state.currentTheme;

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
                    // Emitimos un estado temporal para que los cambios sean visibles inmediatamente
                    themeBloc.add(ThemeSelected(
                        selectedColor: value.round(), isDarkMode: isDarkMode));
                  },
                ),
                SwitchListTile(
                  title: const Text('Modo oscuro'),
                  value: isDarkMode,
                  onChanged: (bool? value) {
                    setState(() {
                      isDarkMode = value ?? false;
                    });
                    // Emitimos un estado temporal para que los cambios sean visibles inmediatamente
                    themeBloc.add(ThemeSelected(
                        selectedColor: sliderValue.round(),
                        isDarkMode: isDarkMode));
                  },
                ),
              ],
            );
          },
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              // Aplica el tema temporal como definitivo
              themeBloc.add(ApplyTheme());
              Navigator.of(context).pop(); // Cierra el diálogo
            },
            child: const Text('Aceptar'),
          ),
          ElevatedButton(
            onPressed: () {
              // Cancela la selección de tema temporal y restaura el tema anterior
              themeBloc.add(CancelTheme());
              Navigator.of(context).pop(); // Cierra el diálogo
            },
            child: const Text('Cancelar'),
          ),
        ],
      );
    },
  );
}
