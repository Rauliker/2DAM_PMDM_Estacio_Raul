import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contador/presentation/bloc/theme/theme_bloc.dart';
import 'package:flutter_contador/presentation/bloc/counter/counter_bloc.dart';
import 'package:flutter_contador/presentation/bloc/theme/theme_state.dart';
import 'package:flutter_contador/presentation/screens/counter_home_page_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(
            create: (context) => ThemeBloc()), // Aquí se agrega el ThemeBloc
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Contador',
            theme: themeState.appTheme.getTheme(), // Utiliza el tema del estado
            home: const CounterHomePageScreen(),
          );
        },
      ),
    );
  }
}
