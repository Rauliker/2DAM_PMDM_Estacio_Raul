import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_listado/presentations/bloc/characters_bloc.dart';
import 'package:flutter_listado/presentations/bloc/theme/theme_bloc.dart';
import 'package:flutter_listado/presentations/bloc/theme/theme_state.dart';
import 'package:flutter_listado/presentations/screens/cahracters_screen.dart';
import 'injection_container.dart' as injection_container;

void main() async {
  await injection_container.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => injection_container.sl<CharacterBloc>()),
          BlocProvider(create: (context) => ThemeBloc()),
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, themeState) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: themeState.currentTheme.getTheme(),
              home: const CharactersScreen(),
            );
          },
        ));
  }
}
