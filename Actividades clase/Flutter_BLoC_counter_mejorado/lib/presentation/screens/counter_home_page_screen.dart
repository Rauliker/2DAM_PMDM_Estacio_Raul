import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contador/presentation/bloc/counter/counter_bloc.dart';
import 'package:flutter_contador/presentation/bloc/counter/counter_state.dart';
import 'package:flutter_contador/presentation/widgets/counter_buttons_widget.dart';
import 'package:flutter_contador/presentation/widgets/counter_drawer_widget.dart';
import 'package:flutter_contador/presentation/widgets/dialog_theme.dart';
import 'package:flutter_contador/presentation/bloc/theme/theme_bloc.dart'; // Asegúrate de importar el ThemeBloc

class CounterHomePageScreen extends StatelessWidget {
  const CounterHomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtiene el estado del tema desde el Bloc
    final themeState = context
        .watch<ThemeBloc>()
        .state
        .currentTheme; // Asegúrate de obtener el tema actual

    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Text('Contador ${state.transactionCount}');
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text(
                  "Cuenta: ${state.counter}", // Corrige a `state.counter`
                  style: TextStyle(
                    fontSize:
                        themeState.sizeText, // Usa el tamaño de texto del tema
                    color: themeState.isDarkmode ? Colors.white : Colors.black,
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              showThemesDialog(context);
            },
            child: Text(
              'Temas',
              style: TextStyle(
                fontSize:
                    themeState.sizeText, // Usa el tamaño de texto del tema
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: const CounterButtonsWidget(),
      drawer: const CounterDrawerWidget(),
    );
  }
}
