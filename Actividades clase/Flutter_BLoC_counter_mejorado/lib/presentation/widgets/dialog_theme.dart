import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contador/presentation/bloc/theme/theme_bloc.dart';
import 'package:flutter_contador/presentation/bloc/theme/theme_events.dart';

void showThemesDialog(BuildContext context) {
  final ThemeBloc themeBloc = context.read<ThemeBloc>(); // Obtiene el ThemeBloc
  final currentThemeState = themeBloc.state.currentTheme;

  double sliderValue = currentThemeState.selectedColor.toDouble();
  bool isDarkMode = currentThemeState.isDarkmode;
  double sizeText =
      currentThemeState.sizeText; // Mantén el tamaño de texto actual
  bool closeDialog = false;

  // Inicializa el controlador del TextField
  TextEditingController sizeTextController =
      TextEditingController(text: currentThemeState.sizeText.toString());

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
                Text(
                  "Cambiar el tamaño",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                TextField(
                  controller: sizeTextController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter
                        .digitsOnly, // Solo acepta dígitos
                  ],
                  decoration: const InputDecoration(
                    labelText: 'Pon un número',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    // Convierte el valor de entrada a entero
                    double? newSize = double.tryParse(value);
                    if (newSize! < 18) {
                      newSize = 18;
                    } else if (newSize > 50) {
                      newSize = 50;
                    }
                    sizeText = newSize;
                    setState(() {
                      // Emitimos un estado temporal para que los cambios sean visibles inmediatamente
                      themeBloc.add(ThemeSelected(
                        selectedColor: sliderValue.round(),
                        isDarkMode: isDarkMode,
                        sizeText: sizeText, // Usa el nuevo tamaño del texto
                      ));
                    });
                  },
                ),
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
                      selectedColor: value.round(),
                      isDarkMode: isDarkMode,
                      sizeText: sizeText, // Mantener el tamaño de texto actual
                    ));
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
                      isDarkMode: isDarkMode,
                      sizeText: sizeText, // Mantener el tamaño de texto actual
                    ));
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
              closeDialog = true;
              Navigator.of(context).pop(); // Cierra el diálogo
            },
            child: const Text('Aceptar'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); // Cierra el diálogo
            },
            child: const Text('Cancelar'),
          ),
        ],
      );
    },
  ).then((value) {
    if (closeDialog == false) {
      // Cancela la selección de tema temporal y restaura el tema anterior
      themeBloc.add(CancelTheme());
    }
  });
}
